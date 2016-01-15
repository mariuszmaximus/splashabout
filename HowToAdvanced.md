  * HowToBasic, Basic use
  * SplashAbout, Menu page

# How To (Advanced) #

As well as [basic use](HowToBasic.md), you can set the following properties after splash.Create(nil) and before calling splash.ShowSplash

If you set no properties, ShowSplash and ShowAbout will use built-in defaults (and will look quite dull!)

  * **splash.DelaySeconds**:=3; // OPTIONAL. Default is 2 Seconds
  * **splash.Title**:='My Superb App'; // OPTIONAL. Default is Application Title or Form Caption
  * **splash.IconFilePath**:='myicon.ico'; // OPTIONAL.  Default is Application.Icon or Form.Icon
  * **splash.BackGroundImageFilePath**:='splash.jpg'; // OPTIONAL.  Default is no Background Image. Optimal size=320 x 240
  * **splash.MaskImageFilePath**:='roundedrect.bmp'; // OPTIONAL.
> _MaskImageFilePath makes a shaped splash form. Optimum source: .BMP image, 2-bit color depth or more, black area=invisible, white area=visible. Size >= 320 x 240_
> _If a jpg file is specified by mistake, it will be converted to a (large filesize 24bbp!) .bmp and saved to disk on first run_
  * **splash.BackGroundColor**:=clSkyBlue; // OPTIONAL.  Only relavent if no background image specified.  Default is clDefault
  * **splash.LicenseFilePath**:='gpl.txt'; // OPTIONAL.  Default is for Licence button to be absent on ShowAbout method
  * **splash.LicenseType**:='Public GPL License'; // OPTIONAL.  Default is no text
  * **splash.CreditString**:='Freeware by minesadorada'; // OPTIONAL.  Default is no text
  * **splash.Author**:='Mines A. Dorada'; // OPTIONAL.  Default is boilerplate text in LicenseFilePath
  * **splash.SupportContact**:='minesadorada@charcodelvalle.com'; // OPTIONAL.  Default is boilerplate text in LicenseFilePath

## Making a MaskImage ##
This is how you get a cool-looking shaped Splash window when setting the **MaskImageFilePath** property.
### Method 1 ###
  1. In any graphics application, start with a black image of any size (above 320px x 240px)
  1. Make a shape in the image with a White brush/paint (this will be the visible area of the Splash screen)
  1. Reduce the colour count to 2 (just black and white)
  1. Save as a regular Windows Bitmap, and deploy in the same folder as your app
### Method 2 ###
  1. In any graphics application make a JPG graphic using only Black and White
  1. In your app, set **MaskImageFilePath** to your JPG and call the **ShowSplash** method
  1. SplashAbout will convert your JPG to a BMP (with a warning message)
  1. Open the generated BMP in a graphics package and reduce the color count to bring the file size down

The Download package includes a few MaskImage .BMP files to show an example.

### Showing a License dialog ###
  1. Set the **LicenseFilePath** property to be one of the included text files (gpl.txt, modifiedgpl.txt etc.)  The chosen text file must be deployed in the same folder as your application.
  1. Match the **LicenseType** property with your chosen license (optional)
_Note:_ The text in the displayed license dialog will use the property values of **CreditString**, **Author** and **SupportContact**

### A background image for your Splash and About dialogs ###
  1. Choose any JPG file and resize to 320 x 240px
    * SplashAbout will automatically resize bigger images, (but that would waste file space)
  1. Set the property **BackgroundFilePath** to the filename.
    * You could set a full path+filename if you deploy it outside your application's folder
  1. Deploy the jpg image in the same folder as your deployed app
If you don't want a background image, and the property BackGroundColor is blank, then the dialogs with use clDefault as a colour (usually white or grey)

_Note:_ You can set the property **BackGroundColor** to any predefined FPC color (starting with cl - like clWhite, clWindowBackground etc)

### Title and IconFilePath ###
  * You can specify these using properties or let SplashAbout fetch them for you from the Application resources
  * To use the Icon and Title from your main form
    * Use **Self** in the Create method eg. **splash.Create(Self)**
  * To use the Icon and Title from your project settings
    * Use **Nil** in the Create method eg. **splash.Create(Nil)**
_Note:_ If you set the **IconFilePath** property, you must deploy the .ico file with your application


---
