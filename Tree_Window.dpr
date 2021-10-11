program Tree_Window;

uses
  Forms,
  psd in 'psd.pas' {Form3},
  treewind in 'treewind.pas' {Form1},
  print in 'print.pas' {Form2},
  textadd in 'textadd.pas' {Form4},
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Dialogs,
  StdCtrls,
  ComCtrls;

{$R *.res}

var
 Sgl: TStringList;
begin
  Application.Initialize;

  if not FileExists('conf.ps')
  then Exit;

  Sgl:=TStringList.Create;
  Sgl.LoadFromFile('conf.ps');
  if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
  then
   begin
    Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
   end;
  if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal5fp2wQIaiOTyf3hUz6SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
  then
   begin
    Application.CreateForm(TForm3, Form3);
    Application.CreateForm(TForm1, Form1);
    Application.CreateForm(TForm4, Form4);
    Form3.Hide;
    Form1.ShowModal;
    Application.Run;
   end;
  Sgl.Free; 
end.

