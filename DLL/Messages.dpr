library Messages;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs;

type
  PElement = ^TElement;

  TElement = record
    Next    : PElement;
    Name    : String[100];
    Surname : String[100];
    Address : String[100];
    Number  : Integer;
  end;

{$R *.res}

procedure LoadedMsg;
begin
  ShowMessage('DB has been loaded successfully.');
end;

procedure SavedMsg;
begin
  ShowMessage('DB has been saved successfully.');
end;

function Compare(e1, e2 : PElement): Integer;
begin
  Result := CompareStr(e1.Surname, e2.Surname);
  if Result = 0 then
    Result := e1.Number - e2.Number;
end;

exports
  LoadedMsg, SavedMsg, Compare;
begin

end.
