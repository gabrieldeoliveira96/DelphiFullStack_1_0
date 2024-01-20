unit uConnection;

interface

uses System.SysUtils, System.Classes, REST.Types, REST.Client, System.JSON, System.Generics.Collections;

type
  TParameter = record
    Value: string;
    key: string;
  end;

  TBody = record
    Value: string;
    key: string;
  end;

  TConnection = class
    private
     FRESTClient: TRESTClient;
     FRESTRequest: TRESTRequest;
     FRESTResponse: TRESTResponse;
    public
     constructor Create;
     destructor Destroy;
     function Post(AUrl:string; AParameter: array of string; ABody:TJSONObject; out AResult:string): Boolean; overload;
     function Post(AUrl:string; AParameter: array of string; ABody:TJSONArray; out AResult:string): Boolean; overload;
     function Post(AUrl:string; AParameter: TList<TParameter>; ABody:TList<TBody>; out AResult:string): Boolean; overload;
     function Get(AUrl:string; AParameter: array of string; out AResult:string): Boolean; overload;
     function Get(AUrl:string; AParameter: TList<TParameter>; out AResult:string): Boolean; overload;
     function Put(AUrl:string; AParameter: array of string; ABody:TJSONObject; out AResult:string): Boolean;
     function Delete(AUrl:string; AParameter: array of string; ABody:TJSONObject; out AResult:string): Boolean; overload;
     function Delete(AUrl:string; AParameter: array of string; out AResult:string): Boolean; overload;
  end;


implementation

function TConnection.Post(AUrl:string; AParameter: array of string; ABody:TJSONObject; out AResult:string): Boolean;
var
 LUrl:string;
 i : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for  i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];


    FRESTRequest.ClearBody;
    FRESTRequest.AddBody(ABody);

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmPOST;
    FRESTRequest.Timeout := 60000;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;
end;

constructor TConnection.Create;
begin
  FRESTClient:= TRESTClient.Create(nil);
  FRESTRequest:= TRESTRequest.Create(nil);
  FRESTResponse:= TRESTResponse.Create(nil);

end;

function TConnection.Delete(AUrl: string; AParameter: array of string;
  ABody: TJSONObject; out AResult: string): Boolean;
var
 LUrl:string;
 I : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];

    FRESTRequest.ClearBody;
    FRESTRequest.AddBody(ABody);

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmDELETE;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;
end;

destructor TConnection.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);
end;

function TConnection.Get(AUrl: string; AParameter: TList<TParameter>;
  out AResult: string): Boolean;
var
 LUrl:string;
 i : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;

    FRESTRequest.ContentType.ctAPPLICATION_JSON;
    for var Lparam in AParameter do
      FRESTRequest.Params.AddItem(Lparam.key, Lparam.Value, pkHTTPHEADER, [poDoNotEncode]);


    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmGET;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;
end;

function TConnection.Get(AUrl:string; AParameter: array of string; out AResult:string): Boolean;
var
 LUrl:string;
 i : integer;
begin


  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmGET;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;

end;


function TConnection.Post(AUrl: string; AParameter: array of string;
  ABody: TJSONArray; out AResult: string): Boolean;
var
 LUrl:string;
 i : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];

    FRESTRequest.ClearBody;
    FRESTRequest.AddBody(ABody.ToString,TRESTContentType.ctAPPLICATION_JSON);

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmPOST;
    FRESTRequest.Timeout := 60000;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;
end;


function TConnection.Post(AUrl: string; AParameter: TList<TParameter>;
  ABody: TList<TBody>; out AResult: string): Boolean;
var
 LUrl:string;
 i : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;

    FRESTRequest.ContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED;
    for var LBody in ABody do
      FRESTRequest.Params.AddItem(LBody.key, LBody.Value, pkGETorPOST, [poDoNotEncode]);

    for var Lparam in AParameter do
      FRESTRequest.Params.AddItem(Lparam.key, Lparam.Value, pkHTTPHEADER, [poDoNotEncode]);


    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmPOST;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;
end;

function TConnection.Put(AUrl: string; AParameter: array of string;
  ABody: TJSONObject; out AResult: string): Boolean;
var
 LUrl:string;
 i : Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for  i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];

    FRESTRequest.ClearBody;
    FRESTRequest.AddBody(ABody);

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmPUT;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;

end;


function TConnection.Delete(AUrl: string; AParameter: array of string;
  out AResult: string): Boolean;
var
 LUrl:string;
 i:Integer;
begin

  FRESTRequest.Client:= FRESTClient;
  FRESTRequest.Response:= FRESTResponse;
  try
    LUrl:= AUrl;
    for  i := 0 to pred(length(AParameter)) do
      LUrl := LUrl + '/' + AParameter[i];

    FRESTRequest.ClearBody;

    FRESTClient.BaseURL := LUrl;
    FRESTRequest.Method := rmDELETE;
    FRESTRequest.Execute;

    AResult:= FRESTResponse.Content;
    Result:= FRESTResponse.StatusCode = 200;

  except
    on e: exception do
    begin
      Result := false;
    end;

  end;

end;


end.
