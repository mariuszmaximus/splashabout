unit umainform;

{ Test Application for splashabout component

  Copyright (C)2013 minesadorada@charcodelvalle.com

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, Buttons, Graphics, ValEdit, usplashabout, Dialogs, ExtCtrls;

type

  { Tmainform }

  Tmainform = class(TForm)
    cmd_Splash: TBitBtn;
    cmd_close: TBitBtn;
    cmd_about: TBitBtn;
    cmd_ResetProperties: TBitBtn;
    SplashAboutPropertyEditor: TValueListEditor;
    procedure cmd_aboutClick(Sender: TObject);
    procedure cmd_ResetPropertiesClick(Sender: TObject);
    procedure cmd_SplashClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SplashAboutPropertyEditorValidateEntry(Sender: TObject;
      aCol, {%H-}aRow: integer; const OldValue: string; var NewValue: string);
  private
    { private declarations }
    splash: TSplashAbout;
    procedure SetDefaultValues;
    procedure DisplayProperties;
  public
    { public declarations }
  end;

var
  mainform: Tmainform;

implementation

{$R *.lfm}

{ Tmainform }
procedure Tmainform.SetDefaultValues;
begin
  // The splashunit optional properties are normally set in the Form.Create method
  splash.DelaySeconds := 3;
  splash.Title := 'Test App for SplashAbout';
  splash.IconFilePath := 'ski.ico';
  splash.BackGroundImageFilePath := 'splash.jpg';
  splash.MaskImageFilePath := 'roundedrect.bmp';
  // Must be .bmp file to make a shaped window
  // Note: if MaskImageFilePath is specified as a .jpg file, the jpg will
  // be automatically converted to a bmp file on first run.
  // Use a graphics app to reduce the bmp's color depth and thus - its file size
  splash.BackGroundColor := clSkyBlue;
  splash.LicenseFilePath := 'gpl.txt';
  splash.LicenseType := 'Public GPL License';
  splash.CreditString := 'Free to use and distribute';
  splash.Author := 'Gordon Bamber';
  splash.SupportContact := 'minesadorada@charcodelvalle.com';
end;

procedure Tmainform.DisplayProperties;
// Window dressing.
// The ValueEdit grid is so that you can set properties interactively
var
  s: string;
begin
  SplashAboutPropertyEditor.Keys[1] := 'DelaySeconds';
  SplashAboutPropertyEditor.Keys[2] := 'Title';
  SplashAboutPropertyEditor.Keys[3] := 'IconFilePath';
  SplashAboutPropertyEditor.Keys[4] := 'BackGroundImageFilePath';
  SplashAboutPropertyEditor.Keys[5] := 'MaskImageFilePath';
  SplashAboutPropertyEditor.Keys[6] := 'BackGroundColor';
  SplashAboutPropertyEditor.Keys[7] := 'LicenseFilePath';
  SplashAboutPropertyEditor.Keys[8] := 'LicenseType';
  SplashAboutPropertyEditor.Keys[9] := 'CreditString';
  SplashAboutPropertyEditor.Keys[10] := 'Author';
  SplashAboutPropertyEditor.Keys[11] := 'SupportContact';
  SplashAboutPropertyEditor.Values['DelaySeconds'] := IntToStr(splash.DelaySeconds);
  SplashAboutPropertyEditor.Values['Title'] := splash.Title;
  SplashAboutPropertyEditor.Values['IconFilePath'] := splash.IconFilePath;
  SplashAboutPropertyEditor.Values['BackGroundImageFilePath'] :=
    splash.BackGroundImageFilePath;
  SplashAboutPropertyEditor.Values['MaskImageFilePath'] :=
    splash.MaskImageFilePath;
  // Use routine from Graphics unit
  if ColorToIdent(splash.BackGroundColor, s) then
    SplashAboutPropertyEditor.Values['BackGroundColor'] := s
  else
    SplashAboutPropertyEditor.Values['BackGroundColor'] := 'Unknown color';
  SplashAboutPropertyEditor.Values['LicenseFilePath'] := splash.LicenseFilePath;
  SplashAboutPropertyEditor.Values['LicenseType'] := splash.LicenseType;
  SplashAboutPropertyEditor.Values['CreditString'] := splash.CreditString;
  SplashAboutPropertyEditor.Values['Author'] := splash.Author;
  SplashAboutPropertyEditor.Values['SupportContact'] := splash.SupportContact;
  // Force Repaint
  SplashAboutPropertyEditor.Invalidate;
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  // Create the component, then call ShowSplash - this is the minimum needed.
  splash := TSplashAbout.Create(nil);
  SetDefaultValues; // Optional
  splash.ShowSplash;

  // Property editor grid
  SplashAboutPropertyEditor.RowCount := 12; // Needed for 64-bit lazarus (?!)
  DisplayProperties;
end;

procedure Tmainform.SplashAboutPropertyEditorValidateEntry(Sender: TObject;
  aCol, aRow: integer; const OldValue: string; var NewValue: string);
// Window dressing.
// The ValueEdit grid is so that you can set properties interactively
var
  iTest: integer;
  lColor: TColor;
begin
  // User cannot edit property names!
  if aCol = 0 then
  begin
    NewValue := OldValue;
    Exit;
  end;

  // Deal with negative values passed to Cardinal property using ABS
  if TryStrToInt(SplashAboutPropertyEditor.Values['DelaySeconds'], iTest) then
  begin
    splash.DelaySeconds :=
      StrToInt(SplashAboutPropertyEditor.Values['DelaySeconds']);
    SplashAboutPropertyEditor.Values['DelaySeconds'] :=
      IntToStr(splash.DelaySeconds);
  end
  else // Not even a number!
    SplashAboutPropertyEditor.Values['DelaySeconds'] := IntToStr(splash.DelaySeconds);

  splash.Title := SplashAboutPropertyEditor.Values['Title'];
  splash.IconFilePath := SplashAboutPropertyEditor.Values['IconFilePath'];
  splash.BackGroundImageFilePath :=
    SplashAboutPropertyEditor.Values['BackGroundImageFilePath'];
  splash.MaskImageFilePath :=
    SplashAboutPropertyEditor.Values['MaskImageFilePath'];

  // Use routine in Graphics unit
  if IdentToColor(SplashAboutPropertyEditor.Values['BackGroundColor'], lColor) then
    splash.BackGroundColor := lColor
  else
  begin
    ShowMessage(SplashAboutPropertyEditor.Values['BackGroundColor'] +
      ' is not a valid color');
    NewValue := OldValue;
    ColorToIdent(splash.BackGroundColor, NewValue);
  end;
  splash.LicenseFilePath := SplashAboutPropertyEditor.Values['LicenseFilePath'];
  splash.LicenseType := SplashAboutPropertyEditor.Values['LicenseType'];
  splash.CreditString := SplashAboutPropertyEditor.Values['CreditString'];
  splash.Author := SplashAboutPropertyEditor.Values['Author'];
  splash.SupportContact := SplashAboutPropertyEditor.Values['SupportContact'];
end;

procedure Tmainform.cmd_aboutClick(Sender: TObject);
begin
  splash.ShowAbout;
end;

procedure Tmainform.cmd_ResetPropertiesClick(Sender: TObject);
begin
  SetDefaultValues;
  DisplayProperties;
end;

procedure Tmainform.cmd_SplashClick(Sender: TObject);
begin
  splash.ShowSplash;
end;

end.
