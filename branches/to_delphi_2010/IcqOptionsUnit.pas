﻿{ *******************************************************************************
  Copyright (c) 2004-2009 by Edyard Tolmachev
  IMadering project
  http://imadering.com
  ICQ: 118648
  E-mail: imadering@mail.ru
  ******************************************************************************* }

unit IcqOptionsUnit;

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
  ButtonGroup,
  JvPageList,
  JvExControls,
  ExtCtrls,
  StdCtrls,
  Buttons,
  ComCtrls,
  OverbyteIcsWSocket,
  VarsUnit,
  ShellApi,
  RXML;

type
  TIcqOptionsForm = class(TForm)
    ICQOptionButtonGroup: TButtonGroup;
    GeneralPanel: TPanel;
    OptionJvPageList: TJvPageList;
    AccountPage: TJvStandardPage;
    PrivatPage: TJvStandardPage;
    BonusPage: TJvStandardPage;
    IDClientPage: TJvStandardPage;
    ApplyButton: TBitBtn;
    CancelButton: TBitBtn;
    OKButton: TBitBtn;
    CheckBox5: TCheckBox;
    PassChangePage: TJvStandardPage;
    AnketaPage: TJvStandardPage;
    ClientIDGroupBox: TGroupBox;
    ClientIDComboBox: TComboBox;
    ClientIDLabel: TLabel;
    ClientProtoVerEdit: TEdit;
    ClientProtoVerLabel: TLabel;
    ClientCaps1Edit: TEdit;
    ClientCaps2Edit: TEdit;
    ClientCapsLabel: TLabel;
    MyInfoNameGroupBox: TGroupBox;
    OtherOptionsGroupBox: TGroupBox;
    ShowAwayTimeCheckBox: TCheckBox;
    AccountGroupBox: TGroupBox;
    ReqPassLabel: TLabel;
    ICQUINLabel: TLabel;
    PassLabel: TLabel;
    ICQUINEdit: TEdit;
    PassEdit: TEdit;
    ShowPassCheckBox: TCheckBox;
    SavePassCheckBox: TCheckBox;
    HomePage: TJvStandardPage;
    WorkPage: TJvStandardPage;
    PersonalPage: TJvStandardPage;
    InterestsPage: TJvStandardPage;
    AvatarPage: TJvStandardPage;
    AuthAndWebStatusGroupBox: TGroupBox;
    NoAutoAuthRadioButton: TRadioButton;
    YesAutoAuthRadioButton: TRadioButton;
    ShowWebAwareCheckBox: TCheckBox;
    PrivatLevelGroupBox: TGroupBox;
    PrivatLevelLabel: TLabel;
    PrivatLevelInfoLabel: TLabel;
    PrivatLevelTrackBar: TTrackBar;
    AutoReqAuthCheckBox: TCheckBox;
    CustomICQPacketGroupBox: TGroupBox;
    SendCustomICQPacketButton: TButton;
    ClientCaps3Edit: TEdit;
    ClientVersionEdit: TEdit;
    ClientVersionLabel: TLabel;
    PassChangeGroupBox: TGroupBox;
    ChangePassButton: TButton;
    ShowPassChangeCheckBox: TCheckBox;
    RetypeNewPassEdit: TEdit;
    RetypeNewPassLabel: TLabel;
    NewPassChangeEdit: TEdit;
    NewPassChangeLabel: TLabel;
    ReqPassChangeLabel: TLabel;
    CurrentPassChangeEdit: TEdit;
    CurrentPassChangeLabel: TLabel;
    FamilyInfoEdit: TEdit;
    FamilyInfoLabel: TLabel;
    NameInfoEdit: TEdit;
    NameInfoLabel: TLabel;
    NickInfoEdit: TEdit;
    NickInfoLabel: TLabel;
    EmailsInfoGroupBox: TGroupBox;
    EmailInfo1Label: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    EmailInfo2Label: TLabel;
    EmailInfo3Label: TLabel;
    EmailInfo1Edit: TEdit;
    EmailInfo2Edit: TEdit;
    EmailInfo3Edit: TEdit;
    RegDateInfoEdit: TEdit;
    RegDateInfoLabel: TLabel;
    SendMessInfoLabel: TLabel;
    SendMessInfoEdit: TEdit;
    InMessInfoLabel: TLabel;
    InMessInfoEdit: TEdit;
    ExternalIPInfoLabel: TLabel;
    ExternalIPInfoEdit: TEdit;
    LastTimeInfoLabel: TLabel;
    LastTimeInfoEdit: TEdit;
    ConnectTimeInfoLabel: TLabel;
    ConnectTimeInfoEdit: TEdit;
    OriginalInfoGroupBox: TGroupBox;
    OCountryInfoLabel: TLabel;
    OCityInfoLabel: TLabel;
    OAreaInfoLabel: TLabel;
    OCountryInfoComboBox: TComboBox;
    OCityInfoEdit: TEdit;
    OAreaInfoEdit: TEdit;
    HomeInfoGroupBox: TGroupBox;
    CountryInfoLabel: TLabel;
    CityInfoLabel: TLabel;
    AreaInfoLabel: TLabel;
    ZipInfoLabel: TLabel;
    StreetInfoLabel: TLabel;
    PhoneInfoLabel: TLabel;
    FaxInfoLabel: TLabel;
    CelularInfoLabel: TLabel;
    CityInfoEdit: TEdit;
    AreaInfoEdit: TEdit;
    ZipInfoEdit: TEdit;
    StreetInfoEdit: TEdit;
    PhoneInfoEdit: TEdit;
    FaxInfoEdit: TEdit;
    CelularInfoEdit: TEdit;
    CountryInfoComboBox: TComboBox;
    WorkInfoGroupBox: TGroupBox;
    WorkCountryInfoLabel: TLabel;
    WorkCityInfoLabel: TLabel;
    WorkAreaInfoLabel: TLabel;
    WorkZipInfoLabel: TLabel;
    WorkPhoneInfoLabel: TLabel;
    WorkFaxInfoLabel: TLabel;
    WorkStreetInfoLabel: TLabel;
    WorkCityInfoEdit: TEdit;
    WorkAreaInfoEdit: TEdit;
    WorkZipInfoEdit: TEdit;
    WorkPhoneInfoEdit: TEdit;
    WorkFaxInfoEdit: TEdit;
    WorkStreetInfoEdit: TEdit;
    WorkCountryInfoComboBox: TComboBox;
    CompanyInfoGroupBox: TGroupBox;
    CompanyNameInfoLabel: TLabel;
    CompanyCabInfoLabel: TLabel;
    CompanyProfInfoLabel: TLabel;
    CompanyMasteInfoLabel: TLabel;
    CompanySiteInfoLabel: TLabel;
    CompanyNameInfoEdit: TEdit;
    CompanyCabInfoEdit: TEdit;
    CompanyProfInfoComboBox: TComboBox;
    CompanyMasteInfoEdit: TEdit;
    CompanySiteInfoEdit: TEdit;
    ParamsPage: TJvStandardPage;
    PersonalInfoGroupBox: TGroupBox;
    PersonalGenderInfoLabel: TLabel;
    PersonalMaritalInfoLabel: TLabel;
    SpeedButton3: TSpeedButton;
    PersonalHomePageInfoLabel: TLabel;
    PersonalBirthDayInfoLabel: TLabel;
    HoroImage: TImage;
    PersonalAgeInfoLabel: TLabel;
    PersonalDayInfoLabel: TLabel;
    PersonalMonInfoLabel: TLabel;
    PersonalYearInfoLabel: TLabel;
    PersonalChildrenInfoLabel: TLabel;
    PersonalReligionInfoLabel: TLabel;
    PersonalHeightInfoLabel: TLabel;
    PersonalSmokInfoLabel: TLabel;
    PersonalSexInfoLabel: TLabel;
    PersonalHairColourInfoLabel: TLabel;
    PersonalGenderInfoComboBox: TComboBox;
    PersonalMaritalInfoComboBox: TComboBox;
    PersonalHomePageInfoEdit: TEdit;
    PersonalYearInfoEdit: TEdit;
    PersonalAgeInfoEdit: TEdit;
    PersonalChildrenInfoComboBox: TComboBox;
    PersonalReligionInfoComboBox: TComboBox;
    PersonalDayInfoComboBox: TComboBox;
    PersonalMonInfoComboBox: TComboBox;
    PersonalHeightInfoComboBox: TComboBox;
    PersonalSmokInfoComboBox: TComboBox;
    PersonalSexInfoComboBox: TComboBox;
    PersonalHairColourInfoComboBox: TComboBox;
    LangsInfoGroupBox: TGroupBox;
    Lang1InfoComboBox: TComboBox;
    Lang2InfoComboBox: TComboBox;
    Lang3InfoComboBox: TComboBox;
    InterestInfoGroupBox: TGroupBox;
    Interest1InfoComboBox: TComboBox;
    Interest2InfoComboBox: TComboBox;
    Interest3InfoComboBox: TComboBox;
    Interest4InfoComboBox: TComboBox;
    Interest1InfoEdit: TEdit;
    Interest2InfoEdit: TEdit;
    Interest3InfoEdit: TEdit;
    Interest4InfoEdit: TEdit;
    AvatarInfoGroupBox: TGroupBox;
    AvatarInfoPanel: TPanel;
    AvatarInfoImage: TImage;
    ParamInfoGroupBox: TGroupBox;
    SendCustomICQPacketRichEdit: TRichEdit;
    SendCustomICQPaketTimerCheckBox: TCheckBox;
    SendCustomICQPaketTimerEdit: TEdit;
    SendCustomICQPaketTimer: TTimer;
    ParamInfoRichEdit: TRichEdit;
    CountryCodesComboBox: TComboBox;
    OccupationCodeComboBox: TComboBox;
    LangsCodeComboBox: TComboBox;
    InterestsCodesComboBox: TComboBox;
    MaritalCodesComboBox: TComboBox;
    HairColourCodesComboBox: TComboBox;
    ReligionCodesComboBox: TComboBox;
    SmokCodesComboBox: TComboBox;
    SexCodesComboBox: TComboBox;
    GroupBox1: TGroupBox;
    ShowHideContactsCheckBox: TCheckBox;
    RegNewUINLabel: TLabel;
    ConnectPage: TJvStandardPage;
    DumpInfoRichEdit: TRichEdit;
    AboutInfoGroupBox: TGroupBox;
    AboutInfoRichEdit: TRichEdit;
    Bevel1: TBevel;
    ClientIdInfoRichEdit: TRichEdit;
    PassChangeInfoRichEdit: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure ReqPassLabelMouseLeave(Sender: TObject);
    procedure ReqPassLabelMouseEnter(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ICQOptionButtonGroupButtonClicked(Sender: TObject; index: Integer);
    procedure ICQUINEditChange(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure ShowPassCheckBoxClick(Sender: TObject);
    procedure ReqPassLabelClick(Sender: TObject);
    procedure ShowPassChangeCheckBoxClick(Sender: TObject);
    procedure ChangePassButtonClick(Sender: TObject);
    procedure PassEditClick(Sender: TObject);
    procedure SendCustomICQPaketTimerEditExit(Sender: TObject);
    procedure SendCustomICQPaketTimerEditKeyPress(Sender: TObject; var Key: Char);
    procedure SendCustomICQPacketButtonClick(Sender: TObject);
    procedure SendCustomICQPaketTimerTimer(Sender: TObject);
    procedure RegNewUINLabelClick(Sender: TObject);
    procedure ICQOptionButtonGroupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure PassEditChange(Sender: TObject);

  private
    { Private declarations }
    procedure LoadSettings;

  public
    { Public declarations }
    procedure TranslateForm;
    procedure ApplySettings;
    procedure SaveSettings;
    procedure SetOnlineVars;
  end;

var
  IcqOptionsForm: TIcqOptionsForm;

implementation

{$R *.dfm}

uses
  MainUnit,
  IcqProtoUnit,
  SettingsUnit,
  UtilsUnit,
  RosterUnit,
  OverbyteIcsMimeUtils,
  OverbyteIcsUrl;

resourcestring
  RS_IcqAccount = 'settings\icq\account';
  RS_IcqSHC = 'settings\icq\show-hide-contacts';
  RS_ClientId = 'language\Infos\ClientId';
  RS_PassChange = 'language\Infos\PassChange';
  RS_SendDump = 'language\Infos\SendDump';

procedure TIcqOptionsForm.SaveSettings;
var
  XmlFile: TrXML;
begin
  // Записываем настройки ICQ протокола в файл
  XmlFile := TrXML.Create;
  try
    with XmlFile do
      begin
        if FileExists(ProfilePath + SettingsFileName) then
          LoadFromFile(ProfilePath + SettingsFileName);
        // --------------------------------------------------------------------------
        if OpenKey(RS_IcqAccount, True) then
          try
            WriteString(RS_Login, ICQUINEdit.Text);
            WriteBool(RS_SavePass, SavePassCheckBox.Checked);
            if (SavePassCheckBox.Checked) and (PassEdit.Text <> RS_MaskPass) then
              WriteString(RS_Pass, Base64Encode(URLEncode(ICQ_LoginPassword)))
            else
              WriteString(RS_Pass, EmptyStr);
            // Маскируем пароль
            if PassEdit.Text <> EmptyStr then
              PassEdit.Text := RS_MaskPass;
          finally
            CloseKey;
          end;
        // --------------------------------------------------------------------------
        if OpenKey(RS_IcqSHC, True) then
          try
            WriteBool(S_Value, ShowHideContactsCheckBox.Checked);
          finally
            CloseKey;
          end;
        // --------------------------------------------------------------------------
        SaveToFile(ProfilePath + SettingsFileName);
      end;
  finally
    FreeAndNil(XmlFile);
  end;
end;

procedure TIcqOptionsForm.ApplySettings;
begin
  // --------------------------------------------------------------------------
  // Нормализуем ICQ логин
  ICQUINEdit.Text := Trim(ICQUINEdit.Text);
  ICQUINEdit.Text := ExNormalizeIcqNumber(ICQUINEdit.Text);
  ICQUINEdit.Text := ExNormalizeScreenName(ICQUINEdit.Text);
  // Обновляем данные логина в протоколе
  if ICQUINEdit.Enabled then
    begin
      if ICQUINEdit.Text <> ICQ_LoginUIN then
        begin
          if Assigned(RosterForm) then
            RosterForm.ClearICQClick(Self); // Очищаем контакты предыдущего UIN
          ICQ_LoginUIN := ICQUINEdit.Text;
        end;
      ICQ_LoginPassword := PassEdit.Hint;
    end;
  // --------------------------------------------------------------------------
  // Отображение временных контактов в КЛ
  ICQ_Show_HideContacts := ShowHideContactsCheckBox.Checked;
  // Запускаем обработку Ростера
  if Assigned(RosterForm) then
    RosterForm.UpdateFullCL;
  // --------------------------------------------------------------------------
  // Деактивируем кнопку применения настроек
  ApplyButton.Enabled := False;
end;

procedure TIcqOptionsForm.RegNewUINLabelClick(Sender: TObject);
begin
  // Открываем регистрацию на веб сайте ICQ
  OpenURL(RS_IcqReg);
end;

procedure TIcqOptionsForm.LoadSettings;
var
  XmlFile: TrXML;
begin
  // Инициализируем XML
  XmlFile := TrXML.Create;
  try
    with XmlFile do
      begin
        if FileExists(ProfilePath + SettingsFileName) then
          begin
            LoadFromFile(ProfilePath + SettingsFileName);
            // --------------------------------------------------------------------------
            // Загружаем данные логина
            if OpenKey(RS_IcqAccount) then
              try
                ICQUINEdit.Text := ReadString(RS_Login);
                SavePassCheckBox.Checked := ReadBool(RS_SavePass);
                // Загружаем пароль
                PassEdit.OnChange := nil;
                PassEdit.Text := ReadString(RS_Pass);
                if PassEdit.Text <> EmptyStr then
                  begin
                    PassEdit.Hint := URLDecode(Base64Decode(PassEdit.Text));
                    PassEdit.Text := RS_MaskPass;
                  end;
                PassEdit.OnChange := PassEditChange;
              finally
                CloseKey;
              end;
            // --------------------------------------------------------------------------
            // Загружаем остальные настройки
            if OpenKey(RS_IcqSHC) then
              try
                ShowHideContactsCheckBox.Checked := ReadBool(S_Value);
              finally
                CloseKey;
              end;
            // --------------------------------------------------------------------------
          end;
      end;
  finally
    FreeAndNil(XmlFile);
  end;
end;

procedure TIcqOptionsForm.ReqPassLabelClick(Sender: TObject);
begin
  // Открываем сайт ICQ для восстановления пароля
  OpenURL('http://www.icq.com/password');
end;

procedure TIcqOptionsForm.ReqPassLabelMouseEnter(Sender: TObject);
begin (Sender as TLabel)
  .Font.Color := ClBlue;
end;

procedure TIcqOptionsForm.ReqPassLabelMouseLeave(Sender: TObject);
begin (Sender as TLabel)
  .Font.Color := ClNavy;
end;

procedure TIcqOptionsForm.TranslateForm;
var
  XmlFile: TrXML;
begin
  // Создаём шаблон для перевода
  // CreateLang(Self);
  // Применяем язык
  SetLang(Self);
  // Инициализируем XML
  XmlFile := TrXML.Create;
  try
    with XmlFile do
      begin
        // Загружаем настройки
        if FileExists(MyPath + Format(LangPath, [CurrentLang])) then
          begin
            // Загружаем файл языка
            LoadFromFile(MyPath + Format(LangPath, [CurrentLang]));
            // Загружаем инфы
            if OpenKey(RS_ClientId) then
              try
                ClientIdInfoRichEdit.Lines.Append(CheckText_RN(ReadString('c')));
              finally
                CloseKey;
              end;
            if OpenKey(RS_PassChange) then
              try
                PassChangeInfoRichEdit.Lines.Append(CheckText_RN(ReadString('c')));
              finally
                CloseKey;
              end;
            if OpenKey(RS_SendDump) then
              try
                DumpInfoRichEdit.Lines.Append(CheckText_RN(ReadString('c')));
              finally
                CloseKey;
              end;
          end;
      end;
  finally
    FreeAndNil(XmlFile);
  end;

  { // Присваиваем список стран другим комбобоксам отображающим такой же список
    OCountryInfoComboBox.Items.Assign(CountryInfoComboBox.Items);
    WorkCountryInfoComboBox.Items.Assign(CountryInfoComboBox.Items);
    // Присваиваем список интересов другим комбобоксам отображающим такой же список
    Interest2InfoComboBox.Items.Assign(Interest1InfoComboBox.Items);
    Interest3InfoComboBox.Items.Assign(Interest1InfoComboBox.Items);
    Interest4InfoComboBox.Items.Assign(Interest1InfoComboBox.Items);
    // Присваиваем список языков другим комбобоксам отображающим такой же список
    Lang2InfoComboBox.Items.Assign(Lang1InfoComboBox.Items);
    Lang3InfoComboBox.Items.Assign(Lang1InfoComboBox.Items); }
end;

procedure TIcqOptionsForm.OKButtonClick(Sender: TObject);
begin
  // Если были изменения, то применяем настройки и закрываем окно
  if ApplyButton.Enabled then
    ApplyButtonClick(Self);
  // Закрываем окно
  Close;
end;

procedure TIcqOptionsForm.PassEditChange(Sender: TObject);
begin
  PassEdit.Hint := PassEdit.Text;
  // Активируем кнопку применения настроек
  ApplyButton.Enabled := True;
end;

procedure TIcqOptionsForm.PassEditClick(Sender: TObject);
begin
  // Если уже заменитель пароля, то очищаем поле ввода пароля
  if PassEdit.Text = RS_MaskPass then
    PassEdit.Text := EmptyStr;
end;

procedure TIcqOptionsForm.CancelButtonClick(Sender: TObject);
begin
  // Закрываем окно
  Close;
end;

procedure TIcqOptionsForm.ApplyButtonClick(Sender: TObject);
begin
  // Применяем настройки
  ApplySettings;
  // Сохраняем настройки
  SaveSettings;
end;

procedure TIcqOptionsForm.ChangePassButtonClick(Sender: TObject);
begin
  if ICQ_Work_Phaze then
    begin
      if (CurrentPassChangeEdit.Text = EmptyStr) or (CurrentPassChangeEdit.Text <> ICQ_LoginPassword) or
        (NewPassChangeEdit.Text = EmptyStr) or (Length(NewPassChangeEdit.Text) < 6) or (RetypeNewPassEdit.Text = EmptyStr) or
        (RetypeNewPassEdit.Text <> NewPassChangeEdit.Text) then
        DAShow(S_AlertHead, PassChangeAlert_1, EmptyStr, 134, 2, 0)
      else
        begin
          ICQ_PassChange(RetypeNewPassEdit.Text);
          ICQ_ChangePassword := RetypeNewPassEdit.Text;
        end;
    end
  else
    DAShow(S_AlertHead, OnlineAlert, EmptyStr, 134, 2, 0);
end;

procedure TIcqOptionsForm.SendCustomICQPacketButtonClick(Sender: TObject);
var
  Pkt: string;
begin
  // Копируем текст пакета из рича (используем ричедит против глюка с отрисовкой мемо в виндовс 7)
  Pkt := Trim(SendCustomICQPacketRichEdit.Text);
  // Если пакет больше нуля и рабочая фаза icq подключения
  if NotProtoOnline(S_Icq) then
    Exit;
  if Pkt <> EmptyStr then
    begin
      // Удаляем все переносы строк из пакета
      Pkt := DeleteLineBreaks(Pkt);
      // Удаляем все пробелы из пакета
      Pkt := DeleteSpaces(Pkt);
      // Если пакет с заголовком, то удаляем из пакета заголовок
      if (Length(Pkt) > 2) and (UpperCase(Pkt[1] + Pkt[2]) = '2A') then
        begin
          NextData(Pkt, 12);
          // Отправляем пакет по второму каналу
          SendFLAP('2', Pkt);
        end
      else
        SendFLAP('2', Pkt);
      // Запускаем таймер повтора отправки если установлено
      if SendCustomICQPaketTimerCheckBox.Checked then
        begin
          // Применяем время таймера
          SendCustomICQPaketTimer.Interval := StrToInt(SendCustomICQPaketTimerEdit.Text) * 1000;
          // Пересбрасываем и перезапускаем таймер
          SendCustomICQPaketTimer.Enabled := False;
          SendCustomICQPaketTimer.Enabled := True;
        end;
    end;
  // Сохраняем пакет локально для дальнейшего использования
  SendCustomICQPacketRichEdit.Lines.SaveToFile(ProfilePath + 'Icq Packet.txt');
end;

procedure TIcqOptionsForm.SendCustomICQPaketTimerEditExit(Sender: TObject);
begin
  // Если ввод пустой, то ставим по дефолту
  if SendCustomICQPaketTimerEdit.Text = EmptyStr then
    SendCustomICQPaketTimerEdit.Text := '10';
end;

procedure TIcqOptionsForm.SendCustomICQPaketTimerEditKeyPress(Sender: TObject; var Key: Char);
const
  ValidAsciiChars = ['0' .. '9'];
begin
  // Делаем так, что вводить можно только цифры
  if (not CharInSet(Key, ValidAsciiChars)) and (Key <> #8) then
    Key := #0;
end;

procedure TIcqOptionsForm.SendCustomICQPaketTimerTimer(Sender: TObject);
begin
  // Применяем время таймера
  SendCustomICQPaketTimer.Interval := StrToInt(SendCustomICQPaketTimerEdit.Text) * 1000;
  // Нажимаем на кнопку отправки
  if SendCustomICQPaketTimerCheckBox.Checked then
    SendCustomICQPacketButtonClick(Self)
  else
    SendCustomICQPaketTimer.Enabled := False;
end;

procedure TIcqOptionsForm.ICQOptionButtonGroupButtonClicked(Sender: TObject; index: Integer);
begin
  // Выбираем страницу настроек соответсвенно выбранной вкладке
  if index <= OptionJvPageList.PageCount then
    OptionJvPageList.ActivePageIndex := index;
end;

procedure TIcqOptionsForm.ICQOptionButtonGroupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Выбираем страницу настроек соответсвенно выбранной вкладке
  if ICQOptionButtonGroup.ItemIndex <= OptionJvPageList.PageCount then
    OptionJvPageList.ActivePageIndex := ICQOptionButtonGroup.ItemIndex;
end;

procedure TIcqOptionsForm.ShowPassCheckBoxClick(Sender: TObject);
begin
  // Отменяем событие изменения поля пароля
  PassEdit.OnChange := nil;
  // Показываем пароль в поле ввода пароля
  if ShowPassCheckBox.Checked then
    PassEdit.PasswordChar := #0
  else
    PassEdit.PasswordChar := '*';
  // Восстанавливаем событие изменения поля пароля
  PassEdit.OnChange := ICQUINEditChange;
end;

procedure TIcqOptionsForm.ShowPassChangeCheckBoxClick(Sender: TObject);
begin
  if ShowPassChangeCheckBox.Checked then
    begin
      CurrentPassChangeEdit.PasswordChar := #0;
      NewPassChangeEdit.PasswordChar := #0;
      RetypeNewPassEdit.PasswordChar := #0;
    end
  else
    begin
      CurrentPassChangeEdit.PasswordChar := '*';
      NewPassChangeEdit.PasswordChar := '*';
      RetypeNewPassEdit.PasswordChar := '*';
    end;
end;

procedure TIcqOptionsForm.ICQUINEditChange(Sender: TObject);
begin
  // Активируем кнопку применения настроек
  ApplyButton.Enabled := True;
end;

procedure TIcqOptionsForm.FormCreate(Sender: TObject);
begin
  // Переводим форму на другие языки
  TranslateForm;
  // Загружаем настройки
  LoadSettings;
  ApplySettings;
  // Выставляем иконки формы и кнопок
  MainForm.AllImageList.GetIcon(81, Icon);
  MainForm.AllImageList.GetBitmap(3, CancelButton.Glyph);
  MainForm.AllImageList.GetBitmap(6, ApplyButton.Glyph);
  MainForm.AllImageList.GetBitmap(140, OKButton.Glyph);
  // Помещаем кнопку формы в таскбар и делаем независимой
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TIcqOptionsForm.FormShow(Sender: TObject);
begin
  // Прокручиваем на первую вкладку
  OptionJvPageList.ActivePage := AccountPage;
  IcqOptionButtonGroup.ItemIndex := 0;
  // Прокручиваем рич в верх против глюка в вайн
  SendMessage(ClientIdInfoRichEdit.Handle, EM_SCROLL, SB_TOP, 0);
  SendMessage(PassChangeInfoRichEdit.Handle, EM_SCROLL, SB_TOP, 0);
  SendMessage(DumpInfoRichEdit.Handle, EM_SCROLL, SB_TOP, 0);
end;

procedure TIcqOptionsForm.SetOnlineVars;
begin
  // Загружаем онлайн переменные
  ConnectTimeInfoEdit.Text := MyConnTime;
  RegDateInfoEdit.Text := ICQ_MyUIN_RegTime;
  ExternalIPInfoEdit.Text := ICQ_Online_IP;
  SendMessInfoEdit.Text := ICQ_SendMess;
  InMessInfoEdit.Text := ICQ_RecMess;
  LastTimeInfoEdit.Text := ICQ_LastActive;
  // Заполняем мемо дополнительной информацией о ICQ аккаунте
  ParamInfoRichEdit.Clear;
  // Начинаем заполнение строк
  ParamInfoRichEdit.Lines.BeginUpdate;
  // Добавляем информацию не вошедшую в другие разделы
  if ICQ_CollSince <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(OnlineInfo1L + ': ' + ICQ_CollSince);
  if ICQ_OnlineTime <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(OnlineInfo2L + ': ' + ICQ_OnlineTime);
  if ICQ_AwayMess <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(OnlineInfo3L + ': ' + ICQ_AwayMess);
  if ICQ_Bos_Addr <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(OnlineInfo5L + ': ' + ICQ_Bos_Addr);
  if ICQ_MyIcon_Hash <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(OnlineInfo6L + ': ' + ICQ_MyIcon_Hash);
  if ICQ_CL_Count > 0 then
    ParamInfoRichEdit.Lines.Add(OnlineInfo7L + ': ' + IntToStr(ICQ_CL_Count));
  if ICQ_Connect_Count <> EmptyStr then
    ParamInfoRichEdit.Lines.Add(Log_Connect_Count + ICQ_Connect_Count);
  // Заканчиваем заполнение строк
  ParamInfoRichEdit.Lines.EndUpdate;
end;

end.