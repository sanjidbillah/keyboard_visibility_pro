
This flutter pacakge will detect soft-keyboard open and close status.


## How to use: 
In the `dependencies`: section of your `pubspec.yaml`, add the following line:
```
dependencies:
     keyboard_visibility_pro: ^0.0.1
```
install packages from the command line:

```
$ flutter pub get
```
Now in your Dart code, you can use:
```
 KeyboardVisibility(
      // it will notify
        onChanged: (bool visible) {
          print(visible);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[TextField()],
          ),
        ),
      ),
```


