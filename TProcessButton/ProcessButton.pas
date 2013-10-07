unit ProcessButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls;

type
  TProcessButton = class(TButton)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Click; override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TProcessButton]);
end;

procedure TProcessButton.Click;
var
  Tmp : TCaption;
begin
  Tmp := Caption;
  Caption := 'In progress...';
  inherited;
  Caption := Tmp;
end;

end.
