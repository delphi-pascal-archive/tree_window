unit psd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XPMan;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    RichEdit2: TRichEdit;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  shif_str: string;

implementation

uses treewind;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
 // s:='doiyrewdhimnbvyxzwghlomu6se56cn8p09nu7yc56rzw4ex4jlicgs4w5dnklu9klnmlfgx3q4awyu';
 if Trim(Edit1.Text)=''
 then Application.Terminate;
 //
 if Edit1.Text=shif_str // s[68]+s[6]+s[43]+s[40]+s[79]+s[5]+s[78]
 then
  begin
   Form1.Show;
   Form3.Hide;
  end
 else Halt;
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then Button1.Click;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TForm3.FormCreate(Sender: TObject);
Label M;
var
 i,j,j1,x,n,s,s1,tt: integer;
 st,a:string;
begin
 // ïàğîëü êàê ïğè âõîäå â Win XP
 Edit1.Font.Name:='Wingdings';
 Edit1.PasswordChar:='l'; // ñèìâîë "òî÷êà"
 //
 j:=97365;
 j1:=j;
 Edit6.Text:='1234567890ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõö÷øùúûüışÿABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_¹<>()[]{}`';
 try
  RichEdit2.Lines.LoadFromFile('conf.ps');
 except
  MessageDlg('Ôàéë "conf.ps" íå íàéäåí!',mtError,[mbOK],0);
  Close;
 end;
 st:='1234567890ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞßàáâãäåæçèéêëìíîïğñòóôõö÷øùúûüışÿABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_¹<>()[]{}`';
 a:=RichEdit2.Lines.Strings[0];
 x:=length(a);
 try
  for i:=1 to x do
   begin
    if pos(a[i],Edit6.Text)<>0
    then
     begin
      Edit6.SelStart:=pos(a[i],Edit6.Text)-1;
      n:=Edit6.SelStart;
      s1:=n+1;
      j:=j1;
      s:=s1-j;
      if ((s<=159) and (s>=0))
      then
       begin
        s:=s1-j;
        a[i]:=st[s];
        goto M;
       end;
      j:=j1-n-1;
      repeat
       tt:=j-159;
       s:=abs(tt);
       j:=s;
      until (s<=159);
      s:=159-s;
      a[i]:=st[s];
      M:
     end
    else
   end;
  shif_str:=a;
 except
  MessageDlg('Îøèáêà îòêğûòèÿ ïàğîëÿ!',mtError,[mbOK],0);
 end;
end;

end.
