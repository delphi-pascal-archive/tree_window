unit treewind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ImgList, ExtCtrls, Printers, Menus,
  ShellApi;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ImageList1: TImageList;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel1: TPanel;
    TreeView1: TTreeView;
    ListBox1: TListBox;
    Button8: TButton;
    Button9: TButton;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    Bevel3: TBevel;
    SpeedButton2: TSpeedButton;
    Bevel4: TBevel;
    CheckBox2: TCheckBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Button7: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button5: TButton;
    Edit4: TEdit;
    Button6: TButton;
    Edit5: TEdit;
    ProgressBar1: TProgressBar;
    Button11: TButton;
    Button10: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N6: TMenuItem;
    CheckBox3: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

    procedure MyProc(var AMsg: TWMSysCommand); message WM_SYSCommand;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  EditFile, sr: string;
  nn1: TTreeNode;
  LastIndex: integer;

implementation

uses print, psd, textadd;

{$R *.DFM}

procedure TForm1.MyProc(var AMsg: TWMSysCommand);
begin
 if AMsg.CmdType=SC_MINIMIZE
 then Application.Minimize
 else inherited;
end; 

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 // открывыется с одного клика, а не с двух
 if TreeView1.AutoExpand=true then TreeView1.AutoExpand:=false
  else TreeView1.AutoExpand:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if Edit1.Text<>''
 then
  begin
   TreeView1.Items.Add(TreeView1.Selected,Edit1.Text);
   Edit1.Text:='';
  end; 
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if Edit3.Text<>''
 then
  begin
   TreeView1.Items.AddChild(TreeView1.Selected,Edit3.Text);
   TreeView1.Selected.Expanded:=true;   
   Edit3.Text:='';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if Edit4.Text<>''
 then TreeView1.Selected.Delete
 else MessageDlg('Пункт не выбран!',mtError,[mbOK],0);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 try
  if TreeView1.Selected.Text<>''
  then
   begin
    TreeView1.Selected.Text:=Edit2.Text;
    Edit4.Text:=Edit2.Text;
   end;
 except
  MessageDlg('Пункт не выбран!',mtError,[mbOK],0);
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 s,d: string;
 i,j,x,k,trvic,lbic: integer;
 Node: TTreeNode;
begin
 try
  TreeView1.Items.BeginUpdate;
  SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
  if SaveDialog1.Execute
  then
   begin
    Button1.Caption:='Сохранение...';
    Button1.Enabled:=false;
    EditFile:=SaveDialog1.FileName;
    s:=EditFile;
    j:=0;
    d:='\';
    x:=Length(s);
    for i:=1 to x do
     if d=s[i] then j:=i;
    Delete(s,1,j);
    ListBox1.Clear;
    ListBox1.Items.Add(s);
    trvic:=TreeView1.Items.Count-1;
    for i:=0 to trvic do
     begin
      TreeView1.Items.Item[i].Selected:=true;
      s:='';
      Node:=TreeView1.Selected;
      s:=Node.Text+s;
      while Node.Parent<>nil do
       begin
        Node:=Node.Parent;
        s:=Node.Text+'ђ'+s;
       end;
      ListBox1.Items.Add(s);
      Application.ProcessMessages;
     end;
    RichEdit1.Lines.Clear;
    lbic:=ListBox1.Items.Count-1;
    for k:=0 to lbic do
     begin
      RichEdit1.Lines.Add(ListBox1.Items.Strings[k]);
      Application.ProcessMessages;
     end;
    Button8.Click;

    RichEdit1.PlainText:=true;
    RichEdit1.Lines.SaveToFile(EditFile);
   end;
  Button10.Enabled:=true;
  Button11.Enabled:=true;
  TreeView1.FullCollapse;
  TreeView1.Items.EndUpdate;
 except
  TreeView1.FullCollapse;
  TreeView1.Items.EndUpdate;
  MessageDlg('Ошибка записи данных!',mtError,[mbOK],0);
  Button1.Caption:='Сохранить изменения';
  Button1.Enabled:=true;
 end;
 Button1.Caption:='Сохранить изменения';
 Button1.Enabled:=true;
end;

procedure FillTreeViewWithFiles(TreeView1 : TTreeView; Strs : TStringList);
var
 CachedStrs: TStringList;
 // CachedStrs вводится для ускорения поиска
                                        // в уже готовом дереве.
  procedure AddItem(Lev: Integer; ParentNode: TTreeNode; S: String);
   function FindNodeWithText(AParent: TTreeNode; Const S: String): TTreeNode;
   var
    k: integer;
    fStr: string;
    tmpNode: TTreeNode;
   begin
    Result:=nil;
    fStr:=s+IntToStr(Integer(AParent));
    k:=CachedStrs.IndexOf(fStr);
    if k>-1
    then Result:=Pointer(CachedStrs.Objects[k])
    else
     begin
      if AParent<>nil
      then tmpNode:=AParent.getFirstChild
      else tmpNode:=TreeView1.Items.GetFirstNode;
      while tmpNode<>nil do
       begin
        if tmpNode.Text=s then
         begin
          Result:=tmpNode;
          CachedStrs.AddObject(fStr, Pointer(tmpNode));
          break;
         end;
        tmpNode:=tmpNode.getNextSibling;
       end;
     end
   end;
////////////////
  var
   prefix: string;
   ID: Integer;
   aNode: TTreeNode;
  begin
   if s='' then Exit;
   ID:=Pos('ђ',s); // \
   prefix:='';
   if ID>0
   then prefix:=Copy(s, 1, ID-1)
   else
    begin
     prefix:=s;
     s:='';
    end;
   aNode:=FindNodeWithText(ParentNode, prefix);
   if aNode=nil
   then
    begin
     aNode:=TreeView1.Items.AddChild(ParentNode, prefix);
    end;
    AddItem(Lev+1, aNode, Copy(S,ID+1, Length(s)));
  end;
////////////////
var
 k: integer;
begin
 CachedStrs:=TStringList.Create;
 CachedStrs.Duplicates:=dupIgnore;
 CachedStrs.Sorted:=true;
 try
  TreeView1.Items.BeginUpdate;
  TreeView1.SortType:=stNone;
  for k:=0 to Strs.Count-1 do
   AddItem(0, nil, Strs[k]);
 finally
  TreeView1.Items.EndUpdate;
  CachedStrs.Free;
 end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
 i: integer;
 Strs: TStringList; 
begin
 OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
 if OpenDialog1.Execute then
  begin
   Button5.Caption:='Загрузка...';
   Button5.Enabled:=false;
   EditFile:=OpenDialog1.FileName;

   RichEdit1.PlainText:=true;
   RichEdit1.Lines.LoadFromFile(Editfile);
   ListBox1.Items.Text:=RichEdit1.Text;
   // RichEdit1.Lines.LoadFromFile(Editfile);
   Button9.Click;
   Form1.Caption:='Информационное дерево v2.4 - '+RichEdit1.Lines.Strings[0];
   Strs:=TStringList.Create;
   Strs.Clear;
   Button10.Enabled:=true;
   Button11.Enabled:=true;
   TreeView1.Items.BeginUpdate;
   TreeView1.Items.Clear;
    try
     for i:=1 to ListBox1.Items.Count-1 do
      Strs.Add(RichEdit1.Lines.Strings[i]);
     FillTreeViewWithFiles(TreeView1,Strs);
    except
     MessageDlg('Ошибка открытия данных!',mtError,[mbOK],0);
    end;
   TreeView1.Items.EndUpdate;
   Strs.Free;
   Button5.Caption:='Загрузить данные';
   Button5.Enabled:=true;

   LastIndex := 0;
  end;
end;

procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 if TreeView1.Selected=nil
 then Exit;

 Edit2.Text:=TreeView1.Selected.Text;
 Edit4.Text:=TreeView1.Selected.Text;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 if Edit5.Text<>''
 then
  begin
   TreeView1.Items.Insert(TreeView1.Selected,Edit5.Text);
   Edit5.Text:='';
  end; 
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
 if Node.HasChildren
 then
  if Node.Expanded=true
  then Node.ImageIndex:=2
  else Node.ImageIndex:=1
 else Node.ImageIndex:=0;
 //
 if Node.AbsoluteIndex=0
 then Node.ImageIndex:=3;
end;

procedure TForm1.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
 Node.SelectedIndex:=Node.ImageIndex;
 //
 if Node.AbsoluteIndex=0
 then Node.SelectedIndex:=3;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
 Button2.Click;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  begin
   Key:=#0;
   Button2.Click;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  begin
   Key:=#0;
   Button3.Click;
  end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  begin
   Key:=#0;
   Button6.Click;
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  begin
   Key:=#0;
   Button7.Click;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 Sgl: TStringList;
begin
 Application.Title:=Form1.Caption;
 Edit6.Text:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 //
 Sgl:=TStringList.Create;
 Sgl.LoadFromFile('conf.ps');
 if Sgl.Strings[1]='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf'
 then CheckBox2.Checked:=true
 else CheckBox2.Checked:=false;
 Sgl.Free;

 LastIndex := 0;
end;

procedure TForm1.Button8Click(Sender: TObject);
Label M;
var
 i,z,x,j,j1,n,s,s1,tt,c,f,relc:integer;
 st,a:string;
begin
 try
  Label1.Visible:=true;
  f:=1;
  c:=RichEdit1.Lines.Count;
  with ProgressBar1 do
   begin
    Max:=c;
    Refresh;
    Show;
   end;
  j:=96969;
  j1:=j;
  Screen.Cursor:=crHourGlass;
  RichEdit1.Lines.BeginUpdate;
  RichEdit2.Lines.BeginUpdate;
  RichEdit2.Lines.Assign(RichEdit1.Lines);
  RichEdit1.Lines.Clear;
  st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
  relc:=RichEdit2.Lines.Count-1;
  for z:=0 to relc do
   begin
    a:=RichEdit2.Lines.Strings[z];
    x:=length(a);
    for i:=1 to x do
     begin
      if pos(a[i],Edit6.Text)<>0 then
       begin
        Edit6.SelStart:=pos(a[i],Edit6.Text)-1;
        n:=Edit6.SelStart;
        s1:=n+1;
        j:=j1;
        s:=s1+j;
        if (s<=159) then
         begin
          s:=s1+j;
          a[i]:=st[s];
          goto M;
         end;
        s:=159-(n+1);
        j:=j1-s;
        repeat
         tt:=j-159;
         s:=abs(tt);
         j:=s;
        until (s<=159);
        a[i]:=st[s];
        M:
       end
      else
     end;
    RichEdit1.Lines.Add(a);
    Label1.Caption:='Строка: '+IntToStr(f)+' из '+
         IntToStr(c)+' ('+IntToStr(Round(ProgressBar1.Position/ProgressBar1.Max*100))+'%)';
    f:=f+1;
    ProgressBar1.Position:=f;
    Application.ProcessMessages;
   end;
  ProgressBar1.Position:=0;
  Screen.Cursor:=crDefault;
  RichEdit1.Lines.EndUpdate;
  RichEdit2.Lines.EndUpdate;
 except
  MessageDlg('Ошибка записи данных!',mtError,[mbOK],0);
 end;
end;

procedure TForm1.Button9Click(Sender: TObject);
Label M;
var
 i,j,j1,x,n,z,s,s1,tt,c,f,relc: integer;
 st,a:string;
begin
 try
  Label1.Visible:=true;
  f:=1;
  c:=RichEdit1.Lines.Count;
  with ProgressBar1 do
   begin
    Max:=c;
    Refresh;
    Show;
   end;
  j:=96969;
  j1:=j;
  Screen.Cursor:=crHourGlass;
  RichEdit1.Lines.BeginUpdate;
  RichEdit2.Lines.BeginUpdate;
  RichEdit2.Lines.Assign(RichEdit1.Lines);
  RichEdit1.Lines.Clear;
  st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
  relc:=RichEdit2.Lines.Count-1;
  for z:=0 to relc do
   begin
    a:=RichEdit2.Lines.Strings[z];
    x:=length(a);
    for i:=1 to x do
     begin
      if pos(a[i],Edit6.Text)<>0 then
       begin
        Edit6.SelStart:=pos(a[i],Edit6.Text)-1;
        n:=Edit6.SelStart;
        s1:=n+1;
        j:=j1;
        s:=s1-j;
        if ((s<=159) and (s>=0)) then
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
   RichEdit1.Lines.Add(a);
   Label1.Caption:='Строка: '+IntToStr(f)+' из '+
         IntToStr(c)+' ('+IntToStr(Round(ProgressBar1.Position/ProgressBar1.Max*100))+'%)';
   f:=f+1;
   ProgressBar1.Position:=f;
   Application.ProcessMessages;
  end;
  ProgressBar1.Position:=0;
  Screen.Cursor:=crDefault;
  RichEdit1.Lines.EndUpdate;
  RichEdit2.Lines.EndUpdate;
 except
  ProgressBar1.Position:=0;
  Screen.Cursor:=crDefault;
  RichEdit1.Lines.EndUpdate;
  RichEdit2.Lines.EndUpdate;
  MessageDlg('Ошибка открытия данных!',mtError,[mbOK],0);
 end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
 Application.CreateForm(TForm2, Form2);
 Form2.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
 Memo1.Lines.LoadFromFile('conf.ps');
 if CheckBox2.Checked=true
 then
  begin
   Memo1.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal6fp2wQIaiOTyf3hUz5SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo1.Lines.SaveToFile('conf.ps');
  end
 else
  begin
   Memo1.Lines.Strings[1]:='LhOL7aSicLbcnjNJZVnnviK11P9JzbynHkFJ5DPNIPlFAkvi1R1fNqsMgoJrsMy7Ua9kpZrTal5fp2wQIaiOTyf3hUz6SEvNadwNrjwCapgTieSwmFULvzwlRZkycnhLFeUjYtaEhvxZ5GfqwCtgIuiio3VqWINnEqY26NJotJx5XA1bMYRGcscdMrj9fdEXNmqLVgOf';
   Memo1.Lines.SaveToFile('conf.ps');
  end; 
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
Label M;
var
 newp,st,a: string;
 i,x,j,j1,n,s,s1,tt: integer;
begin
 // смещение 97365
 newp:=InputBox('Введите новый пароль','Новый пароль:','');
 if newp='' then
  begin
   MessageDlg('Пароль на вход в программу не изменен!',mtInformation,[mbOK],0);
   Exit;
  end;
 ///////////////////////////////////////////////////
 j:=97365;
 j1:=j;
 st:='1234567890АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ .,:;"-=+\/|!?@#$%^&*_№<>()[]{}`';
 a:=newp;
 x:=length(a);
 try
  for i:=1 to x do
   begin
    if pos(a[i],Edit6.Text)<>0 then
     begin
      Edit6.SelStart:=pos(a[i],Edit6.Text)-1;
      n:=Edit6.SelStart;
      s1:=n+1;
      j:=j1;
      s:=s1+j;
      if (s<=159) then
       begin
        s:=s1+j;
        a[i]:=st[s];
        goto M;
       end;
      s:=159-(n+1);
      j:=j1-s;
      repeat
       tt:=j-159;
       s:=abs(tt);
       j:=s;
      until (s<=159);
      a[i]:=st[s];
      M:
     end
    else
   end;
  Memo1.Lines.LoadFromFile('conf.ps');
  Memo1.Lines.Strings[0]:=a;
  Memo1.Lines.SaveToFile('conf.ps');
  MessageDlg('Пароль на вход в программу успешно изменен!',mtInformation,[mbOK],0);
 except
  MessageDlg('Ошибка сохранения пароля!'+#10#13+'Пароль не изменен',mtError,[mbOK],0);
 end;
 ///////////////////////////////////////////////////
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 TreeView1.Items.BeginUpdate;
 TreeView1.FullExpand;
 TreeView1.Items.EndUpdate;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 TreeView1.Items.BeginUpdate;
 TreeView1.FullCollapse;
 TreeView1.Items.EndUpdate;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 Button5.Click;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 ShowMessage('---------------  Информационное дерево v2.4  ---------------'+#10#13+
             'Программа для систематизированного'+#10#13+
             'хранения конфиденциальной информации (пароли,'+#10#13+
             'личные данные и т.п.) с последующим шифрованием.');
 ShellExecute(0,'open','http://www.delphisources.ru/','','',SW_SHOW);
end;

function TreeItemSearch(TV: TTreeView; SucheItem: string; LastIndex: integer): TTreeNode;
var
 i: Integer;
 iItem: string;
begin
 if (TV=nil) or (SucheItem='')
 then
  begin
   Result:=nil;
   Exit;
  end;
 
 for i:=LastIndex to TV.Items.Count-1 do
  begin
   iItem:=AnsiLowerCase(TV.Items[i].Text);
   if pos(SucheItem,iItem)<>0
   then
    begin
     Result:=TV.Items[i];
     Exit;
    end
   else Result:=nil;
  end;

 Result:=nil;
end;

procedure TForm1.N5Click(Sender: TObject);
var
 Node: TTreeNode;
 // Noddy: TTreeNode;
begin
 sr:=InputBox('Поиск текста','Что ищем:',sr);
 if Trim(sr)=''
 then Exit;

 Node:=TreeItemSearch(TreeView1, AnsiLowerCase(sr), LastIndex);
 // TreeView1.Selected:=Node;
 // TreeView1.SetFocus;

 TreeView1.Selected:=Node;

 if(Node <> nil) then
   LastIndex := TreeView1.Selected.AbsoluteIndex + 1
 else
   LastIndex := 0;

{
 Noddy:=TreeView1.Items[0];
 while (Noddy<>nil) do
  begin
   if pos(sr,Noddy.Text)<>0
   then
     begin
      TreeView1.Selected:=Noddy;
      TreeView1.SetFocus;
      Break;
    end
   else Noddy:=Noddy.GetNext;
  end;
}
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 if Form1.TreeView1.Selected=nil
 then
  begin
   ShowMessage('Родительский пункт для добавления не выбран!');
   Exit;
  end;

 Form4.Top:=(Screen.Height div 2)-(Form4.Height div 2);
 Form4.Left:=(Screen.Width div 2)-(Form4.Width div 4);
 Form4.ShowModal;
end;

procedure ExchangeNodes(TreeView: TTreeView; Node1, Node2: TTreeNode);
var
 _n1, _n2: ttreenode;
 m1, m2: TNodeAttachMode;
begin
 if (Node1 = nil) or (Node2 = nil) then Exit;

 m1 := naInsert;
 _n1 := Node2.getNextSibling;
 if _n1 = nil
 then
   if Node2.Parent <> nil
   then
      begin
        m1 := naAddChild;
        _n1 := Node2.Parent;
      end
   else m1 := naAdd;
 
 m2 := naInsert;
 _n2 := Node1.getNextSibling;
 if _n2 = nil
 then
   if Node1.Parent <> nil
   then
     begin
       m2 := naAddChild;
       _n2 := Node1.Parent;
     end
   else m2 := naAdd;

 Node1.MoveTo(_n1, m1);
 // Node2.MoveTo(_n2, m2);
end;

procedure TForm1.TreeView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if not CheckBox3.Checked then Exit;

 nn1 := TreeView1.GetNodeAt(X, Y);
 if n1 <> nil
 then TreeView1.BeginDrag(false, 2);
end;

procedure TForm1.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
 n2: TTreeNode;
begin
 n2 := TreeView1.GetNodeAt(X, Y);
 ExchangeNodes(TreeView1, nn1, n2);
end;

procedure TForm1.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Sender = Source;
end;

end.
