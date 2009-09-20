{*******************************************************************************
  Copyright (c) 2004-2009 by Edyard Tolmachev
  IMadering project
  http://imadering.com
  ICQ: 118648
  E-mail: imadering@mail.ru
*******************************************************************************}

unit ChatUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Htmlview, StrUtils, Menus, ExtCtrls, StdCtrls, Buttons,
  CategoryButtons, VarsUnit, ShellApi, MMsystem, GIFImage, rXML,
  ComCtrls, CommCtrl, ToolWin;

type
  TChatForm = class(TForm)
    CloseTabPopupMenu: TPopupMenu;
    CloseTabAllOffline: TMenuItem;
    CloseTabAllNoCurrent: TMenuItem;
    CloseTabAll: TMenuItem;
    CenterChatFormPanel: TPanel;
    ChatCategoryButtons: TCategoryButtons;
    GroupSplitter: TSplitter;
    BottomChatFormPanel: TPanel;
    BottomToolsPanel: TPanel;
    MemoPanel: TPanel;
    MyAvatarPanelSpeedButton: TSpeedButton;
    InputMemo: TMemo;
    MyAvatarPanel: TPanel;
    MyAvatarImage: TImage;
    HTMLMsg: THTMLViewer;
    ChatSplitter: TSplitter;
    HtmlPanel: TPanel;
    HTMLChatViewer: THTMLViewer;
    TopChatFormPanel: TPanel;
    InfoPanel1: TPanel;
    InfoPanel2: TPanel;
    InfoContactSpeedButton: TSpeedButton;
    EditContactSpeedButton: TSpeedButton;
    HistoryShowPopupMenu: TPopupMenu;
    ShowAllHistory: TMenuItem;
    Show100History: TMenuItem;
    Show50History: TMenuItem;
    Show20History: TMenuItem;
    MemoPopupMenu: TPopupMenu;
    QRepMess: TMenuItem;
    CutMemo: TMenuItem;
    N1: TMenuItem;
    CopyMemo: TMenuItem;
    CopyAllMemo: TMenuItem;
    PasteMemo: TMenuItem;
    HtmlPopupMenu: TPopupMenu;
    ChatHTMLTextCopy: TMenuItem;
    ChatHTMLAllTextCopy: TMenuItem;
    ChatHTMLQText: TMenuItem;
    QmessPopupMenu: TPopupMenu;
    ChatPageControl: TPageControl;
    InfoPanel3: TPanel;
    InfoPanel4: TPanel;
    ContactAvatarPanel: TPanel;
    ContactAvatarImage: TImage;
    ChatToolBar: TToolBar;
    EnterKeyToolButton: TToolButton;
    ChatSettingsToolButton: TToolButton;
    TypingTextToolButton: TToolButton;
    ChatFontToolButton: TToolButton;
    KeySoundToolButton: TToolButton;
    TopToolsPanel: TPanel;
    TextLenPanel: TPanel;
    SmiliesSpeedButton: TSpeedButton;
    Bevel1: TBevel;
    QSpeedButton: TSpeedButton;
    QRepSpeedButton: TSpeedButton;
    Bevel2: TBevel;
    HistorySpeedButton: TSpeedButton;
    Bevel3: TBevel;
    NotifyPanel: TPanel;
    ClearChatSpeedButton: TSpeedButton;
    ContactMenuToolButton: TToolButton;
    ContactAvatarPanelSpeedButton: TSpeedButton;
    SendFileSpeedButton: TSpeedButton;
    SendMessageSpeedButtonDrop: TSpeedButton;
    SendMessageBitBtn: TBitBtn;
    CloseTabBitBtn: TBitBtn;
    CloseTabSpeedButtonDrop: TSpeedButton;
    SendPopupMenu: TPopupMenu;
    SendAllOnline: TMenuItem;
    SendAll: TMenuItem;
    TabPopupMenu: TPopupMenu;
    CloseChatTabMenu: TMenuItem;
    ConfPopupMenu: TPopupMenu;
    ChatUserPopupMenu: TPopupMenu;
    CloseLastChatMenu: TMenuItem;
    FileTransferPopupMenu: TPopupMenu;
    UpWapru1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MyAvatarPanelSpeedButtonClick(Sender: TObject);
    procedure ChatSplitterMoved(Sender: TObject);
    procedure InputMemoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChatCategoryButtonsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ChatCategoryButtonsHotButton(Sender: TObject;
      const Button: TButtonItem);
    procedure ChatCategoryButtonsButtonClicked(Sender: TObject;
      const Button: TButtonItem);
    procedure CloseTabAllClick(Sender: TObject);
    procedure CloseTabAllNoCurrentClick(Sender: TObject);
    procedure CloseTabAllOfflineClick(Sender: TObject);
    procedure InputMemoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ChatSettingsToolButtonClick(Sender: TObject);
    procedure InputMemoKeyPress(Sender: TObject; var Key: Char);
    procedure EditContactSpeedButtonClick(Sender: TObject);
    procedure ShowAllHistoryClick(Sender: TObject);
    procedure InfoContactSpeedButtonClick(Sender: TObject);
    procedure ChatHTMLTextCopyClick(Sender: TObject);
    procedure HTMLChatViewerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoPopupMenuPopup(Sender: TObject);
    procedure PasteMemoClick(Sender: TObject);
    procedure ChatHTMLQTextClick(Sender: TObject);
    procedure CutMemoClick(Sender: TObject);
    procedure CopyMemoClick(Sender: TObject);
    procedure CopyAllMemoClick(Sender: TObject);
    procedure ChatHTMLAllTextCopyClick(Sender: TObject);
    procedure HtmlPopupMenuPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ChatFontToolButtonClick(Sender: TObject);
    procedure HTMLChatViewerHotSpotClick(Sender: TObject; const SRC: string;
      var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure ChatPageControlChange(Sender: TObject);
    procedure ChatPageControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChatPageControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SmiliesSpeedButtonClick(Sender: TObject);
    procedure QSpeedButtonClick(Sender: TObject);
    procedure HistorySpeedButtonClick(Sender: TObject);
    procedure HistorySpeedButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClearChatSpeedButtonClick(Sender: TObject);
    procedure ContactAvatarPanelSpeedButtonClick(Sender: TObject);
    procedure SendMessageBitBtnClick(Sender: TObject);
    procedure SendMessageSpeedButtonDropClick(Sender: TObject);
    procedure CloseTabBitBtnClick(Sender: TObject);
    procedure CloseTabSpeedButtonDropClick(Sender: TObject);
    procedure SendAllOnlineClick(Sender: TObject);
    procedure SendAllClick(Sender: TObject);
    procedure SendFileSpeedButtonClick(Sender: TObject);
    procedure TypingTextToolButtonClick(Sender: TObject);
    procedure CloseChatTabMenuClick(Sender: TObject);
    procedure ContactMenuToolButtonClick(Sender: TObject);
    procedure ContactMenuToolButtonContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure HTMLChatViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SendFileSpeedButtonMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure QRepSpeedButtonClick(Sender: TObject);
    procedure QRepSpeedButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpWapru1Click(Sender: TObject);
  private
    { Private declarations }
    lastClick: Tdatetime;
    ButtonInd: integer;
    //Zundo: string;
    HintInd: integer;
    iTab: integer;
    procedure QuickMessClick(Sender: TObject);
  public
    { Public declarations }
    OutMessIndex: integer;
    ChatButton: TButtonItem;
    UserType: string;
    UserUtf8Support: boolean;
    UserAvatarHash: string;
    procedure TranslateForm;
    procedure CheckMessage_Smilies(var msg: string);
    procedure CheckMessage_BR(var msg: string);
    procedure CheckMessage_ClearTag(var msg: string);
    procedure AddChatText(Nick_Time, Mess_Text: string; MessIn: boolean = false);
    procedure CreateFastReplyMenu;
    function pageIdxAt(x, y: integer): integer;
    function AddMessInActiveChat(cNick, cPopMsg, cId, cMsgD, cMess: string): boolean;
  end;

var
  ChatForm: TChatForm;
  ChatCSS: string = '<style type="text/css">' +
  'body, span { color: #000000; font: 12px tahoma, verdana; }' +
    'hr { margin: 5px; border: none; color: gray; background-color: gray; height: 1px; }' +
    '.a { font: bold 11px tahoma, verdana; color: blue; }' +
    '.b { font: bold 11px tahoma, verdana; color: red; }' +
    '.c { font: 12px tahoma, verdana; color: black; }' +
    '.d { font: bold 11px tahoma, verdana; color: green; }' +
    '</style>';

implementation

{$R *.dfm}

uses
  MainUnit, SmilesUnit, SettingsUnit, IcqProtoUnit, HistoryUnit,
  IcqContactInfoUnit, UtilsUnit, RosterUnit, JabberProtoUnit, UnitCrypto,
  FileTransferUnit;

function TChatForm.AddMessInActiveChat(cNick, cPopMsg, cId, cMsgD, cMess: string): boolean;
begin
  Result := false;
  if Visible then
  begin
    //--���� ������ ������� ��� � ���� ���������
    if InfoPanel2.Caption = cId then
    begin
      //--���� �� �������� ��������� ������, �� ����������� ��������� ��� ������
      if not TextSmilies then CheckMessage_Smilies(cMess);
      //--��������� ��������� � ������� ���
      AddChatText(cMsgD, cMess, true);
      //--������������ ��� � ����� �����
      HTMLChatViewer.VScrollBarPosition := HTMLChatViewer.VScrollBar.Max;
      //--���� ���� ��������� �������, �� �������
      if ChatForm.Active then
      begin
        Result := true;
        Exit;
      end;
    end;
  end;
  //--���� � ������ ������� �������� ��������� ��� ����� ��������, �� ��������� ��� ����
  if InMessList.IndexOf(cId) = -1 then InMessList.Add(cId);
  //--������ ���� ��������� ���������
  ImPlaySnd(1);
  //--���������� ���������� � ����������
  DAShow(cNick, cPopMsg, cId, 165, 1, 0);
end;

function TChatForm.pageIdxAt(x, y: integer): integer;
var
  R: Trect;
begin
  result := 0;
  while result < ChatPageControl.PageCount do
  begin
    SendMessage(ChatPageControl.Handle, TCM_GETITEMRECT, result, Longint(@R));
    if ptInRect(R, point(x, y)) then Exit;
    inc(result);
  end;
  result := -1;
end;

procedure TChatForm.QRepSpeedButtonClick(Sender: TObject);
begin
  //--��������� ���� ��� ���� ���������
  Popup(QRepSpeedButton, QMessPopupMenu);
end;

procedure TChatForm.QRepSpeedButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //--��������� ���� ��� ���� ���������
  if Button = mbRight then Popup(QRepSpeedButton, QMessPopupMenu);
end;

procedure TChatForm.QSpeedButtonClick(Sender: TObject);
var
  RosterItem: TListItem;
begin
  //--������ �� ������� ��������� ��������� �� ����� ��������
  RosterItem := RosterForm.ReqRosterItem(InfoPanel2.Caption);
  if RosterItem <> nil then
  begin
    if RosterItem.SubItems[15] <> EmptyStr then
      InputMemo.Lines.Add('> ' + RosterItem.SubItems[15]);
  end;
end;

procedure TChatForm.QuickMessClick(Sender: TObject);
begin
  //--��������� � ���� ����� ����� �� ���� ������� �������
  InputMemo.SelText := TMenuItem(Sender).Hint;
end;

procedure TChatForm.CreateFastReplyMenu;
var
  i: integer;
  list: TStringList;
begin
  //--������ ��������� ���� �����
  list := TStringList.Create;
  //--���� ���� � �������� �������� ������, �� ��������� ���
  if FileExists(ProfilePath + 'Profile\QReply.txt') then list.LoadFromFile(ProfilePath + 'Profile\QReply.txt')
  else
  begin
    //--����� ��������� ������� ������ �� ���������
    list.Add(QReply1L);
    list.Add(QReply2L);
    list.Add(QReply3L);
  end;
  try
    //--�������� ������� ������ � ������ ���� ���� ����� ������
    with MemoPopupMenu.Items.Items[0] do
    begin
      for I := 0 to List.Count - 1 do
      begin
        if list.Strings[I] <> EmptyStr then
        begin
          Add(NewItem(list.Strings[I], 0, False, True, QuickMessClick, 0, 'MenuItem' + IntToStr(I)));
          //--��������� � � �����, ������ ����� ������
          Items[I].Hint := list.Strings[I];
          //--��������� ������ ��� ������ ����
          Items[I].ImageIndex := 157;
        end;
      end;
    end;
    //--��������� ������� ������ � ���� ������� �������
    with QmessPopupMenu.Items do
    begin
      for I := 0 to List.Count - 1 do
      begin
        if list.Strings[I] <> EmptyStr then
        begin
          Add(NewItem(list.Strings[I], 0, False, True, QuickMessClick, 0, 'MenuItem' + IntToStr(I)));
          //--��������� � � �����, ������ ����� ������
          Items[I].Hint := list.Strings[I];
          //--��������� ������ ��� ������ ����
          Items[I].ImageIndex := 157;
        end;
      end;
    end;
  finally
    list.Free;
  end;
end;

procedure TChatForm.ChatCategoryButtonsButtonClicked(Sender: TObject;
  const Button: TButtonItem);
var
  diff: TdateTime;
begin
  //--��������� ������� ����
  diff := now - lastClick;
  lastClick := now;
  if (diff < dblClickTime) and (ButtonInd = Button.Index) then
  begin
    //--� ������� ������� ���� � ���� ����� ��� jabber �����������

    Exit;
  end;
  ButtonInd := Button.Index;
end;

procedure TChatForm.ChatCategoryButtonsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled := true;
  //--�������� ��������� �������
  ChatCategoryButtons.FocusedItem := nil;
  ChatCategoryButtons.SelectedItem := ChatButton;
  if ChatButton <> nil then
  begin
    //--��������� ���� ��������� � �����������

  end;
end;

procedure TChatForm.ChatCategoryButtonsHotButton(Sender: TObject;
  const Button: TButtonItem);
begin
  //--���������� ��� ����� ������� ���������� ��������
  if Button <> nil then ChatButton := Button
  else ChatButton := nil;
end;

procedure TChatForm.CheckMessage_Smilies(var msg: string);
var
  ImgTag1, ImgTag2, Cod: string;
  I, II: integer;

  function GenTag(Path: string): string;
  begin
    Result := ImgTag1 + Path + ImgTag2;
  end;

begin
  //--���������� html ���� ��� ������� ������� ������� �� ��������� �����������
  ImgTag1 := '<img src="' + MyPath + 'Smilies\' + CurrentSmiles + '\';
  ImgTag2 := '" ALIGN=ABSMIDDLE BORDER="0">';
  //--��������� ������ ����� ������� �� ����������
  for I := 1 to SmilesList.Count - 1 do
  begin
    for II := 1 to 20 do
    begin
      Cod := Parse(',', SmilesList.Strings[I], II);
      if Cod > EmptyStr then msg := AnsiReplaceText(msg, Cod, GenTag(IntToStr(I) + '.gif'))
      else Break;
    end;
  end;
end;

procedure TChatForm.CheckMessage_BR(var msg: string);
begin
  //--�������� ��� �������� �� ����� ������ � ��������� �� ��������������� ���
  msg := AnsiReplaceText(msg, #13#10, '<BR>');
end;

procedure TChatForm.CheckMessage_ClearTag(var msg: string);
var
  Doc: string;
begin
  //--�������� ����� ������� ��� ����� ���� �� ��������� �������� ������ �����
  HTMLMsg.Clear;
  Doc := msg;
  HTMLMsg.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
  HTMLMsg.SelectAll;
  msg := HTMLMsg.SelText;
end;

procedure TChatForm.AddChatText(Nick_Time, Mess_Text: string; MessIn: boolean = false);
var
  Doc: string;
begin
  try
    Doc := HTMLChatViewer.DocumentSource;
    if MessIn then Doc := Doc + '<IMG NAME=i SRC="' + MyPath + 'Icons\' + CurrentIcons + '\inmess.gif" ALIGN=ABSMIDDLE BORDER=0><span class=b> ' + Nick_Time + '</span><br>'
    else Doc := Doc + '<IMG NAME=o' + IntToStr(OutMessIndex) + ' SRC="' + MyPath + 'Icons\' + CurrentIcons + '\outmess1.gif" ALIGN=ABSMIDDLE BORDER=0><span class=a> ' + Nick_Time + '</span><br>';
    Doc := Doc + '<span class=c>' + Mess_Text + '</span><br><br>';
    HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
  except
  end;
end;

procedure TChatForm.InputMemoChange(Sender: TObject);
begin
  //--������� �� ���� ����� ������ ������ ������ �������� �� ����� ������
  if InputMemo.Text = #13#10 then InputMemo.Clear;
  //--���������� ������ ��������� ������
  TextLenPanel.Caption := IntToStr(InputMemo.GetTextLen);
end;

procedure TChatForm.InputMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{var
  list: TStringList;
  Selected, YesConvert: boolean;
  buf, Outbuf, temp: string;
  HMemo: HWND;
  i, ii: integer;

  procedure ReplaceText(Str: string);
  begin
    SendMessage(HMemo, EM_REPLACESEL, 0, Longint(PChar(Str)));
  end;

  function GetSelText(var Str: string): boolean;
  begin
    result := false;
    if self.InputMemo.SelText <> EmptyStr then
    begin
      result := true;
      Str := self.InputMemo.SelText;
    end
    else
      Str := self.InputMemo.Text;
  end;}

begin
  //--���� ������ ������� ������ � ������ ������� ����� � �� ������ ������ �������� �� �����, �� ���������� ���������
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 13) and (not EnterKeyToolButton.Down) then SendMessageBitBtnClick(self);
  //--���� ������ ������� ������ � ������ ������� "s", �� ��������� ���� �������
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 83) then SmiliesSpeedButtonClick(self);
  //
  {if (GetKeyState(VK_CONTROL) < 0) and (Key = 82) then
  begin
    if not FileExists(MyPath + 'Langs\chars_r.txt') then Exit;
    HMemo := self.InputMemo.Handle;
    if HMemo = 0 then Exit;
    Selected := GetSelText(buf);
    if Length(buf) = 0 then Exit;
    Zundo := self.InputMemo.Text;
    list := TStringList.Create;
    list.LoadFromFile(MyPath + 'Langs\chars_r.txt');
    //
    for i := 1 to Length(buf) do
    begin
      YesConvert := false;
      for ii := 0 to list.Count - 1 do
      begin
        temp := Parse('=', list.Strings[ii], 1);
        if buf[i] = temp then
        begin
          Outbuf := Outbuf + Parse('=', list.Strings[ii], 2);
          YesConvert := true;
          Break;
        end;
      end;
      if not YesConvert then Outbuf := Outbuf + buf[i];
    end;
    //
    list.Free;
    if Selected then ReplaceText(Outbuf)
    else SetWindowText(HMemo, PChar(Outbuf));
    SendMessage(HMemo, EM_SETSEL, Length(self.InputMemo.Text), Length(self.InputMemo.Text));
  end;
  //
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 84) then
  begin
    if not FileExists(MyPath + 'Langs\chars_t.txt') then Exit;
    HMemo := self.InputMemo.Handle;
    if HMemo = 0 then Exit;
    Selected := GetSelText(buf);
    if Length(buf) = 0 then Exit;
    Zundo := self.InputMemo.Text;
    list := TStringList.Create;
    list.LoadFromFile(MyPath + 'Langs\chars_t.txt');
    //
    for i := 1 to Length(buf) do
    begin
      YesConvert := false;
      for ii := 0 to list.Count - 1 do
      begin
        temp := Parse('=', list.Strings[ii], 1);
        if buf[i] = temp then
        begin
          Outbuf := Outbuf + Parse('=', list.Strings[ii], 2);
          YesConvert := true;
          Break;
        end;
      end;
      if not YesConvert then Outbuf := Outbuf + buf[i];
    end;
    //
    list.Free;
    if Selected then ReplaceText(Outbuf)
    else SetWindowText(HMemo, PChar(Outbuf));
    SendMessage(HMemo, EM_SETSEL, Length(self.InputMemo.Text), Length(self.InputMemo.Text));
  end;
  //
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 90) then
  begin
    if Zundo > EmptyStr then self.InputMemo.Text := Zundo;
    self.InputMemo.SelStart := self.InputMemo.GetTextLen;
    Zundo := EmptyStr;
  end;}
end;

procedure TChatForm.InputMemoKeyPress(Sender: TObject; var Key: Char);
label
  x;
var
  msgD, msg, UIN: string;
  RosterItem: TListItem;
begin
  //--���� ���� �������������� ������������ ������, �� ������� �� ���� (� ������� ������� ����� ����������� ����)
  if InfoPanel2.Caption = EmptyStr then Exit;
  //--���� ������ ������� �� �����, �� ���� ������� ����� �������� ����������, �� ������������� �����
  if key <> #13 then
  begin
    //--���� ������ ������ ����� ������� ������, �� ������ �����
    if KeySoundToolButton.Down then
    begin
      try
        if (key = #8) and (InputMemo.Text <> EmptyStr) then
        begin
          if FileExists(MyPath + 'Sounds\' + CurrentSounds + '\Back.wav') then
            sndPlaySound(PChar(MyPath + 'Sounds\' + CurrentSounds + '\Back.wav'), SND_ASYNC);
        end
        else
        begin
          if (key <> #8) then
          begin
            if FileExists(MyPath + 'Sounds\' + CurrentSounds + '\Type.wav') then
              sndPlaySound(PChar(MyPath + 'Sounds\' + CurrentSounds + '\Type.wav'), SND_ASYNC);
          end;
        end;
      except
      end;
    end;
    //--���� ������ ������ �������� ���������� � ������ ������
    if TypingTextToolButton.Down then
    begin
      {if not MainForm.ICQTypeTextTimer.Enabled then
      begin
        UIN := InfoPanel2.Caption;
        //if ICQ_Work_Phaze then ICQ_SendTextTyping(TextTypeForUIN, '02');
        MainForm.ICQTypeTextTimer.Enabled := true;
      end
      else MainForm.ICQTypeTextTimer.Enabled := true;}
    end;
    //--�������
    Exit;
  end;
  //--���� ������ ������� ����� � ������ �������� �� �����
  if (Key = #13) and (EnterKeyToolButton.Down) then
    //--���� ������ ������� ����
    if GetKeyState(VK_SHIFT) < 0 then Exit
    else
    begin
      x: ;
      //--�������� ������ �������
      Key := #0;
      //--���� ���� ����� ������, �� �������
      if InputMemo.GetTextLen = 0 then Exit;
      //--���� ������ ������ ����� ������� ������, �� ������ �����
      if KeySoundToolButton.Down then
      begin
        try
          if FileExists(MyPath + 'Sounds\' + CurrentSounds + '\Send.wav') then
            sndPlaySound(PChar(MyPath + 'Sounds\' + CurrentSounds + '\Send.wav'), SND_ASYNC);
        except
        end;
      end;
      //--����� ������������� ������������
      UIN := InfoPanel2.Caption;
      //--�������� ����� ���������
      msg := InputMemo.Text;
      //--���� ��� �������� ICQ, �� ���������� ��������� �� ICQ ���������
      if UserType = 'Icq' then
      begin
        //--���� ��� ����������� � ������� ICQ, �� �������
        if not ICQ_Work_Phaze then Exit;
        //--����������� ���������� � ������ ������
        //if MainForm.ICQTypeTextTimer.Enabled then MainForm.ICQTypeTextTimerTimer(self);
        //--���� ������ ������������ �� ������� � ���� ��������� UTF-8 ���������, �� ���������� ��������� � �������.
        //����� ���������� ��������� � ������ ���� �������
        if (ChatPageControl.ActivePage.Tag <> 9) and (UserUtf8Support) then ICQ_SendMessage_0406(UIN, msg, false)
        else ICQ_SendMessage_0406(UIN, msg, true);
      end
      else if UserType = 'Jabber' then
      begin
        //--���� ��� ����������� � ������� Jabber, �� �������
        if not Jabber_Work_Phaze then Exit;
        //--���������� ���������
        Jabber_SendMessage(UIN, msg);
      end
      else if UserType = 'Mra' then
      begin

      end
      else Exit;
      //--��������� ��������� � ���� ������� � � ���
      msgD := YouAt + ' [' + DateTimeChatMess + ']';
      //--����������� ��������� ��� html ������
      CheckMessage_BR(msg);
      CheckMessage_ClearTag(msg);
      CheckMessage_BR(msg);
      DecorateURL(msg);
      //--���������� ������� � ���� �������
      RosterItem := RosterForm.ReqRosterItem(UIN);
      if RosterItem <> nil then
      begin
        RosterItem.SubItems[13] := RosterItem.SubItems[13] +
          '<span class=a>' + msgD + '</span><br><span class=c>' +
          msg + '</span><br><br>' + #13#10;
        //--������ ���� ����� ��������, ��� ������� ����������
        RosterItem.SubItems[17] := 'X';
      end;
      //--���� �������� ����������� ��������, �� ����������� ��������� ��� ������
      if not TextSmilies then CheckMessage_Smilies(msg);
      //--����������� ������� ��������� ���������
      Inc(OutMessIndex);
      //--��������� � ��� ���������
      AddChatText(msgD, msg);
      //--������������ ��� �� �����
      HTMLChatViewer.VScrollBarPosition := HTMLChatViewer.VScrollBar.Max;
      //--������� ���� ����� �����
      InputMemo.Clear;
      InputMemoChange(self);
      //--�������
      Exit;
    end;
  //--���� ������ ������� ����� � �� ������ ������ �������� �� ����� � ������ ������� ������, �� ��������� � �������� ���������
  if (Key = #13) and (not EnterKeyToolButton.Down) and (GetKeyState(VK_CONTROL) < 0) then goto x;
  //--���� ������ ������ "���������" ���������
  if (Key = #13) and (not EnterKeyToolButton.Down) and (sender.ClassName = 'TBitBtn') then goto x;
end;

procedure TChatForm.CloseTabAllOfflineClick(Sender: TObject);
label
  x;
var
  i: integer;
begin
  //--���� ������� ����, �� ��������� �� ��� �� �������� �������
  with ChatPageControl do
  begin
    if Visible then
    begin
      x: ;
      //--��������� �������
      for i := 0 to PageCount - 1 do
      begin
        case Pages[i].ImageIndex of
          9, 23, 25, 30, 41, 42, 214:
            begin
              Pages[i].Free;
              //--������� �� ���������� �����
              goto x;
            end;
        end;
        //--������������� ���������
        Update;
      end;
      //--���� ������� ��� �������, �� ��������� ���� ����
      if PageCount = 0 then Close
      else ChatPageControlChange(self);
    end;
  end;
end;

procedure TChatForm.CloseTabAllNoCurrentClick(Sender: TObject);
var
  i: integer;
begin
  //--���� ������� ������������, �� ��������� ��� ����� �������
  with ChatPageControl do
  begin
    if Visible then
    begin
      //--��������� �������� ������� � ����� ������ �������
      ActivePage.PageIndex := 0;
      //--��������� ��� ��������� ������� � �����
      if PageCount > 1 then ActivePageIndex := 1;
      for i := 1 to PageCount - 1 do
      begin
        if PageCount > 1 then ActivePage.Free;
        //--������������� ���������
        Update;
      end;
      //--���������� ������ �����
      Height := ActivePage.Top - 3;
    end;
  end;
end;

procedure TChatForm.CloseChatTabMenuClick(Sender: TObject);
begin
  //--��������� ������� ��� ������� ���� ������� ����
  try
    if (ChatPageControl.Visible) and (ChatPageControl.PageCount > 0) then
    begin
      ChatPageControl.Pages[iTab].Free;
      //--���� ������� ������ ���, �� ��������� ����
      if ChatPageControl.PageCount = 0 then Close
      else ChatPageControlChange(self);
    end;
  except
  end;
end;

procedure TChatForm.CloseTabAllClick(Sender: TObject);
begin
  //--��������� ��� ������� ����
  with ChatPageControl do
  begin
    //--���� ������� �������
    if Visible then
    begin
      //--������ ��������� ������� ����� �� ������
      Visible := false;
      //--���������� ��������� ��� �������
      while PageCount > 0 do
      begin
        ActivePage.Free;
        //--������������� ���������
        Update;
      end;
    end;
  end;
  //--��������� ���� ����
  Close;
end;

procedure TChatForm.CopyMemoClick(Sender: TObject);
begin
  //--�������� ���������� ����� �� ���� ����� � ����� ������
  InputMemo.CopyToClipboard;
end;

procedure TChatForm.ChatHTMLQTextClick(Sender: TObject);
var
  Str: string;
begin
  //--�������� ���������� ����� � ���� ����� � ����������� � ������ ������ ������ ������ >
  HTMLChatViewer.CopyToClipboard;
  InputMemo.SelText := '> ';
  InputMemo.PasteFromClipboard;
  InputMemo.Text := Trim(InputMemo.Text);
  Str := AnsiReplaceText(InputMemo.Text, #13#10, #13#10 + '> ');
  InputMemo.Text := Str + #13#10;
  InputMemo.SelStart := InputMemo.GetTextLen;
  if InputMemo.CanFocus then InputMemo.SetFocus;
end;

procedure TChatForm.CopyAllMemoClick(Sender: TObject);
begin
  //--�������� ���� ����� �� ���� ����� � ����� ������
  InputMemo.SelectAll;
  InputMemo.CopyToClipboard;
end;

procedure TChatForm.PasteMemoClick(Sender: TObject);
begin
  //--��������� � ���� ����� ����� �� ������ ������
  InputMemo.PasteFromClipboard;
end;

procedure TChatForm.ChatPageControlChange(Sender: TObject);
var
  UIN, HistoryFile, Doc, HFile: string;
  RosterItem: TListItem;
begin
  //--���� ������ �������, �� �������
  if ChatPageControl.ActivePage = nil then Exit;
  //--�������� ������ ���������� �������
  ChatPageControl.Height := ChatPageControl.ActivePage.Top - 3;
  //--�������� ������� ������ ��������
  UIN := ChatPageControl.ActivePage.HelpKeyword;
  //--���� ��� ������ � ������� � �������� ��� ��������� ��������� � �������� ���������
  RosterItem := RosterForm.ReqRosterItem(UIN);
  if RosterItem <> nil then
  begin
    with RosterItem do
    begin
      //--���������� ��������� ����� ��������
      SubItems[36] := EmptyStr;
      ChatPageControl.ActivePage.Caption := SubItems[0];
      ChatPageControl.ActivePage.Tag := StrToInt(SubItems[6]);
      ChatPageControl.ActivePage.ImageIndex := ChatPageControl.ActivePage.Tag;
      ChatPageControl.ActivePage.Hint := SubItems[34];
      if SubItems[33] = 'X' then UserUtf8Support := true
      else UserUtf8Support := false;
      UserAvatarHash := Hex2Text(SubItems[29]);
      UserType := SubItems[3];
      InputMemo.Text := SubItems[14];
      //--��������� ��������� �� ������� ���
      if SubItems[13] = EmptyStr then
      begin
        //--��������� ���� ������� ���������
        HistoryFile := ProfilePath + 'Profile\History\' + UserType + '_' + UIN + '.z';
        if FileExists(HistoryFile) then
        begin
          try
            //--������������� ���� � ��������
            UnZip_File(HistoryFile, ProfilePath + 'Profile\History\');
            HFile := ProfilePath + 'Profile\History\' + UserType + '_History.htm';
            //--���������� ������� � ��������� � ����� ��������
            SubItems[13] := ReadFromFile(HFile);
            //--������� ��� �� ������ ������������� ���� � ��������
            if FileExists(HFile) then DeleteFile(HFile);
          except
          end;
        end;
      end;
      //--���������� ������� � ����
      if SubItems[13] <> EmptyStr then
      begin
        //--������� ��� �� ������ �������
        HTMLChatViewer.Clear;
        //--��������� �����
        Doc := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
        //--��������� �� ����� ������� ��������� ��������� ���������
        Doc := Doc + TailLineTail(SubItems[13], 5);
        if not TextSmilies then CheckMessage_Smilies(Doc);
        SetLength(Doc, Length(Doc) - 6);
        Doc := Doc + '<HR>';
        HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
        //--������ ������� � ����� ��� ������
        HTMLChatViewer.VScrollBarPosition := HTMLChatViewer.VScrollBar.Max;
        HTMLChatViewer.CaretPos := Length(Doc);
      end
      else
      begin
        //--������� ��� �� ������ �������
        HTMLChatViewer.Clear;
        //--��������� �����
        Doc := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
        HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
      end;
    end;
  end;
  //--������ ��� � ������� � �������������� ����
  InfoPanel1.Caption := NameAndLast(UIN);
  if InfoPanel1.Caption = EmptyStr then InfoPanel1.Caption := ChatPageControl.ActivePage.Caption;
  //--������ ������� ������ �������� � �������������� ����
  InfoPanel2.Caption := UIN;
  //--������ ������ � ���� ����� ���������� �������
  InputMemo.SelStart := InputMemo.GetTextLen;
  //--������ ����� � ���� ����� ������
  if (InputMemo.CanFocus) and (ChatForm.Visible) then InputMemo.SetFocus;
  //--������� ������� � ��������� �� ������ ������� �������� ���������
  RosterForm.DellcIdInMessList(UIN);

  //--��������� ������
  {if (Length(UserAvatarHash) = 32) and ((FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.jpg')) or
    (FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.gif')) or
    (FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.bmp'))) then
  begin
    if FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.jpg') then
      ContactImage.Picture.LoadFromFile(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.jpg')
    else if FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.gif') then
      ContactImage.Picture.LoadFromFile(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.gif')
    else if FileExists(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.bmp') then
      ContactImage.Picture.LoadFromFile(ProfilePath + 'Profile\Avatars\' + UserAvatarHash + '.bmp');
  end
  else
  begin
    if (Length(UserAvatarHash) = 32) and (ICQ_Avatar_Work_Phaze) then
    begin
      ICQ_GetAvatarImage(UIN, UserAvatarHash);
    end;
    if (Length(UserAvatarHash) = 32) and (not AvatarServiceDisable) and (not ICQ_Avatar_Connect_Phaze) and
      (not ICQ_Avatar_Work_Phaze) and (ICQ_Work_Phaze) then
    begin
      ICQ_Avatar_Connect_Phaze := true;
      ICQ_Avatar_Work_Phaze := false;
      ICQ_GetAvatar_UIN := UIN;
      ICQ_GetAvatar_Hash := UserAvatarHash;
      ICQ_GetAvatarBosServer;
    end;
    //SearchAvatarTimer.Enabled := true;
    ContactImage.Picture.Assign(nil);
    ContactImage.Picture.Assign(NoAvatar.Picture);
  end;}
end;

procedure TChatForm.ChatPageControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  diff: TdateTime;
  FCursor: TPoint;
begin
  //--������������ ������� ������ ���� �� �������
  case button of
    mbRight: //--���� ������ ������ �������� ����
      begin
        iTab := pageIdxAt(x, y);
        if iTab < 0 then Exit;
        //--��������� ������� ���� �� ������� �������
        GetCursorPos(FCursor);
        //--���������� ���� ���� �������
        TabPopupMenu.Popup(FCursor.X, FCursor.Y);
      end;
    mbLeft: //--���� ������ ����� �������� ����
      begin
        //--��������� ������� ����
        diff := now - lastClick;
        lastClick := now;
        //--���� ������� ����, �� ��������� ������� � �������
        if (diff < dblClickTime) and (ButtonInd = ChatPageControl.ActivePageIndex) then
        begin
          ButtonInd := -1;
          CloseTabBitBtnClick(self);
          Exit;
        end;
        //--���������� ������ ������� �������
        ButtonInd := ChatPageControl.ActivePageIndex;
      end;
    mbMiddle: //--���� ������ ������� �������� ����
      begin
        iTab := pageIdxAt(x, y);
        if iTab < 0 then Exit;
        //--��������� ��� �������
        CloseChatTabMenuClick(self);
      end;
  end;
end;

procedure TChatForm.ChatPageControlMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  //--��������� ��� ����� �������� � ��� ������, ����� �������� ���������
  if pageIdxAt(X, Y) <> HintInd then Application.CancelHint;
  //--����������� ��������� ��� �������� ���������� �������
  ChatPageControl.Hint := ChatPageControl.Pages[pageIdxAt(X, Y)].Hint;
  //--���������� ������ ������� � ����������
  HintInd := pageIdxAt(X, Y);
end;

procedure TChatForm.SendAllClick(Sender: TObject);
begin
  //--
  ShowMessage(DevelMess);
end;

procedure TChatForm.SendAllOnlineClick(Sender: TObject);
begin
  //--
  ShowMessage(DevelMess);
end;

procedure TChatForm.SendFileSpeedButtonClick(Sender: TObject);
begin
  //--��������� ���� ��� ���� ���������
  Popup(SendFileSpeedButton, FileTransferPopupMenu);
end;

procedure TChatForm.SendFileSpeedButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //--��������� ���� ��� ���� ���������
  if Button = mbRight then Popup(SendFileSpeedButton, FileTransferPopupMenu);
end;

procedure TChatForm.SendMessageBitBtnClick(Sender: TObject);
var
  k: Char;
begin
  //--�������� ������� ������� ������� ����� ��� ���� ����� ������
  k := #13;
  InputMemoKeyPress(Sender, k);
  //--������ ����� ������� � ���� �����
  if (ChatForm.InputMemo.CanFocus) and (ChatForm.Visible) then ChatForm.InputMemo.SetFocus;
end;

procedure TChatForm.MyAvatarPanelSpeedButtonClick(Sender: TObject);
var
  FCursor: TPoint;
begin
  //--������ ������ � ���������
  GetCursorPos(FCursor);
  if MyAvatarPanelSpeedButton.NumGlyphs = 1 then
  begin
    MyAvatarPanel.Width := 0;
    MyAvatarPanelSpeedButton.NumGlyphs := 4;
    SetCursorPos(FCursor.X + 68, FCursor.Y);
  end
  else
  begin
    MyAvatarPanel.Width := 68;
    MyAvatarPanelSpeedButton.NumGlyphs := 1;
    SetCursorPos(FCursor.X - 68, FCursor.Y);
  end;
end;

procedure TChatForm.InfoContactSpeedButtonClick(Sender: TObject);
begin
  //--��������� ���� ���������� � ��������
  if not Assigned(IcqContactInfoForm) then IcqContactInfoForm := TIcqContactInfoForm.Create(MainForm);
  //--����������� UIN ���� �������� ����� ��������
  IcqContactInfoForm.ReqUIN := InfoPanel2.Caption;
  //--��������� ���������� � ���
  IcqContactInfoForm.LoadUserUnfo;
  //--���������� ���� �� �������� ����
  xShowForm(IcqContactInfoForm);
end;

procedure TChatForm.EditContactSpeedButtonClick(Sender: TObject);
begin
  //--
  ShowMessage(DevelMess);
end;

procedure TChatForm.ChatSplitterMoved(Sender: TObject);
begin
  //--�������������� ���������� �������
  MyAvatarPanelSpeedButton.Refresh;
  MyAvatarPanel.Refresh;
end;

procedure TChatForm.ChatFontToolButtonClick(Sender: TObject);
begin
  //--
  ShowMessage(DevelMess);
end;

procedure TChatForm.ChatSettingsToolButtonClick(Sender: TObject);
begin
  //--���������� ���� �������� � ������� ���� ���������
  if Assigned(SettingsForm) then
  begin
    with SettingsForm do
    begin
      //--���������� ����
      if Visible then ShowWindow(Handle, SW_RESTORE);
      Show;
      //--���������� ������
      JvPageList1.ActivePageIndex := 2;
      SettingButtonGroup.ItemIndex := 2;
    end;
  end;
end;

procedure TChatForm.TranslateForm;
begin
  //--��������� ����� �� ������ �����

end;

procedure TChatForm.TypingTextToolButtonClick(Sender: TObject);
begin
  ShowMessage(DevelMess);
end;

procedure TChatForm.UpWapru1Click(Sender: TObject);
begin
  //--��������� ����� �������� ������
  if not Assigned(FileTransferForm) then FileTransferForm := TFileTransferForm.Create(self);
  //--����������� ���������� ������� ��������
  FileTransferForm.Tag := (Sender as TMenuItem).Tag;
  //--���������� ����
  xShowForm(FileTransferForm);
end;

procedure TChatForm.FormActivate(Sender: TObject);
var
  RosterItem: TListItem;
begin
  //--���������� ������ � �������� ������� � ���� ����
  if ChatPageControl.ActivePage = nil then Exit;
  ChatPageControl.ActivePage.ImageIndex := ChatPageControl.ActivePage.Tag;
  //--���������� ������ ��������� � �������
  RosterItem := RosterForm.ReqRosterItem(InfoPanel2.Caption);
  if RosterItem <> nil then RosterItem.SubItems[36] := EmptyStr;
  //--������� ������� � ��������� �� ������ ������� �������� ���������
  RosterForm.DellcIdInMessList(InfoPanel2.Caption);
end;

procedure TChatForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //--������� �� �������� ���� ���� �� ������� ���������
  BringWindowToTop(MainForm.Handle);
end;

procedure TChatForm.FormCreate(Sender: TObject);
begin
  //--�������������� XML
  with TrXML.Create() do try
    //--��������� ���������
    if FileExists(ProfilePath + SettingsFileName) then
    begin
      LoadFromFile(ProfilePath + SettingsFileName);
      //--��������� ������� ����
      if OpenKey('settings\forms\chatform\position') then
      try
        Top := ReadInteger('top');
        Left := ReadInteger('left');
        Height := ReadInteger('height');
        Width := ReadInteger('width');
        //--��������� ������� ���������
        BottomChatFormPanel.Height := ReadInteger('chat-splitter', 130);
        ChatCategoryButtons.Width := ReadInteger('group-splitter', 130);
        //--���������� �� ��������� �� ���� �� ��������� ������
        MainForm.FormSetInWorkArea(self);
      finally
        CloseKey();
      end;
      //--��������� "���������� �� �����"
      if OpenKey('settings\forms\chatform\send-enter') then
      try
        EnterKeyToolButton.Down := ReadBool('value');
      finally
        CloseKey();
      end;
      //--��������� ���������� ����� � ������ ������
      if OpenKey('settings\forms\chatform\send-typing-notify') then
      try
        TypingTextToolButton.Down := ReadBool('value');
      finally
        CloseKey();
      end;
      //--��������� "���� ������� ������"
      if OpenKey('settings\forms\chatform\key-sound') then
      try
        KeySoundToolButton.Down := ReadBool('value');
      finally
        CloseKey();
      end;
      //--��������� ��������� ������� ������
      if OpenKey('settings\forms\chatform\avatar-panels') then
      try
        ContactAvatarPanel.Width := ReadInteger('contact-avatar', 68);
        if ContactAvatarPanel.Width = 0 then
        begin
          ContactAvatarPanelSpeedButton.NumGlyphs := 1;
          InfoPanel1.Left := 9;
          InfoPanel3.Left := 9;
          InfoPanel1.Width := Width - 238;
          InfoPanel3.Width := InfoPanel1.Width;
        end;
        MyAvatarPanel.Width := ReadInteger('my-avatar', 68);
        if MyAvatarPanel.Width = 0 then
          MyAvatarPanelSpeedButton.NumGlyphs := 4;
      finally
        CloseKey();
      end;
    end;
  finally
    Free();
  end;
  //--�������� ������� �������� ��� �������
  ChatPageControl.DoubleBuffered := true;
  //--������������� ��������� ������ ���������
  HintInd := -1;
  //--����������� ���� � ������� ������
  MainForm.AllImageList.GetIcon(163, Icon);
  MainForm.AllImageList.GetBitmap(156, SmiliesSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(216, QSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(157, QRepSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(147, HistorySpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(149, SendFileSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(159, ClearChatSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(178, InfoContactSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(141, EditContactSpeedButton.Glyph);
  MainForm.AllImageList.GetBitmap(166, SendMessageBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(158, CloseTabBitBtn.Glyph);
  //--������ ��������� �������� ������ ������� ��� �������� � �����������
  NoAvatar := TImage.Create(MainForm);
  if FileExists(MyPath + 'Icons\' + CurrentIcons + '\noavatar.gif') then
    NoAvatar.Picture.LoadFromFile(MyPath + 'Icons\' + CurrentIcons + '\noavatar.gif');
  //--������ ������ ������������ ���������
  OutMessage2 := TMemoryStream.Create;
  if FileExists(MyPath + 'Icons\' + CurrentIcons + '\outmess2.gif') then
    OutMessage2.LoadFromFile(MyPath + 'Icons\' + CurrentIcons + '\outmess2.gif');
  OutMessage3 := TMemoryStream.Create;
  if FileExists(MyPath + 'Icons\' + CurrentIcons + '\outmess3.gif') then
    OutMessage3.LoadFromFile(MyPath + 'Icons\' + CurrentIcons + '\outmess3.gif');
  //--����������� �������� ������ ������� � ����� ��� ������
  ContactAvatarImage.Picture.Assign(NoAvatar.Picture);
  MyAvatarImage.Picture.Assign(NoAvatar.Picture);
  //--��������� ����� �� ������ �����
  TranslateForm;
  //--������ ���� ������� �������
  CreateFastReplyMenu;
  //--�������� ������ ����� � ������� � ������ �����������
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
  //--������ ���� ����������� � ����� ������
  ScreenSnap := true;
  //--���� �������� ������ ����������� ���������� �����������
  ChatCategoryButtons.Visible := false;
  GroupSplitter.Visible := false;
end;

procedure TChatForm.FormDestroy(Sender: TObject);
begin
  //--������ ����������� �����
  ForceDirectories(ProfilePath + 'Profile');
  //--��������� ��������� ��������� ���� ���� � xml
  with TrXML.Create() do
  try
    if FileExists(ProfilePath + SettingsFileName) then
      LoadFromFile(ProfilePath + SettingsFileName);
    //--��������� ������� ����
    if OpenKey('settings\forms\chatform\position', True) then
    try
      WriteInteger('top', Top);
      WriteInteger('left', Left);
      WriteInteger('height', Height);
      WriteInteger('width', Width);
      //--��������� ������� ���������
      WriteInteger('chat-splitter', BottomChatFormPanel.Height);
      WriteInteger('group-splitter', ChatCategoryButtons.Width);
    finally
      CloseKey();
    end;
    //--��������� "���������� �� �����"
    if OpenKey('settings\forms\chatform\send-enter', True) then
    try
      WriteBool('value', EnterKeyToolButton.Down);
    finally
      CloseKey();
    end;
    //--��������� ���������� ����� � ������ ������
    if OpenKey('settings\forms\chatform\send-typing-notify', True) then
    try
      WriteBool('value', TypingTextToolButton.Down);
    finally
      CloseKey();
    end;
    //--��������� "���� ������� ������"
    if OpenKey('settings\forms\chatform\key-sound', True) then
    try
      WriteBool('value', KeySoundToolButton.Down);
    finally
      CloseKey();
    end;
    //--��������� ��������� ������� ������
    if OpenKey('settings\forms\chatform\avatar-panels', True) then
    try
      WriteInteger('contact-avatar', ContactAvatarPanel.Width);
      WriteInteger('my-avatar', MyAvatarPanel.Width);
    finally
      CloseKey();
    end;
    //--���������� ��� ����
    SaveToFile(ProfilePath + SettingsFileName);
  finally
    Free();
  end;
end;

procedure TChatForm.FormResize(Sender: TObject);
begin
  //--���� ������ �������, �� �������
  if ChatPageControl.ActivePage = nil then Exit;
  //--���������� ������ ������� ��� ���������� ������
  ChatPageControl.Height := ChatPageControl.ActivePage.Top - 3;
end;

procedure TChatForm.HtmlPopupMenuPopup(Sender: TObject);
begin
  //--��������� ���� �� ���������� ����� � ������� ����
  if HTMLChatViewer.SelLength = 0 then
  begin
    ChatHTMLTextCopy.Enabled := false;
    ChatHTMLQText.Enabled := false;
  end
  else
  begin
    ChatHTMLTextCopy.Enabled := true;
    ChatHTMLQText.Enabled := true;
  end;
end;

procedure TChatForm.HistorySpeedButtonClick(Sender: TObject);
begin
  //--��������� ���� �������
  if not Assigned(HistoryForm) then HistoryForm := THistoryForm.Create(self);
  //--��������� ���� ������� ��� �������� ����
  HistoryForm.LoadHistoryFromFile(InfoPanel2.Caption);
  //--���������� ����
  if HistoryForm.Visible then ShowWindow(HistoryForm.Handle, SW_RESTORE);
  HistoryForm.Show;
end;

procedure TChatForm.HistorySpeedButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //--��������� ���� ��� ���� ���������
  if Button = mbRight then Popup(HistorySpeedButton, HistoryShowPopupMenu);
end;

procedure TChatForm.HTMLChatViewerHotSpotClick(Sender: TObject; const SRC: string;
  var Handled: Boolean);
begin
  Handled := true;
  //--��������� ������ �� ���� �� ������� ��������
  OpenURL(SRC);
end;

procedure TChatForm.HTMLChatViewerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //--��� ������� ���������� ������ ������ + � � ������� ����
  //�������� ���������� ����� � ����� ������
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 67) then
    HTMLChatViewer.CopyToClipboard;
end;

procedure TChatForm.HTMLChatViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //--���������� ��������� ������ � ���� �� ����� ����� �������� ����
  if Button = mbLeft then HTMLChatViewer.SelLength := 0;
end;

procedure TChatForm.SmiliesSpeedButtonClick(Sender: TObject);
var
  xPoint: TPoint;
begin
  //--���� ���� �� ������� ���, �� ������ ���
  if not Assigned(SmilesForm) then SmilesForm := TSmilesForm.Create(nil);
  //--����������� ���� ����
  SmilesForm.PopupParent := ChatForm;
  //--��������� ������� ��� ���������� ���������
  xPoint := Point(SmiliesSpeedButton.Width, SmiliesSpeedButton.Top);
  with SmiliesSpeedButton.ClientToScreen(xPoint) do
  begin
    SmilesForm.Left := X - SmiliesSpeedButton.Width;
    SmilesForm.Top := (Y - SmilesForm.Height) - 2;
  end;
  //--������ ����� ���� ������������ ������ ���� (������ ����� � ����)
  SetWindowPos(SmilesForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or
    SWP_NOACTIVATE or SWP_NOOWNERZORDER or SWP_NOREDRAW or SWP_NOSENDCHANGING);
  //--���������� ���� �������
  SmilesForm.Show;
end;

procedure TChatForm.SendMessageSpeedButtonDropClick(Sender: TObject);
begin
  //--��������� ���� ��� ���� ���������
  Popup_down(SendMessageSpeedButtonDrop, SendPopupMenu);
end;

procedure TChatForm.ContactAvatarPanelSpeedButtonClick(Sender: TObject);
var
  FCursor: TPoint;
begin
  //--������ ������ � ���������
  GetCursorPos(FCursor);
  if ContactAvatarPanelSpeedButton.NumGlyphs = 4 then
  begin
    ContactAvatarPanel.Width := 0;
    ContactAvatarPanelSpeedButton.NumGlyphs := 1;
    SetCursorPos(FCursor.X - 68, FCursor.Y);
    InfoPanel1.Left := ContactAvatarPanelSpeedButton.Left + 8;
    InfoPanel3.Left := InfoPanel1.Left;
    InfoPanel1.Width := InfoPanel2.Left - 15;
    InfoPanel3.Width := InfoPanel1.Width;
  end
  else
  begin
    ContactAvatarPanel.Width := 68;
    ContactAvatarPanelSpeedButton.NumGlyphs := 4;
    SetCursorPos(FCursor.X + 68, FCursor.Y);
    InfoPanel1.Left := ContactAvatarPanelSpeedButton.Left + 8;
    InfoPanel3.Left := InfoPanel1.Left;
    InfoPanel1.Width := InfoPanel2.Left - 83;
    InfoPanel3.Width := InfoPanel1.Width;
  end;
end;

procedure TChatForm.ContactMenuToolButtonClick(Sender: TObject);
begin
  //--��������� ���� ��� ���� ���������
  Popup(ContactMenuToolButton, ChatUserPopupMenu);
end;

procedure TChatForm.ContactMenuToolButtonContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  //--��������� ���� ��� ���� ���������
  Popup(ContactMenuToolButton, ChatUserPopupMenu);
end;

procedure TChatForm.ClearChatSpeedButtonClick(Sender: TObject);
var
  Doc: string;
begin
  //--������� ���� ���� �� ������� ���������
  HTMLChatViewer.Clear;
  //--��������� �����
  Doc := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
  HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
end;

procedure TChatForm.CloseTabBitBtnClick(Sender: TObject);
begin
  //--��������� ������� ����
  if (ChatPageControl.Visible) and (ChatPageControl.PageCount > 0) then
  begin
    ChatPageControl.ActivePage.Free;
    //--���� ������� ������ ���, �� ��������� ����
    if ChatPageControl.PageCount = 0 then Close
    else ChatPageControlChange(self);
  end;
end;

procedure TChatForm.CloseTabSpeedButtonDropClick(Sender: TObject);
begin
  //--��������� ���� ��� ���� ���������
  Popup_down(CloseTabSpeedButtonDrop, CloseTabPopupMenu);
end;

procedure TChatForm.ShowAllHistoryClick(Sender: TObject);
var
  Doc: string;
  RosterItem: TListItem;
begin
  //--���� ��� ������ � ������� � �������� ��� ��������� ��������� � �������� ���������
  RosterItem := RosterForm.ReqRosterItem(InfoPanel2.Caption);
  if RosterItem <> nil then
  begin
    with RosterItem do
    begin
      //--��������� ��������� �� �������
      if SubItems[13] = EmptyStr then Exit
      //--���������� ������� � ����
      else
      begin
        //--�������� ��������� ������� � ������� �������, ��� ������� �����������
        Doc := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
        Doc := Doc + '<span class=b>' + HistoryLoadFileL + '</span>';
        HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
        HTMLChatViewer.Refresh;
        //--��������� �����
        Doc := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
        //--��������� �� ������� ��������� ��������� ���������
        if (Sender as TMenuItem).Tag = 1 then Doc := Doc + SubItems[13]
        else if (Sender as TMenuItem).Tag = 2 then Doc := Doc + TailLineTail(SubItems[13], 100)
        else if (Sender as TMenuItem).Tag = 3 then Doc := Doc + TailLineTail(SubItems[13], 50)
        else if (Sender as TMenuItem).Tag = 4 then Doc := Doc + TailLineTail(SubItems[13], 20);
        if not TextSmilies then ChatForm.CheckMessage_Smilies(Doc);
        SetLength(Doc, Length(Doc) - 6);
        Doc := Doc + '<HR>';
        HTMLChatViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
        //--������ ������� � ����� ��� ������
        HTMLChatViewer.VScrollBarPosition := HTMLChatViewer.VScrollBar.Max;
        HTMLChatViewer.CaretPos := Length(Doc);
      end;
    end;
  end;
end;

procedure TChatForm.ChatHTMLTextCopyClick(Sender: TObject);
begin
  //--�������� ���������� ����� � ����� ������
  HTMLChatViewer.CopyToClipboard;
end;

procedure TChatForm.MemoPopupMenuPopup(Sender: TObject);
begin
  //--��������� �������� ����
  if InputMemo.SelLength = 0 then
  begin
    CutMemo.Enabled := false;
    CopyMemo.Enabled := false;
  end
  else
  begin
    CutMemo.Enabled := true;
    CopyMemo.Enabled := true;
  end;
end;

procedure TChatForm.CutMemoClick(Sender: TObject);
begin
  //--�������� � ����� ������
  InputMemo.CutToClipboard;
end;

procedure TChatForm.ChatHTMLAllTextCopyClick(Sender: TObject);
begin
  //--�������� �� � �������� � ����� ������
  HTMLChatViewer.SelectAll;
  HTMLChatViewer.CopyToClipboard;
end;

end.
