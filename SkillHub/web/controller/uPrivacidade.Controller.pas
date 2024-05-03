unit uPrivacidade.Controller;

interface
uses uPrivacidade.Services, uPrivacidade.Model;
type
 TPrivacidadeController = class
   private
    FServices :TdmPrivacidadeServices;
   public
   constructor Create;
   destructor Destroy;

   function ObterPrivacidadeUsuario(ACodUsuario:string):TPrivacidadeModel;
   function SalvarPrivacidadeUsuario(AModel:TPrivacidadeModel):Boolean;
 end;

implementation

uses
  System.SysUtils;

{ TPrivacidadeController }

constructor TPrivacidadeController.Create;
begin
  FServices := TdmPrivacidadeServices.Create(nil);
end;

destructor TPrivacidadeController.Destroy;
begin
  FreeAndNil(FServices);
end;

function TPrivacidadeController.ObterPrivacidadeUsuario(ACodUsuario: string): TPrivacidadeModel;
begin
  Result := FServices.ObterPrivacidadeUsuario(ACodUsuario);
end;

function TPrivacidadeController.SalvarPrivacidadeUsuario( AModel: TPrivacidadeModel): Boolean;
begin
  Result := FServices.SalvarPrivacidadeUsuario(AModel);
end;

end.
