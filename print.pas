unit print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, MSHtml, ActiveX, ComCtrls,
  Printers;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
     
uses treewind;

{$R *.dfm}

procedure TForm2.FormResize(Sender: TObject);
begin
 Button1.Width:=Form2.Width-22;
 Button2.Width:=Form2.Width-22;
end;

procedure TForm2.FormShow(Sender: TObject);
var
 i,j,k,sh,ct: integer;
 s,ss,prob: string;
begin
 prob:='';
 ct:=0;
 RichEdit1.Lines.Assign(Form1.RichEdit1.Lines);
 RichEdit1.Lines.Strings[0]:='[    '+RichEdit1.Lines.Strings[0]+'    ]';
 RichEdit1.Lines.Strings[1]:='[    '+RichEdit1.Lines.Strings[1]+'    ]';
 s:=RichEdit1.Lines.Strings[2];
 for i:=2 to RichEdit1.Lines.Count-1 do
  begin
   s:=RichEdit1.Lines.Strings[i];
   //
   ss:=s;
   for k:=0 to Length(s) do
    begin
     j:=pos('Р',ss);
     if j<>0
     then
      begin
       ct:=ct+1;
       Delete(ss,1,j);
      end;
    end;
    //
   j:=pos('Р',s);
   if j<>0 then
    begin
     ss:=s;
     Delete(ss,1,j);
     if pos('Р',ss)<>0 then // если дальше есть Р
      begin
       prob:='';      
       for sh:=0 to ct-1 do
        begin
         j:=pos('Р',s);
         Delete(s,1,j);
         prob:=prob+'         ';
        end;
       RichEdit1.Lines.Strings[i]:=prob+s;
       prob:='';
      end
     else
      begin
       for sh:=0 to ct-1 do
        begin
         j:=pos('Р',s);
         Delete(s,1,j);
        end;
       RichEdit1.Lines.Strings[i]:='         '+s;
       prob:='         ';
      end;
    end
   else
    begin
     RichEdit1.Lines.Strings[i]:=' -- '+s;
     prob:='';
    end;
   ct:=0;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 Stroka: System.Text; // дл€ печати
 i: integer;
begin
 RichEdit2.Lines.Clear;
 if RichEdit1.SelLength<>0 then
  begin
   RichEdit2.Lines.Add(RichEdit1.Lines.Strings[0]);
   RichEdit2.Lines.Add(RichEdit1.Lines.Strings[1]);
   RichEdit2.Lines.Add(RichEdit1.SelText);
   try
    AssignPrn(Stroka);
    Rewrite(Stroka);
    Printer.Canvas.Font:=RichEdit2.Font;
    for i:=0 to RichEdit2.Lines.Count-1 do
     Writeln(Stroka,RichEdit2.Lines[i]);
    System.Close(stroka);
   except
    ShowMessage('ѕринтер не подключен!');
    System.Close(stroka);
   end;
  end
 else MessageDlg('“екст не выделен!',mtError,[mbOK],0);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
 Stroka: System.Text; // дл€ печати
 i: integer;
begin
 try
  AssignPrn(Stroka);
  Rewrite(Stroka);
  Printer.Canvas.Font:=RichEdit1.Font;
  for i:=0 to RichEdit1.Lines.Count-1 do
   Writeln(Stroka,RichEdit1.Lines[i]);
  System.Close(stroka);
 except
  ShowMessage('ѕринтер не подключен!');
  System.Close(stroka);
 end;
end;

end.
