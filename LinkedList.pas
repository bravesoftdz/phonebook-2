unit LinkedList;

interface

uses Vcl.Grids, SysUtils, Vcl.Dialogs;

type
  PElement = ^TElement;

  TElement = record
    Next    : PElement;
    Name    : String[100];
    Surname : String[100];
    Address : String[100];
    Number  : Integer;
  end;

  TComparator = function (elem1, elem2 : PElement) : Integer;

  TLinkedList = class(TObject)
  private
    First : PElement;
    Last  : PElement;
    Elems : Integer;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure Add(Surname, Name, Address : String; Number : Integer);
    procedure Remove(Index : Integer);
    procedure ShowOn(Grid : TStringGrid; Surname : String = ''; Phone : Integer = 0);
    procedure SaveToFile(FileName: String);
    procedure ReadFromFile(FileName: String);
    procedure Sort(comp : TComparator);

    property Count: Integer read Elems;
    function Get(Index: Integer): PElement;
  end;

implementation

constructor TLinkedList.Create;
begin
  inherited;
  First := nil;
  Last  := nil;
  Elems := 0;
end;

function TLinkedList.get(Index: integer): PElement;
var
  Temp: PElement;
begin
  Temp := First;
  while Index > 0 do
  begin
    Temp := Temp.Next;
    Dec(Index);
  end;
  Result := Temp;
end;

procedure TLinkedList.Add(Surname, Name, Address : String; Number : Integer);
var
  Tmp : PElement;
begin
  New(Tmp);
  Tmp.Surname := Surname;
  Tmp.Name    := Name;
  Tmp.Address := Address;
  Tmp.Number  := Number;
  Tmp.Next := nil;

  if First = nil then
  begin
    First := Tmp;
    Last := Tmp;
    First.Next := nil;
  end
  else
  begin
    Last.Next := Tmp;
    Last := Tmp;
  end;
  Inc(Elems);
end;

// name, city
procedure TLinkedList.ShowOn(Grid : TStringGrid; Surname : String = ''; Phone: Integer = 0);
var
  I: integer;
  Temp: PElement;
  Show: boolean;
begin
  Grid.RowCount := 2;

  Temp := First;
  Grid.FixedRows := 1;
  Grid.FixedCols := 0;
  
  if Temp = nil then
    Exit;
  
  I := 1;
  while Temp <> nil do
  begin
    show := True;
    if ((Surname <> '') and (Temp.Surname <> Surname)) then
      show := False;
    if ((Phone <> 0) and (Temp.Number <> Phone)) then
      show := False;

    if show = True then
    begin
      with Grid do
      begin
        RowCount := RowCount + 1;
        Cells[0, I] := IntToStr(I);
        Cells[1, I] := Temp.Surname;
        Cells[2, I] := Temp.Name;
        Cells[3, I] := Temp.Address;
        Cells[4, I] := IntToStr(Temp.Number);
      Inc(I);
      end;
    end;

    Temp := Temp.Next;
  end;
end;

procedure TLinkedList.Remove(Index : Integer);
var
  Temp, prev: PElement;
  k: integer;
begin
  k := 1;
  Temp := First;
  if Index = 1 then
  begin
    First := First.Next;
    Dispose(Temp);
  end;

  if Count = 1 then
  begin
    First := nil;
    Last := nil;
  end;

  if Index > 1 then
  begin
    prev := Temp;
    while Index <> k do
    begin
      prev := Temp;
      Temp := Temp.Next;
      k := k + 1;
    end;
    prev.Next := Temp.Next;
    Dispose(Temp);

    if prev.Next = nil then
      Last := prev;

  end;
end;

destructor TLinkedList.Destroy;
var
  Temp, temp2: PElement;
begin
  Temp := First;
  while Temp <> nil do
  begin
    temp2 := Temp;
    Temp := Temp.Next;
    Dispose(temp2);
  end;
  First := nil;
  Last := nil;

  inherited;
end;

procedure TLinkedList.SaveToFile(FileName : String);
var
  f: file of TElement;
  Temp: PElement;
begin
  try
    try
      Temp := First;
      AssignFile(f, FileName);
      ReWrite(f);
      while Temp <> nil do
      begin
        Write(f, Temp^);
        Temp := Temp.Next;
      end;
    finally
      CloseFile(f);
    end;
  except
    ShowMessage('Cannot save to file');
  end;
end;

procedure TLinkedList.ReadFromFile(FileName : String);
var
  f    : file of TElement;
  Temp : TElement;
begin
  try
    try
      AssignFile(f, FileName);
      Reset(f);
      while not EOF(f) do
      begin
        Read(f, Temp);
        Add(Temp.Surname, Temp.Name, Temp.Address, Temp.Number);
      end;
    finally
      CloseFile(f);
    end;
  except
    ShowMessage('Given data are incorrect');
  end;
end;

function MergeSort(list : PElement; cmp : TComparator) : PElement;
var
  tmp, right, last : PElement;
  next, tail : PElement;
begin
  if (list = Nil) or (list.Next = Nil) then
  begin
    Result := list;
    Exit;
  end;
  tmp   := list;
  right := list;
  last  := list;
  Result := nil;

  while (tmp <> Nil) and (tmp.Next <> Nil) do
  begin
    last  := right;
    right := right.Next;
    tmp   := tmp.Next.Next;
  end;

  last.Next := Nil;

  list  := MergeSort(list,  cmp);
  right := MergeSort(right, cmp);

  while (list <> Nil) or (right <> Nil) do
  begin
    if right = Nil then
    begin
      next := list;
      list := list.Next;
    end else if list = Nil then
    begin
      next  := right;
      right := right.Next;
    end else if cmp(list, right) < 0 then
    begin
      next := list;
      list := list.Next;
    end else
    begin
      next  := right;
      right := right.Next;
    end;
    if Result = Nil then
    begin
      Result := next;
      tail   := Result;
    end
    else
    begin
      tail.Next := next;
      tail := tail.Next;
    end;
  end;
end;

procedure TLinkedList.Sort(comp : TComparator);
begin
  First := MergeSort(First, comp);
end;

end.
