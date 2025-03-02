import 'package:flutter/material.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keyboard visibility example"),
      ),
      body: KeyboardVisibility(
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
    );
  }
}
