# Swift UI

An experiment in building a modal UI in Swift code, because storyboards suck.

Note that this repository has nothing to do with the new
Swift UI framework Apple released recently.
It's just something I named it.

## Research

https://medium.com/better-programming/creating-ui-programmatically-in-swift-c919463c3cd0

- `loadView` instead of `viewDidLoad` override of the view controller
- `self.view.addSubview` to add the control to the view
- `NSLayoutConstraint.activate` to attach constraints to the control
  - `${control}.*anchor.constraint()` methods in an array
  - `(equalTo: self.view.*Anchor/*Guide.*Anchor, constraint: #)`

https://fluffy.es/intro-to-creating-ui-in-code-1

https://fluffy.es/intro-to-creating-ui-in-code-2

## Debugging

Use the Debug View Hierarchy debugger button to inspect the view
hierarchy at runtime.
Check for purple box exclamation point icon next to an element in
the hierarchy view to spot lacking constraints and other layout
issues.
