unit EditClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, LinkedList,
  Vcl.ExtCtrls;

type
  TEditForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    SurnameEdit: TLabeledEdit;
    NameEdit: TLabeledEdit;
    AddressEdit: TLabeledEdit;
    NumberEdit: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;
  temp: PElement;

implementation

{$R *.dfm}

procedure TEditForm.Button1Click(Sender: TObject);
begin
  //temp.Name := Edit1.Text;
  //temp.Date := FormatDateTime('ddddd', DateTimePicker1.Date);
  //temp.City := ComboBox1.Text;
  //temp.Price := StrToFloat(Edit2.Text);
  //temp.Sold := StrToInt(Edit3.Text);
  //temp.Cost := StrToFloat(Edit4.Text);
  with Temp^ do
  begin
    Surname := SurnameEdit.Text;
    Name    := NameEdit.Text;
    Address := AddressEdit.Text;
    Number  := StrToInt(NumberEdit.Text);
  end;
  Close;
  temp := nil;
end;

procedure TEditForm.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
