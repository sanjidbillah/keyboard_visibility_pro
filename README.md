
This flutter pacakge will detect soft-keyboard open and close status.


## How to use: 
In the `dependencies`: section of your `pubspec.yaml`, add the following line:
```
dependencies:
     keyboard_visibility_pro: ^1.0.0
```
install packages from the command line:

```
$ flutter pub get
```
Now in your Dart code, you can use:
```
KeyboardVisibility(
        // This callback is triggered whenever the visibility of the keyboard changes.
        // It passes a boolean value `isKeyboardVisible` that indicates whether the keyboard is visible or not.
        // The value is printed to the console for debugging purposes.
        onChanged: (bool isKeyboardVisible) {
          print(isKeyboardVisible);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[TextField()],
          ),
        ),
      ),
```


