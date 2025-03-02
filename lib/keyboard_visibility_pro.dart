library keyboard_visibility_pro;

import 'package:flutter/material.dart';

// KeyboardVisibility is a StatefulWidget that listens to changes in the keyboard visibility.
// It takes a child widget and a callback function 'onChanged' that gets called when the keyboard visibility changes.
class KeyboardVisibility extends StatefulWidget {
  final Widget child; // The child widget that will be wrapped by this widget.
  final void Function(bool) onChanged; // The callback function that will be called when keyboard visibility changes.

  // Constructor to initialize the child and the onChanged function.
  const KeyboardVisibility({Key? key, required this.child, required this.onChanged}) : super(key: key);

  @override
  State<KeyboardVisibility> createState() => _KeyboardVisibilityState();
}

// _KeyboardVisibilityState handles the state of the KeyboardVisibility widget.
class _KeyboardVisibilityState extends State<KeyboardVisibility> with WidgetsBindingObserver {
  bool _isVisible = false; // Tracks whether the keyboard is visible or not.

  @override
  void initState() {
    super.initState();
    // Register this widget as an observer of the app's lifecycle and system events, like keyboard visibility.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove this widget as an observer to prevent memory leaks.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // This method is called when the system's window metrics change, such as when the keyboard shows or hides.
    
    // Check if the bottom inset of the screen is greater than 0, which indicates that the keyboard is visible.
    if (View.of(context).viewInsets.bottom > 0.0) {
      // If the keyboard visibility has changed and the keyboard was previously hidden, update the state.
      if (_isVisible != true) {
        _isVisible = true;
        widget.onChanged.call(_isVisible); // Notify the parent widget about the visibility change.
      }
    } else {
      // If the keyboard is not visible, update the state to reflect it.
      if (_isVisible != false) {
        _isVisible = false;
        widget.onChanged.call(_isVisible); // Notify the parent widget about the visibility change.
      }
    }

    super.didChangeMetrics(); // Call the superclass method to ensure proper functionality.
  }

  @override
  Widget build(BuildContext context) {
    // Return the child widget that was passed to the KeyboardVisibility widget.
    return widget.child;
  }
}
