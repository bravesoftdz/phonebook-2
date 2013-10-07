unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, LinkedList, AddClient, EditClient, SearchClient, ProcessButton;

type
  TForm1 = class(TForm)
    AddNewButton: TButton;
    EditButton: TButton;
    DeleteButton: TButton;
    ShowAllButton: TButton;
    StringGrid1: TStringGrid;
    LoadButton: TButton;
    SaveButton: TButton;
    ClearButton: TButton;
    SortButton: TProcessButton;
    SearchButton: TProcessButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure AddNewButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure ShowAllButtonClick(Sender: TObject);
    procedure SortButtonClick(Sender: TObject);

  private
    { Private declarations }
    List : TLinkedList;
  public

    { Public declarations }
  end;

procedure LoadedMsg; external 'Messages.dll';
procedure SavedMsg;  external 'Messages.dll';
function Compare(e1, e2 : PElement): Integer; external 'Messages.dll';

var
  Form1: TForm1;
  OpenDialog: TOpenDialog;
  SaveDialog: TSaveDialog;

implementation

{$R *.dfm}

procedure TForm1.AddNewButtonClick(Sender: TObject);
var
  WinDo: TAddForm;
begin
  WinDo := TAddForm.LoadList(List);
  WinDo.ShowModal;
  List.ShowOn(StringGrid1);
  WinDo.Free;
end;

procedure TForm1.EditButtonClick(Sender: TObject);
var
  Edit: TEditForm;
  temp: PElement;
begin
  // sth
  if List.Count = 0 then
    Exit;

  try
    Edit := TEditForm.Create(nil);

    temp := List.Get(StringGrid1.Row-1);
    Edit.NameEdit.Text := temp.Name;
    Edit.SurnameEdit.Text := temp.Surname;
    Edit.AddressEdit.Text := temp.Address;
    Edit.NumberEdit.Text := IntToStr(temp.Number);
    EditClient.temp := temp;
    Edit.ShowModal;
    List.ShowOn(StringGrid1);
  finally
    Edit.Free;
  end;
end;

procedure TForm1.DeleteButtonClick(Sender: TObject);
var
  bs: integer;
begin
  if List.Count = 0 then
    Exit;
  bs := MessageDlg('Delete selected record?', mtConfirmation,
    mbOKCancel, 0);
  if bs = mrOK then
  begin
    List.Remove(StringGrid1.Row - 1);
    List.ShowOn(StringGrid1);
  end;

end;

procedure TForm1.SearchButtonClick(Sender: TObject);
var
  SWin: TSearchForm;
begin
  if List.Count = 0 then
    Exit;
  SWin := TSearchForm.Create(nil);
  SWin.ShowModal;
  if SearchClient.Search = True then
  begin
    if SearchClient.searchBy = Phone then
      List.ShowOn(StringGrid1, '', StrToInt(SearchClient.Value))
    else
      List.ShowOn(StringGrid1, SearchClient.Value, 0);
  end;

  SWin.Free;
end;

procedure TForm1.SortButtonClick(Sender: TObject);
begin
  if List.Count = 0 then
    Exit;
  List.Sort(Compare);
  List.ShowOn(StringGrid1);
end;

procedure TForm1.ShowAllButtonClick(Sender: TObject);
begin
  List.ShowOn(StringGrid1);
end;

procedure TForm1.LoadButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    List.ReadFromFile(OpenDialog.FileName);
    List.ShowOn(StringGrid1);
    LoadedMsg;
  end;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  SaveDialog := TSaveDialog.Create(self);
  SaveDialog.Title := 'Save Database';
  SaveDialog.InitialDir := GetCurrentDir;
  SaveDialog.Filter := 'Client DB|*.cdb';
  SaveDialog.DefaultExt := 'txt';
  if SaveDialog.Execute then
  begin
    List.SaveToFile(SaveDialog.FileName);
    SavedMsg;
  end;
  SaveDialog.Free;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
var
  n: integer;
begin
  for n := 1 to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[n].Clear;
  StringGrid1.RowCount := 0;

  List.Destroy;
  List.ShowOn(StringGrid1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  List := TLinkedList.Create;
  StringGrid1.Cells[0, 0] := 'Id';
  StringGrid1.Cells[1, 0] := 'Surname';
  StringGrid1.Cells[2, 0] := 'Name';
  StringGrid1.Cells[3, 0] := 'Address';
  StringGrid1.Cells[4, 0] := 'Phone Number';
  StringGrid1.ColWidths[0] := 40;
  StringGrid1.ColWidths[5] := 128;

  List.ShowOn(StringGrid1);

  OpenDialog := TOpenDialog.Create(self);
  OpenDialog.InitialDir := GetCurrentDir;
  OpenDialog.Options := [ofFileMustExist];
  OpenDialog.Filter := 'Client DB|*.cdb';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  OpenDialog.Free;
end;

end.
