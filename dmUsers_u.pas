unit dmUsers_u;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TDataModuleUsers = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conUsers : TADOConnection;
    tblUsers : TADOTable;
    dsUsers : TDataSource;
    qryUsers : TADOQuery;

  end;

var
  DataModuleUsers: TDataModuleUsers;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleUsers.DataModuleCreate(Sender: TObject);
begin
conUsers := TADOConnection.Create( DataModuleUsers );
tblUsers := TADOTable.Create( DataModuleUsers );
dsUsers := TDataSource.Create( DataModuleUsers );
qryUsers := TADOQuery.Create( DataModuleUsers );

conUsers.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Users.mdb;Mode=ReadWrite;Persist Security Info=False';
conUsers.LoginPrompt := false;
conUsers.Open;

// Setup tables and query
tblUsers.Connection := conUsers;
tblUsers.TableName := 'Users';

qryUsers.Connection := conUsers;
//qryUsers.DataSource := dsUsers;

// Setup Datasource
//dsUsers.DataSet := tblUsers;
dsUsers.DataSet := qryUsers;

tblUsers.Open;


end;

end.
