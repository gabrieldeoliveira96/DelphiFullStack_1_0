unit uLogin.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types, SysUtils;

{$M+}
type
  TLoginNovoUsuario = class(TJsonDTO)
    private
      [JSONName('cod')]
      FCod: string;

      [JSONName('email')]
      FEmail: string;

      [JSONName('cpf')]
      FCpf: string;

      [JSONName('foto')]
      FFoto: string;

      [JSONName('nome')]
      FNome: string;

      [JSONName('tipoUsuario')]
      FTipoUsuario: string;
    protected
      procedure PopularObjeto(AJsonString: string);
    public
      property Cpf: string read FCpf write FCpf;
      property Foto: string read FFoto write FFoto;
      property Nome: string read FNome write FNome;
      property Email: string read FEmail write FEmail;
      property Cod: String read FCod write FCod;
      property TipoUsuario: string read FTipoUsuario write FTipoUsuario;
      function getInstanciaObj(var objAtual: TLoginNovoUsuario): TLoginNovoUsuario;
      function ObjToJsonString: string;
      function ValidarNovoCadastroDeUsuario(AJsonString: String):boolean;
  end;

  TLoginModel = class(TLoginNovoUsuario)
  private
    [JSONName('senha')]
    FSenha: string;
  published
    property Senha: string read Fsenha write FSenha;
   public

    function ValidarLogin(AJsonString: String):boolean;
  end;

implementation

{ TRoot }
 uses REST.Json;

function TLoginNovoUsuario.getInstanciaObj(
  var objAtual: TLoginNovoUsuario): TLoginNovoUsuario;
begin
  with objAtual do
  begin
    Cod  := self.cod;
    Cpf  :=  self.Cpf;
    Foto :=  self.Foto;
    Nome :=  self.Nome;
    Email:= self.Email;
    TipoUsuario:= self.TipoUsuario;
  end;
end;

function TLoginNovoUsuario.ObjToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(self, [joIgnoreEmptyStrings]);
end;

procedure TLoginNovoUsuario.PopularObjeto(AJsonString: string);
begin
  var NewObj := TJson.JsonToObject<TLoginModel>(AJsonString);

  cod :=  NewObj.Cod;
  Cpf :=  NewObj.Cpf;
  Foto:=  NewObj.Foto;
  Nome:=  NewObj.Nome;
  Email:= NewObj.Email;
  TipoUsuario:= NewObj.TipoUsuario;
end;

function TLoginNovoUsuario.ValidarNovoCadastroDeUsuario(
  AJsonString: String): boolean;
begin
   var usuarioCadastrado: Boolean := false;
   usuarioCadastrado := (AJsonString.Contains('Usuario Cadastrado!'));

   Result := usuarioCadastrado;
end;

function TLoginModel.ValidarLogin(AJsonString: string): boolean;
begin
   var usuarioEncontrado: Boolean := false;
   usuarioEncontrado := not (AJsonString.Contains('Usuário não encontrado'));

   if usuarioEncontrado then
     PopularObjeto(AJsonString);

   Result := usuarioEncontrado and (not Email.Trim.IsEmpty);
end;
end.
