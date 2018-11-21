// Fill missing values in IDF1 with values of IDF2

program IDFmerge;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  uTSingleESRIgrid,
  AVGRIDIO,
  math,
  SysUtils,
  uError,
  uIDFmerge in 'uIDFmerge.pas' {MainForm};

var
  iResult, i, j, CellDepth: Integer;
  aValue1, X, Y, aValue2: Single;
const
  MaxCellDepth = 5;

{$R *.res}

Procedure ShowArgumentsAndTerminate;
begin
  ShowMessage('idfMerge IDF1 IDF2 IDFout');
  Application.Terminate;
end;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  if (not (ParamCount() = 3)) then
    ShowArgumentsAndTerminate;

  MainForm.IDF1 := TSingleESRIgrid.InitialiseFromIDFfile(ParamStr(1), iResult,
    MainForm);
  if not iResult = cNoError then
    ShowArgumentsAndTerminate;

  MainForm.IDF2 := TSingleESRIgrid.InitialiseFromIDFfile(ParamStr(2), iResult,
    MainForm);
  if not iResult = cNoError then
    ShowArgumentsAndTerminate;

  with MainForm.IDF1 do
  begin
    for i := 1 to NRows do
    begin
      for j := 1 to NCols do
      begin
        aValue1 := GetValue(i, j);
        if (aValue1 = MissingSingle) then
        begin
          GetCellCentre(i, j, x, y);
          MainForm.IDF2.GetValueNearXY(x, y, MaxCellDepth, CellDepth, aValue2);
          if (aValue2 <> MissingSingle) then
            SetValue(i, j, aValue2); // Fill missing value in IDF1 with value of IDF2
        end; { -if }
      end; { -for j }
    end; { -for i }
    ExportToIDFfile(ParamStr(3))
  end;

  //Application.Run;
end.
