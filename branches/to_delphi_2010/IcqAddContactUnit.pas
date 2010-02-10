﻿{ *******************************************************************************
  Copyright (c) 2004-2009 by Edyard Tolmachev
  IMadering project
  http://imadering.com
  ICQ: 118648
  E-mail: imadering@mail.ru
  ******************************************************************************* }

unit IcqAddContactUnit;

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
  VarsUnit,
  ComCtrls;

type
  TIcqAddContactForm = class(TForm)
    AccountEdit: TEdit;
    NameEdit: TEdit;
    GroupComboBox: TComboBox;
    CancelButton: TButton;
    AddContactButton: TButton;
    AccountLabel: TLabel;
    NameLabel: TLabel;
    GroupLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AddContactButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ContactType: string;
    procedure TranslateForm;
    procedure BuildGroupList(GProto: string);
  end;

var
  IcqAddContactForm: TIcqAddContactForm;

implementation

uses
  MainUnit,
  IcqProtoUnit,
  UtilsUnit,
  RosterUnit;

{$R *.dfm}

procedure TIcqAddContactForm.BuildGroupList(GProto: string);
var
  I: Integer;
begin
  // Составляем список групп из Ростера
  with RosterForm.RosterJvListView do
    begin
      // Список для ICQ
      if GProto = S_Icq then
        begin
          for I := 0 to Items.Count - 1 do
            begin
              if (Items[I].SubItems[3] = S_Icq) and (Length(Items[I].Caption) = 4) then
                begin
                  if Items[I].Caption = '0000' then
                    Continue; // Группа временных контактов
                  if (Items[I].Caption = S_NoCL) or (Items[I].Caption = '0001') then
                    Continue; // Группа "Не в списке"
                  GroupComboBox.Items.Add(Items[I].SubItems[1]);
                end;
            end;
        end
        // Список для Jabber
      else if GProto = S_Jabber then
        begin

        end
        // Список для Mra
      else if GProto = S_Mra then
        begin

        end;
    end;
  // Выставляем по умолчанию первую группу в списке выбора групп
  if GroupComboBox.Items.Count > 0 then
    GroupComboBox.ItemIndex := 0;
end;

procedure TIcqAddContactForm.TranslateForm;
begin
  // Создаём шаблон для перевода
  // CreateLang(Self);
  // Применяем язык
  SetLang(Self);
  // Другое
  CancelButton.Caption := S_Cancel;
end;

procedure TIcqAddContactForm.AddContactButtonClick(Sender: TObject);
label
  X,
  Y;
var
  RosterItem: TListItem;
  NewId, IGpId: string;
  I: Integer;
begin
  // Добавляем контакты по протоколу ICQ
  if ContactType = S_Icq then
    begin
      if ICQ_Work_Phaze then
        begin
          if (AccountEdit.Text <> EmptyStr) and (Length(AccountEdit.Text) > 4) then
            begin
              // Нормализуем ICQ номер
              AccountEdit.Text := ExNormalizeScreenName(AccountEdit.Text);
              AccountEdit.Text := ExNormalizeIcqNumber(AccountEdit.Text);
              if Trim(NameEdit.Text) = EmptyStr then
                NameEdit.Text := AccountEdit.Text;
              // Ищем такой контакт в Ростере
              RosterItem := RosterForm.ReqRosterItem(AccountEdit.Text);
              if RosterItem <> nil then // Если такой контакт уже добавлен в список, то сообщаем об этом
                begin
                  DAShow(S_WarningHead, AddContactErr1, EmptyStr, 133, 0, 0);
                  Exit;
                end;
              // Если фаза добавления контакта ещё активна, то ждём её окончания
              if ICQ_SSI_Phaze then
                begin
                  DAShow(S_WarningHead, AddContactErr2, EmptyStr, 134, 2, 0);
                  Exit;
                end;
              // Если группа не выбрана
              if GroupComboBox.ItemIndex = -1 then
                begin
                  DAShow(S_AlertHead, AddContactErr3, EmptyStr, 134, 2, 0);
                  goto Y;
                end;
              // Генерируем идентификатор для этого контакта
            X :;
              Randomize;
              NewId := IntToHex(Random($7FFF), 4);
              // Ищем нет ли уже такого идентификатора в списке контактов
              with RosterForm.RosterJvListView do
                begin
                  for I := 0 to Items.Count - 1 do
                    begin
                      if NewId = Items[I].SubItems[4] then
                        goto X;
                    end;
                  // Ищем идентификатор выбранной группы
                  for I := 0 to Items.Count - 1 do
                    begin
                      if (Items[I].SubItems[1] = GroupComboBox.Text) and (Items[I].SubItems[3] = S_Icq) then
                        begin
                          IGpId := Items[I].SubItems[4];
                          Break;
                        end;
                    end;
                end;
              // Открываем сессию и добавляем контакт
              ICQ_Add_Contact_Phaze := True;
              ICQ_SSI_Phaze := True;
              ICQ_AddContact(AccountEdit.Text, IGpId, NewId, NameEdit.Text, False);
            end;
        end;
    end
    // Добавляем контакты по протоколу Jabber
  else if ContactType = S_Jabber then
    begin

    end
    // Добавляем контакты по протоколу Mra
  else if ContactType = S_Mra then
    begin

    end;
  // Выходим и закрываем модальное окно
Y :;
  ModalResult := MrOk;
end;

procedure TIcqAddContactForm.FormCreate(Sender: TObject);
begin
  // Переводим форму на другие языки
  TranslateForm;
  // Присваиваем иконку окну
  MainForm.AllImageList.GetIcon(143, Icon);
  // Помещаем кнопку формы в таскбар и делаем независимой
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TIcqAddContactForm.FormDblClick(Sender: TObject);
begin
  // Устанавливаем перевод
  TranslateForm;
end;

procedure TIcqAddContactForm.FormShow(Sender: TObject);
begin
  // Ставим фокус в поле ввода учётной записи если она пустая
  if (AccountEdit.CanFocus) and (AccountEdit.Text = EmptyStr) then
    AccountEdit.SetFocus;
end;

end.
