object GTransForm: TGTransForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1087#1077#1088#1077#1074#1086#1076#1095#1080#1082
  ClientHeight = 107
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object YourLangLabel: TLabel
    Left = 9
    Top = 13
    Width = 52
    Height = 13
    Caption = #1042#1072#1096' '#1103#1079#1099#1082':'
  end
  object ToLangLabel: TLabel
    Left = 251
    Top = 13
    Width = 98
    Height = 13
    Caption = #1071#1079#1099#1082' '#1089#1086#1073#1077#1089#1077#1076#1085#1080#1082#1072':'
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 74
    Width = 98
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    TabStop = False
  end
  object OKBitBtn: TBitBtn
    Left = 373
    Top = 74
    Width = 98
    Height = 25
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    ModalResult = 1
    ParentDoubleBuffered = False
    TabOrder = 1
    TabStop = False
    OnClick = OKBitBtnClick
  end
  object YourLangComboBox: TComboBox
    Left = 8
    Top = 32
    Width = 221
    Height = 21
    ItemIndex = 34
    TabOrder = 2
    TabStop = False
    Text = #1088#1091#1089#1089#1082#1080#1081' [ru]'
    Items.Strings = (
      #1072#1083#1073#1072#1085#1089#1082#1080#1081' [sq]'
      #1072#1085#1075#1083#1080#1081#1089#1082#1080#1081' [en]'
      #1072#1088#1072#1073#1089#1082#1080#1081' [ar]'
      #1072#1092#1088#1080#1082#1072#1072#1085#1089' [af]'
      #1073#1077#1083#1086#1088#1091#1089#1089#1082#1080#1081' [be]'
      #1073#1086#1083#1075#1072#1088#1089#1082#1080#1081' [bg]'
      #1074#1072#1083#1083#1080#1081#1089#1082#1080#1081' [cy]'
      #1074#1077#1085#1075#1077#1088#1089#1082#1080#1081' [hu]'
      #1074#1100#1077#1090#1085#1072#1084#1089#1082#1080#1081' [vi]'
      #1075#1072#1083#1080#1089#1080#1081#1089#1082#1080#1081' [gl]'
      #1075#1086#1083#1083#1072#1085#1076#1089#1082#1080#1081' [nl]'
      #1075#1088#1077#1095#1077#1089#1082#1080#1081' [el]'
      #1076#1072#1090#1089#1082#1080#1081' [da]'
      #1080#1074#1088#1080#1090' [iw]'
      #1080#1076#1080#1096' [yi]'
      #1080#1085#1076#1086#1085#1077#1079#1080#1081#1089#1082#1080#1081' [id]'
      #1080#1088#1083#1072#1085#1076#1089#1082#1080#1081' [ga]'
      #1080#1089#1083#1072#1085#1076#1089#1082#1080#1081' [is]'
      #1080#1089#1087#1072#1085#1089#1082#1080#1081' [es]'
      #1080#1090#1072#1083#1100#1103#1085#1089#1082#1080#1081' [it]'
      #1082#1072#1090#1072#1083#1072#1085#1089#1082#1080#1081' [ca]'
      #1082#1080#1090#1072#1081#1089#1082#1080#1081' [zh-CN]'
      #1082#1086#1088#1077#1081#1089#1082#1080#1081' [ko]'
      #1083#1072#1090#1099#1096#1089#1082#1080#1081' [lv]'
      #1083#1080#1090#1086#1074#1089#1082#1080#1081' [lt]'
      #1084#1072#1082#1077#1076#1086#1085#1089#1082#1080#1081' [mk]'
      #1084#1072#1083#1072#1081#1089#1082#1080#1081' [ms]'
      #1084#1072#1083#1100#1090#1080#1081#1089#1082#1080#1081' [mt]'
      #1085#1077#1084#1077#1094#1082#1080#1081' [de]'
      #1085#1086#1088#1074#1077#1078#1089#1082#1080#1081' [no]'
      #1087#1077#1088#1089#1080#1076#1089#1082#1080#1081' [fa]'
      #1087#1086#1083#1100#1089#1082#1080#1081' [pl]'
      #1087#1086#1088#1090#1091#1075#1072#1083#1100#1089#1082#1080#1081' [pt]'
      #1088#1091#1084#1099#1085#1089#1082#1080#1081' [ro]'
      #1088#1091#1089#1089#1082#1080#1081' [ru]'
      #1089#1077#1088#1073#1089#1082#1080#1081' [sr]'
      #1089#1083#1086#1074#1072#1094#1082#1080#1081' [sk]'
      #1089#1083#1086#1074#1077#1085#1089#1082#1080#1081' [sl]'
      #1089#1091#1072#1093#1080#1083#1080' [sw]'
      #1090#1072#1075#1072#1083#1100#1089#1082#1080#1081' [tl]'
      #1090#1072#1081#1089#1082#1080#1081' [th]'
      #1090#1091#1088#1077#1094#1082#1080#1081' [tr]'
      #1091#1082#1088#1072#1080#1085#1089#1082#1080#1081' [uk]'
      #1092#1080#1085#1089#1082#1080#1081' [fi]'
      #1092#1088#1072#1085#1094#1091#1079#1089#1082#1080#1081' [fr]'
      #1093#1080#1085#1076#1080' [hi]'
      #1093#1086#1088#1074#1072#1090#1089#1082#1080#1081' [hr]'
      #1095#1077#1096#1089#1082#1080#1081' [cs]'
      #1096#1074#1077#1076#1089#1082#1080#1081' [sv]'
      #1101#1089#1090#1086#1085#1089#1082#1080#1081' [et]'
      #1103#1087#1086#1085#1089#1082#1080#1081' [ja]')
  end
  object ToLangComboBox: TComboBox
    Left = 250
    Top = 32
    Width = 221
    Height = 21
    ItemIndex = 1
    TabOrder = 3
    TabStop = False
    Text = #1072#1085#1075#1083#1080#1081#1089#1082#1080#1081' [en]'
    Items.Strings = (
      #1072#1083#1073#1072#1085#1089#1082#1080#1081' [sq]'
      #1072#1085#1075#1083#1080#1081#1089#1082#1080#1081' [en]'
      #1072#1088#1072#1073#1089#1082#1080#1081' [ar]'
      #1072#1092#1088#1080#1082#1072#1072#1085#1089' [af]'
      #1073#1077#1083#1086#1088#1091#1089#1089#1082#1080#1081' [be]'
      #1073#1086#1083#1075#1072#1088#1089#1082#1080#1081' [bg]'
      #1074#1072#1083#1083#1080#1081#1089#1082#1080#1081' [cy]'
      #1074#1077#1085#1075#1077#1088#1089#1082#1080#1081' [hu]'
      #1074#1100#1077#1090#1085#1072#1084#1089#1082#1080#1081' [vi]'
      #1075#1072#1083#1080#1089#1080#1081#1089#1082#1080#1081' [gl]'
      #1075#1086#1083#1083#1072#1085#1076#1089#1082#1080#1081' [nl]'
      #1075#1088#1077#1095#1077#1089#1082#1080#1081' [el]'
      #1076#1072#1090#1089#1082#1080#1081' [da]'
      #1080#1074#1088#1080#1090' [iw]'
      #1080#1076#1080#1096' [yi]'
      #1080#1085#1076#1086#1085#1077#1079#1080#1081#1089#1082#1080#1081' [id]'
      #1080#1088#1083#1072#1085#1076#1089#1082#1080#1081' [ga]'
      #1080#1089#1083#1072#1085#1076#1089#1082#1080#1081' [is]'
      #1080#1089#1087#1072#1085#1089#1082#1080#1081' [es]'
      #1080#1090#1072#1083#1100#1103#1085#1089#1082#1080#1081' [it]'
      #1082#1072#1090#1072#1083#1072#1085#1089#1082#1080#1081' [ca]'
      #1082#1080#1090#1072#1081#1089#1082#1080#1081' [zh-CN]'
      #1082#1086#1088#1077#1081#1089#1082#1080#1081' [ko]'
      #1083#1072#1090#1099#1096#1089#1082#1080#1081' [lv]'
      #1083#1080#1090#1086#1074#1089#1082#1080#1081' [lt]'
      #1084#1072#1082#1077#1076#1086#1085#1089#1082#1080#1081' [mk]'
      #1084#1072#1083#1072#1081#1089#1082#1080#1081' [ms]'
      #1084#1072#1083#1100#1090#1080#1081#1089#1082#1080#1081' [mt]'
      #1085#1077#1084#1077#1094#1082#1080#1081' [de]'
      #1085#1086#1088#1074#1077#1078#1089#1082#1080#1081' [no]'
      #1087#1077#1088#1089#1080#1076#1089#1082#1080#1081' [fa]'
      #1087#1086#1083#1100#1089#1082#1080#1081' [pl]'
      #1087#1086#1088#1090#1091#1075#1072#1083#1100#1089#1082#1080#1081' [pt]'
      #1088#1091#1084#1099#1085#1089#1082#1080#1081' [ro]'
      #1088#1091#1089#1089#1082#1080#1081' [ru]'
      #1089#1077#1088#1073#1089#1082#1080#1081' [sr]'
      #1089#1083#1086#1074#1072#1094#1082#1080#1081' [sk]'
      #1089#1083#1086#1074#1077#1085#1089#1082#1080#1081' [sl]'
      #1089#1091#1072#1093#1080#1083#1080' [sw]'
      #1090#1072#1075#1072#1083#1100#1089#1082#1080#1081' [tl]'
      #1090#1072#1081#1089#1082#1080#1081' [th]'
      #1090#1091#1088#1077#1094#1082#1080#1081' [tr]'
      #1091#1082#1088#1072#1080#1085#1089#1082#1080#1081' [uk]'
      #1092#1080#1085#1089#1082#1080#1081' [fi]'
      #1092#1088#1072#1085#1094#1091#1079#1089#1082#1080#1081' [fr]'
      #1093#1080#1085#1076#1080' [hi]'
      #1093#1086#1088#1074#1072#1090#1089#1082#1080#1081' [hr]'
      #1095#1077#1096#1089#1082#1080#1081' [cs]'
      #1096#1074#1077#1076#1089#1082#1080#1081' [sv]'
      #1101#1089#1090#1086#1085#1089#1082#1080#1081' [et]'
      #1103#1087#1086#1085#1089#1082#1080#1081' [ja]')
  end
  object GtransHttpClient: THttpCli
    LocalAddr = '0.0.0.0'
    ProxyPort = '80'
    Agent = 'Opera/9.64 (Windows NT 5.1; U; ru) Presto/2.1.1'
    Accept = 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*'
    NoCache = False
    ContentTypePost = 'application/x-www-form-urlencoded'
    MultiThreaded = False
    RequestVer = '1.0'
    FollowRelocation = True
    LocationChangeMaxCount = 5
    ServerAuth = httpAuthNone
    ProxyAuth = httpAuthNone
    BandwidthLimit = 10000
    BandwidthSampling = 1000
    Options = []
    SocksAuthentication = socksNoAuthentication
    Left = 152
    Top = 64
  end
end
