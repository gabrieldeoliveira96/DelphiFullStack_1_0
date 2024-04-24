unit uHelpersFrames;

interface

uses
  uniGUIFrame, stdCtrls, sysUtils, System.Classes, System.Variants;

 type
   HelperUniFrame = Class helper for TUniFrame
     Procedure CentralizaTela();
     function JSID(AIDReferencia:String): String;
   End;

implementation

uses Vcl.Forms;

Procedure HelperUniFrame.CentralizaTela();
begin
   Self.Left :=  Round((Screen.Width  / 2)   -  (Self.Width / 2));
   Self.Top  :=  Round((Screen.Height / 2)   - (Self.Height / 2)) - 10;
end;

function HelperUniFrame.JSID(AIDReferencia: String): String;
begin // O1C2_id
   var  ValorReferencia  := Copy(AIDReferencia, 0, pos('_',AIDReferencia)-1); // Copia até o "_"
   var  ValorModificador: Variant := Copy(AIDReferencia, pos('_',AIDReferencia)-2, 1); // Extrai a penultima Posição

   var IsNumber: Boolean := false;
   try
     VarToStr(ValorModificador).ToInteger();
     IsNumber := true;
   except
     IsNumber := False;
   end;

   if not IsNumber then
   begin
      var cAlg : String := VarToStr(ValorModificador);

      var NextChar :String := Chr(Ord(cAlg[1])+1);
      Result := Copy(ValorReferencia, 0, Pos(VarToStr(ValorModificador), AIDReferencia )-1) +NextChar+  Copy(ValorReferencia, pos('_',AIDReferencia)-1,1) + '_id';
   end else
   begin
     var number: integer := StrToInt(VarToStr(ValorModificador));
     inc(number);
                //Valor Inicial de referencia, até a penultima posição                       //Valor modificado    //Ultimo Caracter
     Result := Copy(ValorReferencia, 0, Pos(VarToStr(ValorModificador), AIDReferencia )-1) + number.ToString() +  Copy(ValorReferencia, pos('_',AIDReferencia)-1,1) + '_id';
   end;
end;

end.
