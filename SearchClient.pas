unit SearchClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSearchForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    TypeChoose: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSearch = (SName, Phone);

var
  SearchForm : TSearchForm;
  searchBy   : TSearch;
  Value      : string;
  search     : Boolean;

implementation

{$R *.dfm}

procedure TSearchForm.Button1Click(Sender: TObject);
begin
  SearchClient.Search := true;
  SearchClient.Value := Edit1.Text;
  if TypeChoose.ItemIndex = 0 then
    SearchClient.searchBy := SName
  else
    SearchClient.searchBy := Phone;
  Close;
end;

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  SearchClient.Search := false;
end;

end.
