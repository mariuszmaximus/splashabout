  * [Home](SplashAbout.md)

# Copy/Paste code #

This gives you an idea of how to use SplashAbout in a project.  It will use the Project version numbers, application title and the project application Icon.

Set these as normal in Project/Options and SplashAbout will display them.

```
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  uSplashAbout;

type

  { TForm1 }

  TForm1 = class(TForm)
    AboutButton: TButton;
    procedure AboutButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    splash:TSplashAbout;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  splash:=TSplashAbout.Create(nil);
  splash.BackGroundColor:=clSkyBlue;
  // Set any extra properties here
  splash.ShowSplash;
end;

procedure TForm1.AboutButtonClick(Sender: TObject);
begin
  splash.ShowAbout;
end;

end.
```