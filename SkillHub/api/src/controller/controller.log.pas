unit controller.log;

interface

uses System.sysUtils, vcl.forms, System.Classes;

procedure Log(AStr:string);


implementation

procedure Log(AStr:string);
var
 LArqLog:string;
 LFile:TStringList;
 LArquivo: TextFile;
begin

  LArqLog := (ExtractFilePath(Application.ExeName) + 'SkillHubLog.txt');

  AssignFile(LArquivo, LArqLog);
  if FileExists(LArqLog) then
    Append(LArquivo)
  else
    ReWrite(LArquivo);

  try
    WriteLn(LArquivo,(''''+ FormatDateTime('dd/mm/yyyy', now) + ' - ' + FormatDateTime('hh:nn:ss',now) + '''' + AStr));
  finally
    CloseFile(LArquivo);
  end;

end;

end.
