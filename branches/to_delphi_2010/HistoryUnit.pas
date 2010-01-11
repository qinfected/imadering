﻿{ *******************************************************************************
  Copyright (c) 2004-2009 by Edyard Tolmachev
  IMadering project
  http://imadering.com
  ICQ: 118648
  E-mail: imadering@mail.ru
  ******************************************************************************* }

unit HistoryUnit;

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
  Htmlview,
  ExtCtrls,
  Buttons,
  Menus,
  ExtDlgs;

type
  THistoryForm = class(TForm)
    TopPanel: TPanel;
    BottomPanel: TPanel;
    HTMLHistoryViewer: THTMLViewer;
    ContactsComboBox: TComboBox;
    ArhiveComboBox: TComboBox;
    Bevel1: TBevel;
    ContactsLabel: TLabel;
    ArhiveLabel: TLabel;
    SearchTextLabel: TLabel;
    SearchTextEdit: TEdit;
    SearchTextBitBtn: TBitBtn;
    RegistrCheckBox: TCheckBox;
    FullSearchTextCheckBox: TCheckBox;
    ReloadHistoryBitBtn: TBitBtn;
    SaveHistoryAsBitBtn: TBitBtn;
    DeleteHistoryBitBtn: TBitBtn;
    HistoryPopupMenu: TPopupMenu;
    CopyHistorySelText: TMenuItem;
    CopyAllHistoryText: TMenuItem;
    SaveTextAsFileDialog: TSaveTextFileDialog;
    UpSearchCheckBox: TRadioButton;
    DownSearchCheckBox: TRadioButton;
    CloseBitBtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HistoryPopupMenuPopup(Sender: TObject);
    procedure HTMLHistoryViewerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchTextBitBtnClick(Sender: TObject);
    procedure ReloadHistoryBitBtnClick(Sender: TObject);
    procedure SaveHistoryAsBitBtnClick(Sender: TObject);
    procedure DeleteHistoryBitBtnClick(Sender: TObject);
    procedure ContactsComboBoxChange(Sender: TObject);
    procedure CopyHistorySelTextClick(Sender: TObject);
    procedure CopyAllHistoryTextClick(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);

  private
    { Private declarations }
    HTMLStyle: string;
    MyHUIN: string;
    HistoryFile: string;

  public
    { Public declarations }
    ReqHUIN: string;
    ReqCType: string;
    procedure TranslateForm;
    procedure LoadHistoryFromFile;
  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.dfm}

uses
  MainUnit,
  ChatUnit,
  UtilsUnit,
  VarsUnit,
  RXML,
  IcqProtoUnit,
  MraProtoUnit,
  JabberProtoUnit;

resourcestring
  RS_HistoryFormPos = 'settings\forms\historyform\position';

procedure THistoryForm.LoadHistoryFromFile;
var
  Doc, H: string;
begin
  ContactsComboBox.OnChange := nil;
  // Вычисляем нашу текущую учётную запись
  if ReqCType = S_Icq then
    MyHUIN := ICQ_LoginUIN
  else if ReqCType = S_Mra then
    MyHUIN := Mra_LoginUIN
  else if ReqCType = S_Jabber then
    MyHUIN := Jabber_LoginUIN;
  // --Очистили компонент истории и выводим надпись, что история загружается
  Doc := HTMLStyle;
  Doc := Doc + '<span class=b>' + HistoryLoadFileL + '</span>';
  HTMLHistoryViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
  HTMLHistoryViewer.Refresh;
  // Загружаем файл истории сообщений
  HistoryFile := ProfilePath + HistoryFileName + ReqCType + BN + MyHUIN + BN + ReqHUIN + '.htm';
  if FileExists(HistoryFile) then
    begin
      // Находим этот контакт в списке файлов историй
      H := GetFileFName(HistoryFile);
      H := Copy(H, 1, Length(H) - 4);
      ContactsComboBox.ItemIndex := ContactsComboBox.Items.IndexOf(H);
      // Ичищаем компонент просмотра истории
      HTMLHistoryViewer.Clear;
      // Добавляем стили
      Doc := HTMLStyle;
      // Загружаем весь текст истории
      Doc := Doc + ReadFromFile(HistoryFile);
      // Применяем смайлы
      if not TextSmilies then
        CheckMessage_Smilies(Doc);
      // Отображаем историю в компоненте
      SetLength(Doc, Length(Doc) - 6);
      Doc := Doc + '<HR>';
      HTMLHistoryViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
      // Ставим каретку в самый низ текста
      HTMLHistoryViewer.VScrollBarPosition := HTMLHistoryViewer.VScrollBar.Max;
      HTMLHistoryViewer.CaretPos := Length(Doc);
    end
  else
    begin
      ContactsComboBox.ItemIndex := -1;
      // Очистили компонент истории и выводим сообщение, что история не найдена
      HTMLHistoryViewer.Clear;
      Doc := HTMLStyle;
      Doc := Doc + '<span class=d>' + HistoryNotFileL + '</span>';
      HTMLHistoryViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
    end;
  // Ищем архивы истории с этим контактом
  ArhiveComboBox.Clear;
  if ContactsComboBox.Text <> EmptyStr then
    ListFileInDir(ProfilePath + HistoryFileName + ContactsComboBox.Text + '*.7z', '.7z', ArhiveComboBox.Items);
  ContactsComboBox.OnChange := ContactsComboBoxChange;
end;

procedure THistoryForm.CopyHistorySelTextClick(Sender: TObject);
begin
  // Копируем выделенный текст в буфер обмена
  HTMLHistoryViewer.CopyToClipboard;
end;

procedure THistoryForm.CopyAllHistoryTextClick(Sender: TObject);
begin
  // Копируем весь текст в буфер обмена
  HTMLHistoryViewer.SelectAll;
  HTMLHistoryViewer.CopyToClipboard;
end;

procedure THistoryForm.HistoryPopupMenuPopup(Sender: TObject);
begin
  // Определяем есть ли выделенный текст
  if HTMLHistoryViewer.SelLength = 0 then
    CopyHistorySelText.Enabled := False
  else
    CopyHistorySelText.Enabled := True;
end;

procedure THistoryForm.TranslateForm;
begin
  // Создаём шаблон для перевода
  //CreateLang(Self);
  // Применяем язык
  SetLang(Self);
  // Другое
  CloseBitBtn.Caption := S_Close;
end;

procedure THistoryForm.SearchTextBitBtnClick(Sender: TObject);
begin
  // Снимаем предыдущее выделение текста
  HTMLHistoryViewer.SelLength := 0;
  // Делаем поиск текста в истории
  if not HTMLHistoryViewer.FindEx(SearchTextEdit.Text, RegistrCheckBox.Checked, UpSearchCheckBox.Checked) then
    Showmessage(HistorySearchNoL);
end;

procedure THistoryForm.ReloadHistoryBitBtnClick(Sender: TObject);
begin
  // Если путь к файлу пустой, то выходим
  if ContactsComboBox.Text = EmptyStr then
    Exit;
  // Перезагружаем файл истории
  ContactsComboBoxChange(nil);
end;

procedure THistoryForm.SaveHistoryAsBitBtnClick(Sender: TObject);
var
  List: TStringList;
begin
  // Если путь к файлу пустой, то выходим
  if ContactsComboBox.Text = EmptyStr then
    Exit;
  // Указываем начальное имя файла
  SaveTextAsFileDialog.FileName := 'History ' + ContactsComboBox.Text;
  // Открываем диалог сохранения файла
  if SaveTextAsFileDialog.Execute then
    begin
      // Создаём лист строк
      List := TStringList.Create;
      try
        // Выделяем весь текст в истории
        HTMLHistoryViewer.SelectAll;
        // Копируем выделенный текст в лист
        List.Text := HTMLHistoryViewer.SelText;
        // Сбрасываем выделение текста
        HTMLHistoryViewer.SelLength := 0;
        // Сохраняем текст из листа в файл из диалога
        List.SaveToFile(SaveTextAsFileDialog.FileName, TEncoding.Unicode);
      finally
        List.Free;
      end;
    end;
end;

procedure THistoryForm.DeleteHistoryBitBtnClick(Sender: TObject);
var
  I: Integer;
begin
  // Если путь к файлу пустой, то выходим
  if ContactsComboBox.Text = EmptyStr then
    Exit;
  // Выводим запрос на удаление файла истории
  I := MessageBox(Handle, PChar(HistoryDelL), PChar(S_WarningHead), MB_TOPMOST or MB_YESNO or MB_ICONQUESTION);
  // Если ответ положительный
  if I = IDYES then
    begin
      // Удаляем файл
      if FileExists(HistoryFile) then
        DeleteFile(HistoryFile);
      // Очищаем компонент истории
      HTMLHistoryViewer.Clear;
      // Удаляем эту запись из списка файлов истори
      ContactsComboBox.Items.Delete(ContactsComboBox.ItemIndex);
    end;
end;

procedure THistoryForm.CloseBitBtnClick(Sender: TObject);
begin
  // Закрываем окно с историей
  Close;
end;

procedure THistoryForm.ContactsComboBoxChange(Sender: TObject);
var
  Doc: string;
begin
  // Загружаем файл с историей выбранного контакта
  // --Очистили компонент истории и выводим надпись, что история загружается
  Doc := HTMLStyle;
  Doc := Doc + '<span class=b>' + HistoryLoadFileL + '</span>';
  HTMLHistoryViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
  HTMLHistoryViewer.Refresh;
  // Загружаем файл истории сообщений
  HistoryFile := ProfilePath + HistoryFileName + ContactsComboBox.Text + '.htm';
  if FileExists(HistoryFile) then
    begin
      // Ичищаем компонент просмотра истории
      HTMLHistoryViewer.Clear;
      // Добавляем стили
      Doc := HTMLStyle;
      // Загружаем весь текст истории
      Doc := Doc + ReadFromFile(HistoryFile);
      // Применяем смайлы
      if not TextSmilies then
        CheckMessage_Smilies(Doc);
      // Отображаем историю в компоненте
      SetLength(Doc, Length(Doc) - 6);
      Doc := Doc + '<HR>';
      HTMLHistoryViewer.LoadFromBuffer(PChar(Doc), Length(Doc), EmptyStr);
      // Ставим каретку в самый низ текста
      HTMLHistoryViewer.VScrollBarPosition := HTMLHistoryViewer.VScrollBar.Max;
      HTMLHistoryViewer.CaretPos := Length(Doc);
    end;
  // Ищем архивы истории с этим контактом
  ArhiveComboBox.Clear;
  ListFileInDir(ProfilePath + HistoryFileName + ContactsComboBox.Text + '*.7z', '.7z', ArhiveComboBox.Items);
  // Ставим фокус в поле поиска текста
  if SearchTextEdit.CanFocus then
    SearchTextEdit.SetFocus;
end;

procedure THistoryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Указываем, что окно после закрытия уничтожится
  Action := CaFree;
  HistoryForm := nil;
end;

procedure THistoryForm.FormCreate(Sender: TObject);
var
  XmlFile: TrXML;
begin
  // Инициализируем XML
  XmlFile := TrXML.Create;
  try
    with XmlFile do
      begin
        // Загружаем настройки
        if FileExists(ProfilePath + SettingsFileName) then
          begin
            LoadFromFile(ProfilePath + SettingsFileName);
            // Загружаем позицию окна
            if OpenKey(RS_HistoryFormPos) then
              try
                Top := ReadInteger('top');
                Left := ReadInteger('left');
                Height := ReadInteger('height');
                Width := ReadInteger('width');
                // Определяем не находится ли окно за пределами экрана
                MainForm.FormSetInWorkArea(Self); ;
              finally
                CloseKey;
              end;
          end;
      end;
  finally
    FreeAndNil(XmlFile);
  end;
  // Переводим окно на другие языки
  TranslateForm;
  // Формируем строку стиля
  HTMLStyle := '<html><head>' + ChatCSS + '<title>Chat</title></head><body>';
  // Назначаем иконки окну и кнопкам
  MainForm.AllImageList.GetIcon(147, Icon);
  MainForm.AllImageList.GetBitmap(221, SearchTextBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(6, ReloadHistoryBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(150, SaveHistoryAsBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(148, DeleteHistoryBitBtn.Glyph);
  MainForm.AllImageList.GetBitmap(3, CloseBitBtn.Glyph);
  // Создаём список имеющихся файлов истории для выбора
  ListFileInDir(ProfilePath + HistoryFileName + '*.htm', '.htm', ContactsComboBox.Items);
  // Делаем окно независимым и ставим его кнопку в панель задач
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
  // Назначаем событие выбора файла истории
  ContactsComboBox.OnChange := ContactsComboBoxChange;
end;

procedure THistoryForm.FormDestroy(Sender: TObject);
var
  XmlFile: TrXML;
begin
  // Создаём необходимые папки
  ForceDirectories(ProfilePath);
  // Сохраняем настройки положения окна истории в xml
  XmlFile := TrXML.Create;
  try
    with XmlFile do
      begin
        if FileExists(ProfilePath + SettingsFileName) then
          LoadFromFile(ProfilePath + SettingsFileName);
        // Сохраняем позицию окна
        if OpenKey(RS_HistoryFormPos, True) then
          try
            WriteInteger('top', Top);
            WriteInteger('left', Left);
            WriteInteger('height', Height);
            WriteInteger('width', Width);
          finally
            CloseKey;
          end;
        // Записываем сам файл
        SaveToFile(ProfilePath + SettingsFileName);
      end;
  finally
    FreeAndNil(XmlFile);
  end;
end;

procedure THistoryForm.HTMLHistoryViewerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // При нажатии клавиш контрл + с копируем выделенный текст в буфер обмена
  if (GetKeyState(VK_CONTROL) < 0) and (Key = 67) then
    begin
      HTMLHistoryViewer.CopyToClipboard;
    end;
end;

end.