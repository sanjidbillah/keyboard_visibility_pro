import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

void main() {
  testWidgets('KeyboardVisibility detects keyboard visibility changes', (WidgetTester tester) async {
    // Track keyboard visibility changes
    bool keyboardVisible = false;
    bool callbackCalled = false;

    // Build our app with the KeyboardVisibility widget
    await tester.pumpWidget(
      MaterialApp(
        home: KeyboardVisibility(
          onChanged: (isVisible) {
            keyboardVisible = isVisible;
            callbackCalled = true;
          },
          child: const Scaffold(
            body: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Type something',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Initial state should have keyboard hidden
    expect(callbackCalled, false);
    expect(keyboardVisible, false);

    // Simulate keyboard visible
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);

    // Need to rebuild widget tree for the metrics change to be recognized
    await tester.pumpAndSettle();

    // Check that callback was called and keyboard is now reported as visible
    expect(callbackCalled, true);
    expect(keyboardVisible, true);

    // Reset tracking variable to verify next state change
    callbackCalled = false;

    // Simulate keyboard hiding
    tester.view.viewInsets = FakeViewPadding.zero;

    // Rebuild widget tree
    await tester.pumpAndSettle();

    // Check that callback was called again and keyboard is now reported as hidden
    expect(callbackCalled, true);
    expect(keyboardVisible, false);
  });

  testWidgets('KeyboardVisibility should not trigger callback if visibility state is unchanged',
      (WidgetTester tester) async {
    // Track keyboard visibility changes
    bool keyboardVisible = false;
    int callbackCount = 0;

    // Build our app with the KeyboardVisibility widget
    await tester.pumpWidget(
      MaterialApp(
        home: KeyboardVisibility(
          onChanged: (isVisible) {
            keyboardVisible = isVisible;
            callbackCount++;
          },
          child: const Scaffold(
            body: TextField(),
          ),
        ),
      ),
    );

    // Initial state should have keyboard hidden and no callback calls
    expect(callbackCount, 0);

    // Simulate keyboard showing
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);

    await tester.pumpAndSettle();

    // Callback should be called once
    expect(callbackCount, 1);
    expect(keyboardVisible, true);

    // Simulate another metrics change but with keyboard still visible
    tester.view.viewInsets = const FakeViewPadding(bottom: 400); // Different height but still visible

    await tester.pumpAndSettle();

    // Callback should not be called again since visibility state hasn't changed
    expect(callbackCount, 1);
    expect(keyboardVisible, true);
  });

  testWidgets('KeyboardVisibility should properly clean up observers', (WidgetTester tester) async {
    // Build our app with the KeyboardVisibility widget
    await tester.pumpWidget(
      MaterialApp(
        home: KeyboardVisibility(
          onChanged: (isVisible) {},
          child: const Scaffold(
            body: TextField(),
          ),
        ),
      ),
    );
  });
}
