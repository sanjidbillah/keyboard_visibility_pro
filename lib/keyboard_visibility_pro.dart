library keyboard_visibility_pro;

import 'package:flutter/material.dart';

class KeyboardVisibility extends StatefulWidget {
  final Widget child;
  final void Function(bool) onChanged;
  const KeyboardVisibility(
      {Key? key, required this.child, required this.onChanged})
      : super(key: key);

  @override
  State<KeyboardVisibility> createState() => _KeyboardVisibilityState();
}

class _KeyboardVisibilityState extends State<KeyboardVisibility>
    with WidgetsBindingObserver {
  bool _isVisible = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      if (_isVisible != true) {
        _isVisible = true;
        widget.onChanged.call(_isVisible);
      }
    } else {
      if (_isVisible != false) {
        _isVisible = false;
        widget.onChanged.call(_isVisible);
      }
    }
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
