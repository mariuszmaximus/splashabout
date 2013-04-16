Due Credit
==========
uversion.pas by Mike Thompson - mike.cornflake@gmail.com
originally as VersionSupport.pas
See uversion.pas header for more details

======================================================
SplashAbout by Gordon Bamber (minesadorada@charcodelvalle.com)
======================================================
GPL Licence: Use or modify freely the code without charge as per license terms.

Purpose
=======
Constructs a Splash screen and About form with as little effort and resources as possible :)
The windows and controls are created and destroyed on-the-fly to reduce application size
For a shaped splash screen, use the .bmp files included, or make your own in an image editor

Files needed (in the same folder as your project)
================================================
usplashabout.pas,uversion.pas

Optional: gpl.txt, lgpl.txt,modifiedgpl.txt,mit.txt
Optional: <splashgraphic>.(bmp/jpg/gif)
Optional: <splashicon>.ico
Optional: <windowshapegraphic>.bmp

How to use in your project
==========================
Put usplashabout in the interface/uses of your main form
Declare a variable of type TSplashAbout in your form type definition

Example:
TForm1 = class(TForm)
...
private
  { private declarations }
  splash:TSplashAbout;
...
end;

EXAMPLE CODE in form.Create()
(Most properties are Optional)
============================
splash:=TSplashAbout.Create(Self);
// (Uses Form Caption and Icon by default)

// Alternative: splash:=TSplashAbout.Create(Nil);
// (Uses Application.Title and project Icon by default)

splash.DelaySeconds:=3; // OPTIONAL. Default is 2 Seconds
splash.Title:='My Superb App'; // OPTIONAL. Default is Application Title or Form Caption
splash.IconFilePath:='myicon.ico'; // OPTIONAL.  Default is Application.Icon or Form.Icon
splash.BackGroundImageFilePath:='splash.jpg'; // OPTIONAL.  Default is no Background Image. Optimal size=320 x 240
splash.MaskImageFilePath:='roundedrect.bmp'; // OPTIONAL.
// Makes a shaped splash form. Optimum source: .BMP image, 2-bit color depth or more, black area=invisible, white area=visible. Size >= 320 x 240
// If a jpg file is specified by mistake, it will be converted to a (large filesize 24bbp!) .bmp and saved to disk on first run.
splash.BackGroundColor:=clSkyBlue; // OPTIONAL.  Only relavent if no background image specified.  Default is clDefault
splash.LicenseFilePath:='gpl.txt'; // OPTIONAL.  Default is for Licence button to be absent on ShowAbout method
splash.LicenseType:='Public GPL License'; // OPTIONAL.  Default is no text
splash.CreditString:='Freeware by minesadorada'; // OPTIONAL.  Default is no text
splash.Author:='Mines A. Dorada'; // OPTIONAL.  Default is boilerplate text in LicenseFilePath
splash.SupportContact:='minesadorada@charcodelvalle.com'; // OPTIONAL.  Default is boilerplate text in LicenseFilePath
splash.ShowSplash;
=============================

EXAMPLE USE in Help/About
=========================
// Assuming splash class has already been created
splash.ShowAbout;

// If not, then:
splash:=TSplashAbout.Create(Nil);
// (See above for setting properties)
splash.ShowAbout;       