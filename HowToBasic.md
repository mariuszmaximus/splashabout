  * SplashAbout, Menu Page
  * HowToAdvanced, Shaped windows background images etc

# Basic Use #

Files needed (in the same folder as your project)

**usplashabout.pas,uversion.pas**

Optional files deployed in the same folder as your application:

  * Optional: gpl.txt, lgpl.txt,modifiedgpl.txt,mit.txt
  * Optional: splashgraphic.(bmp/jpg/gif)
  * Optional: splashicon.ico
  * Optional: windowshapegraphic.bmp

### How to use in your project ###

  * Put **usplashabout** in the interface/uses of your main form
  * Declare a variable of type TSplashAbout in your form type definition
  * Call method ShowSplash and/or method ShowAbout

Example:
```
TForm1 = class(TForm)
...
private
  { private declarations }
  splash:TSplashAbout;
...
end;
```
EXAMPLE CODE in form.Create()
(Most properties are Optional)

```
splash:=TSplashAbout.Create(Self);
// (Uses Form Caption and Icon by default)

// Alternative: splash:=TSplashAbout.Create(Nil);
// (Uses Application.Title and project Icon by default)
splash.ShowSplash
```

_Note:_ There is a fuller example code listing [here](ExampleCode.md)