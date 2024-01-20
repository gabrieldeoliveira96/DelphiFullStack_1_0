unit controller.imagens;

interface

uses
  FMX.Graphics, System.Classes, System.NetEncoding, System.SysUtils;

function Base64FromBitmap(Bitmap: TBitmap): string;
function BitmapFromBase64(const base64: string): TBitmap;
function Base64FromStream(const base64: string): TBytesStream;

implementation

function Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);

    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Encode(Input, Output);
      Result := Output.DataString;
    finally
      Encoding.Free;
      Output.Free;
    end;

  finally
    Input.Free;
  end;
end;

function BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
  Encoding: TBase64Encoding;
begin
  try
    Input := TStringStream.Create(base64, TEncoding.ASCII);
    try
      Output := TBytesStream.Create;
      try
        Encoding := TBase64Encoding.Create(0);
        Encoding.Decode(Input, Output);

        Output.Position := 0;
        Result := TBitmap.Create;
        try
          Result.LoadFromStream(Output);
        except
          Result.Free;
          raise;
        end;
      finally
        Encoding.DisposeOf;
        Output.Free;
      end;
    finally
      Input.Free;
    end;
  except
    Result:= nil;
  end;
end;


function Base64FromStream(const base64: string): TBytesStream;
var
  Input: TStringStream;
  Encoding: TBase64Encoding;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Result := TBytesStream.Create;
    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Decode(Input, Result);

      Result.Position := 0;
    finally
      Encoding.DisposeOf;
    end;
  finally
    Input.Free;
  end;
end;

end.
