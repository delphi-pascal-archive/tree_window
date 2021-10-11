unit textadd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses treewind;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
 i: integer;
begin
 RichEdit1.Lines.Clear;
 OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
 if OpenDialog1.Execute then
  begin
   EditFile:=OpenDialog1.FileName;
   RichEdit1.Lines.LoadFromFile(Editfile);
  end;
 i:=0;
 while i<=RichEdit1.Lines.Count-1 do
  begin
   if Trim(RichEdit1.Lines.Strings[i])=''
   then
    begin
     RichEdit1.Lines.Delete(i);
     i:=i-1;
    end;
    inc(i);
   end;
 Form4.Caption:='Загрузка текста: Всего '+IntToStr(RichEdit1.Lines.Count)+' строк';
end;

procedure TForm4.Button3Click(Sender: TObject);
var
 i: integer;
 Node: TTreeNode;
begin
 Node:=Form1.TreeView1.Selected;

 for i:=0 to RichEdit1.Lines.Count-1 do
  Form1.TreeView1.Items.AddChild(Node,RichEdit1.Lines.Strings[i]);

 RichEdit1.Lines.Clear;

 Close;
end;

procedure TForm4.FormResize(Sender: TObject);
begin
 Button1.Width:=Form4.Width-22;
 Button3.Width:=Form4.Width-22;
end;

procedure TForm4.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 Form4.Caption:='Загрузка текста - '+IntToStr(RichEdit1.Lines.Count)+' строк';
end;

end.
