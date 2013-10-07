program Phones;

uses
  Vcl.Forms,
  Winapi.Windows,
  Dialogs,
  Main in '..\Phonebook\Main.pas' {Form1},
  LinkedList in '..\Phonebook\LinkedList.pas',
  AddClient in '..\Phonebook\AddClient.pas' {AddForm},
  EditClient in '..\Phonebook\EditClient.pas' {EditForm},
  SearchClient in '..\Phonebook\SearchClient.pas' {SearchForm},
  Vcl.Themes,
  Vcl.Styles,
  System.UITypes;

{$R *.res}

var
  Mutex: THandle;

begin
  Mutex := CreateMutex(nil, True, 'OneInstance_dvfkdshdjdsd');
  if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    MessageDlg('Already running', TMsgDlgType.mtError, [mbOK], 0);
    halt;
  end
  else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'Phonebook';
    Application.CreateForm(TForm1, Form1);
    Application.CreateForm(TSearchForm, SearchForm);
    Application.Run;
  end;

end.
