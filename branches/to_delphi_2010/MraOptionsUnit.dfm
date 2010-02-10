object MraOptionsForm: TMraOptionsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '#'#1054#1087#1094#1080#1080': Mail.ru Agent'
  ClientHeight = 413
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  HelpFile = 'T'
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TBitBtn
    Left = 8
    Top = 380
    Width = 137
    Height = 25
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    TabStop = False
    OnClick = CancelButtonClick
  end
  object ApplyButton: TBitBtn
    Left = 369
    Top = 380
    Width = 107
    Height = 25
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 2
    TabStop = False
    OnClick = ApplyButtonClick
  end
  object OKButton: TBitBtn
    Left = 482
    Top = 380
    Width = 107
    Height = 25
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    TabStop = False
    OnClick = OKButtonClick
  end
  object MRAOptionButtonGroup: TButtonGroup
    Left = 8
    Top = 8
    Width = 137
    Height = 366
    BevelKind = bkTile
    BorderStyle = bsNone
    ButtonHeight = 27
    ButtonOptions = [gboFullSize, gboGroupStyle, gboShowCaptions]
    Images = MainForm.AllImageList
    Items = <
      item
        Caption = '#'#1059#1095#1105#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
        ImageIndex = 66
      end
      item
        Caption = '#'#1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
        ImageIndex = 162
      end
      item
        Caption = '#'#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 171
      end
      item
        Caption = '#ID '#1082#1083#1080#1077#1085#1090#1072
        ImageIndex = 172
      end
      item
        Caption = '#MRA '#1082#1086#1085#1089#1086#1083#1100
        ImageIndex = 171
      end>
    ItemIndex = 0
    TabOrder = 0
    OnButtonClicked = MRAOptionButtonGroupButtonClicked
    OnKeyDown = MRAOptionButtonGroupKeyDown
  end
  object OptionPanel: TPanel
    Left = 151
    Top = 8
    Width = 438
    Height = 366
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 4
    object OptionJvPageList: TJvPageList
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 428
      Height = 356
      ActivePage = AccountPage
      PropagateEnable = False
      ShowDesignCaption = sdcNone
      Align = alClient
      object AccountPage: TJvStandardPage
        Left = 0
        Top = 0
        Width = 428
        Height = 356
        Caption = 'AccountPage'
        object AccountGroupBox: TGroupBox
          Left = 0
          Top = 0
          Width = 428
          Height = 236
          Caption = '#'#1059#1095#1105#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object ReqPassLabel: TLabel
            Left = 65
            Top = 179
            Width = 104
            Height = 13
            Cursor = crHandPoint
            Caption = '#'#1047#1072#1073#1099#1083#1080' '#1087#1072#1088#1086#1083#1100'?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = ReqPassLabelClick
            OnMouseEnter = MRAonserverLabelMouseEnter
            OnMouseLeave = MRAonserverLabelMouseLeave
          end
          object MRAEmailLabel: TLabel
            Left = 65
            Top = 26
            Width = 42
            Height = 13
            Caption = '#Email:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PassLabel: TLabel
            Left = 65
            Top = 79
            Width = 55
            Height = 13
            Caption = '#'#1055#1072#1088#1086#1083#1100':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RegNewEmailLabel: TLabel
            Left = 65
            Top = 205
            Width = 257
            Height = 13
            Cursor = crHandPoint
            Caption = '#'#1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1091#1095#1105#1090#1085#1091#1102' '#1079#1072#1087#1080#1089#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = RegNewEmailLabelClick
            OnMouseEnter = MRAonserverLabelMouseEnter
            OnMouseLeave = MRAonserverLabelMouseLeave
          end
          object MRAEmailEdit: TEdit
            Left = 63
            Top = 45
            Width = 179
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = MRAEmailEditChange
          end
          object PassEdit: TEdit
            Left = 63
            Top = 98
            Width = 308
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 2
            OnChange = MRAEmailEditChange
          end
          object ShowPassCheckBox: TCheckBox
            Left = 63
            Top = 128
            Width = 336
            Height = 17
            TabStop = False
            Caption = '#'#1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = ShowPassCheckBoxClick
          end
          object SavePassCheckBox: TCheckBox
            Left = 63
            Top = 151
            Width = 336
            Height = 17
            TabStop = False
            Caption = '#'#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object MRAEmailComboBox: TComboBox
            Left = 248
            Top = 45
            Width = 123
            Height = 21
            Style = csDropDownList
            TabOrder = 4
            TabStop = False
            Items.Strings = (
              '@mail.ru'
              '@list.ru'
              '@inbox.ru'
              '@bk.ru'
              '@corp.mail.ru')
          end
        end
        object OptionGroupBox: TGroupBox
          Left = 0
          Top = 242
          Width = 428
          Height = 114
          Caption = '#'#1054#1087#1094#1080#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object ConnectPage: TJvStandardPage
        Left = 0
        Top = 0
        Width = 428
        Height = 356
        Caption = 'ConnectPage'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 428
          Height = 56
          Caption = '#'#1057#1077#1088#1074#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object MraLoginServerLabel: TLabel
            Left = 18
            Top = 24
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = '#'#1040#1076#1088#1077#1089':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object MraLoginServerPortLabel: TLabel
            Left = 300
            Top = 24
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = '#'#1055#1086#1088#1090':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object MraLoginServerComboBox: TComboBox
            Left = 67
            Top = 21
            Width = 205
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            TabStop = False
            Text = 'mrim.mail.ru'
            Items.Strings = (
              'mrim.mail.ru')
          end
          object MraLoginServerPortEdit: TEdit
            Left = 343
            Top = 21
            Width = 62
            Height = 21
            TabStop = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '2042'
          end
        end
      end
      object OptionsPage: TJvStandardPage
        Left = 0
        Top = 0
        Width = 428
        Height = 356
        Caption = 'OptionsPage'
      end
      object IDClientPage: TJvStandardPage
        Left = 0
        Top = 0
        Width = 428
        Height = 356
        Caption = 'IDClientPage'
      end
      object ConsolePage: TJvStandardPage
        Left = 0
        Top = 0
        Width = 428
        Height = 356
        Caption = 'ConsolePage'
      end
    end
  end
end
