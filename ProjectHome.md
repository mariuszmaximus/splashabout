## SplashAbout Lazarus/FPC component ##
### by Gordon Bamber ###

Compatible Lazarus > 1.x, FPC > 2.6.x, Windows and Linux tested

I got fed up of coding Splash and About screens individually, so I made a simple Object with optional properties and only 2 methods (ShowSplash, and ShowAbout) that could be dropped into any GUI application with the minimum of effort to produce useful and standard dialogs containing version and other information.

With 3 lines of code, your application can have  a nice-looking splash screen and Help/About dialog.

By setting more properties, the splash window can be more individual; with a shaped window, background image etc, whist the about dialog will display OS information and display license text.

Only 2 .pas files are needed (no form files or resources), and the code is fully internally commented.  The splash and about windows are constructed in code 'on-the-fly' and destroyed when closed, so the component adds virtually no 'fat' to your application.

An example simple application project shows the component in use.

  * [Click here to see the Wiki for usage and screenshots](SplashAbout.md)
  * Go to Downloads to get all you need to test and use SplashAbout in your app.
  * Go to Source/Browse to check out the source code.