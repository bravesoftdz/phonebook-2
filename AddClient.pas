unit AddClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, LinkedList,
  Vcl.ExtCtrls;

type
  TAddForm = class(TForm)
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    SurnameEdit: TLabeledEdit;
    NameEdit: TLabeledEdit;
    AddressEdit: TLabeledEdit;
    NumberEdit: TLabeledEdit;
    constructor LoadList(list : TLinkedList);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    List : TLinkedList;
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

constructor TAddForm.LoadList(list : TLinkedList);
begin
  Self.List := list;
  Create(nil);
end;

procedure TAddForm.Button1Click(Sender: TObject);
begin
  try
    List.Add(SurnameEdit.Text, NameEdit.Text, AddressEdit.Text, StrToInt(NumberEdit.Text));
    Close;
  except
    ShowMessage('Wrong Data.');
  end;
end;

procedure TAddForm.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
