﻿{ *******************************************************************************
  Copyright (c) 2004-2009 by Edyard Tolmachev
  IMadering project
  http://imadering.com
  ICQ: 118648
  E-mail: imadering@mail.ru
  ******************************************************************************* }

unit IcqReqAuthUnit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  CategoryButtons,
  Buttons;

type
  TIcqReqAuthForm = class(TForm)
    InfoMemo: TMemo;
    HeadLabel: TLabel;
    YesBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    CountLabel: TLabel;
    procedure YesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure InfoMemoChange(Sender: TObject);
    procedure InfoMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Invite: Boolean;
    UpDate: Boolean;
    Twit: Boolean;
    procedure UpDateVersion(M: string);
    procedure PostInTwitter(M: string);
    procedure TranslateForm;
  end;

var
  IcqReqAuthForm: TIcqReqAuthForm;

implementation

{$R *.dfm}

uses
  MainUnit,
  IcqProtoUnit,
  VarsUnit,
  UtilsUnit,
  UpdateUnit,
  OverbyteIcsUrl,
  OverbyteIcsHttpProt,
  LoginUnit;

procedure TIcqReqAuthForm.TranslateForm;
begin
  // Создаём шаблон для перевода
  // CreateLang(Self);
  // Применяем язык
  SetLang(Self);
end;

procedure TIcqReqAuthForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Автоматически уничтожаем форму при закрытии
  if UpDate then
    begin
      Action := CaFree;
      IcqReqAuthForm := nil;
    end;
end;

procedure TIcqReqAuthForm.FormCreate(Sender: TObject);
begin
  TranslateForm;
  // Присваиваем иконку окну и кнопке
  MainForm.AllImageList.GetBitmap(139, NoBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(140, YesBitBtn.Glyph);
  // Помещаем кнопку формы в таскбар и делаем независимой
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TIcqReqAuthForm.FormDblClick(Sender: TObject);
begin
  // Устанавливаем перевод
  TranslateForm;
end;

procedure TIcqReqAuthForm.FormShow(Sender: TObject);
begin
  // Если Твит, то ставим фокус в поле ввода
  if (Twit) and (InfoMemo.CanFocus) then
    begin
      InfoMemo.SetFocus;
      InfoMemo.SelStart := InfoMemo.GetTextLen;
    end;
end;

procedure TIcqReqAuthForm.InfoMemoChange(Sender: TObject);
var
  S: string;
begin
  // Отображаем счётчик символов
  if Twit then
    begin
      S := InfoMemo.Text;
      if InfoMemo.GetTextLen > 140 then
        begin
          SetLength(S, 140);
          InfoMemo.Text := S;
        end;
      CountLabel.Caption := Format(S_CharsCount, [InfoMemo.GetTextLen, '140']);
    end;
end;

procedure TIcqReqAuthForm.InfoMemoKeyPress(Sender: TObject; var Key: Char);
begin
  // Если это твит, то ограничиваем количество вводимых символов до 140
  if Twit then
    if (InfoMemo.GetTextLen >= 140) and (Key <> #8) then
      Key := #0;
end;

procedure TIcqReqAuthForm.NoBitBtnClick(Sender: TObject);
begin
  // Закрываем окно
  if (UpDate) or (Twit) then
    Close;
end;

procedure TIcqReqAuthForm.UpDateVersion(M: string);
begin
  // Ставим иконку окну
  MainForm.AllImageList.GetIcon(6, Icon);
  // Отображаем информацию и запрос на закачку новой версии
  Caption := UpDate3L;
  HeadLabel.Caption := UpDate1L;
  CountLabel.Caption := EmptyStr;
  InfoMemo.Text := UpDate2L + RN + RN + M;
  // Ставим флаги функции окна
  UpDate := True;
  Invite := False;
  Twit := False;
  // Блокируем мемо
  InfoMemo.readonly := True;
  InfoMemo.Color := ClBtnFace;
end;

procedure TIcqReqAuthForm.PostInTwitter(M: string);
begin
  // Ставим иконку окну
  MainForm.AllImageList.GetIcon(272, Icon);
  // Отображаем информацию и запрос на закачку новой версии
  Caption := S_Twitter + ': ' + S_PostInTwitter;
  HeadLabel.Caption := S_PostInTwitter;
  InfoMemo.Text := M;
  // Ставим флаги функции окна
  UpDate := False;
  Invite := False;
  Twit := True;
  // Разблокируем мемо
  InfoMemo.readonly := False;
  InfoMemo.Color := ClWindow;
  // Обновляем счётчик
  InfoMemoChange(nil);
end;

procedure TIcqReqAuthForm.YesBitBtnClick(Sender: TObject);
// label
// x;
var
  S, PostData: string;
  FrmLogin: TLoginForm;
begin
  // Автообновление
  if UpDate then
    begin
      // Открываем окно автообновления
      if not Assigned(UpdateForm) then
        UpdateForm := TUpdateForm.Create(MainForm);
      // Отображаем окно на передний план
      XShowForm(UpdateForm);
      // Запускаем процесс получения информации для обновления
      UpdateForm.StartBitBtnClick(nil);
      // Закрываем это окно
      Close;
    end
  else if Twit then // Пост в Твиттер
    begin
      S := Trim(InfoMemo.Text);
      if S = EmptyStr then
        Exit;
      // Проверяем логин Твита
      if (Twit_Login = EmptyStr) or (Twit_Password = EmptyStr) then
        begin
          FrmLogin := TLoginForm.Create(Self);
          try
            MainForm.AllImageList.GetIcon(268, FrmLogin.Icon);
            FrmLogin.Caption := S_Twitter;
            // Модально спрашиваем логин и пароль
            if FrmLogin.ShowModal = MrOk then
              begin
                Twit_Login := FrmLogin.AccountEdit.Text;
                Twit_Password := FrmLogin.PasswordEdit.Text;
              end;
          finally
            FreeAndNil(FrmLogin);
          end;
        end;
      // Запускаем метод Post
      if (Twit_Login <> EmptyStr) and (Twit_Password <> EmptyStr) then
        begin
          with MainForm.TwitterHttpClient do
            begin
              Abort;
              Username := Twit_Login;
              Password := Twit_Password;
              URL := Format(RS_PostInTwit, [URLEncode(S)]);
              PostData := EmptyStr;
              SendStream := TMemoryStream.Create;
              SendStream.write(PostData[1], Length(PostData));
              SendStream.Seek(0, 0);
              PostAsync;
            end;
        end;
      // Закрываем это окно
      Close;
    end;

  { if RoasterForm.Roaster_Sel_Button = nil then goto x;
    //
    if Invite then
    begin
    Sini := TIniFile.Create(Mypath + 'Config.ini');
    Sini.WriteString('qwe', 'Invite', Encrypt(Memo1.Text, 12345));
    Sini.Free;
    //
    ICQ_SendMessage_0406(RoasterForm.Roaster_Sel_Button.UIN, Memo1.Text, true);
    end
    else
    begin
    ICQ_SendGrandAuth(RoasterForm.Roaster_Sel_Button.UIN);
    ICQ_ReqAuthSend(RoasterForm.Roaster_Sel_Button.UIN, Memo1.Text);
    end;
    //
    x: ;
    ModalResult := mrOk; }
end;

end.
