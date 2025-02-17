﻿unit requests_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Client, REST.Authenticator.Basic,
  REST.Response.Adapter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON;

type
  TForm2 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bodyExists : boolean;
  public
    { Public declarations }
    function handleRequest(prompt, temperature, max_tokens : String) : String;


  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var apiTextFile : TextFile;
sApiKey, sFileLocation : string;
begin

sFileLocation := 'apikey.txt';
assignFile(apiTextFile, sFileLocation);
reset(apiTextFile);
readln(apiTextFile, sApiKey);

HTTPBasicAuthenticator1.Password := sApiKey;

bodyExists := False;
end;

function TForm2.handleRequest(prompt, temperature, max_tokens: String): String;
var
jValue : TJSONValue;
promptString : String;
begin
promptString := '{"prompt" : "' + prompt + '", "temperature": ' + temperature  +', "max_tokens": ' + max_tokens + '}';
RESTRequest1.ClearBody;
RESTRequest1.AddBody(promptString, TRESTContentType.ctAPPLICATION_JSON);

RESTRequest1.Execute;
jValue := Form2.RESTResponse1.JSONValue;
try
  result := jValue.GetValue<string>('choices[0].text');
except
  result := jValue.ToString;
end;

end;




end.
