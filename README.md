# Swift UI

An experiment in building a modal UI in Swift code, because storyboards suck.

## Research

https://medium.com/better-programming/creating-ui-programmatically-in-swift-c919463c3cd0

- `loadView` instead of `viewDidLoad` override of the view controller
- `self.view.addSubview` to add the control to the view
- `NSLayoutConstraint.activate` to attach constraints to the control
  - `${control}.*anchor.constraint()` methods in an array
  - `(equalTo: self.view.*Anchor/*Guide.*Anchor, constraint: #)`

https://fluffy.es/intro-to-creating-ui-in-code-1

https://fluffy.es/intro-to-creating-ui-in-code-2
