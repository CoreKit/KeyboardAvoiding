# KeyboardAvoiding

Easy to use keyboard avoiding library.

## Installation

### Swift Package Manager

```
.package(url: "https://github.com/CoreKit/KeyboardAvoiding", from: "1.0.0"),
```

## Usage

```swift
import UIKit
import KeyboardAvoiding

class ViewController: UIViewController {

    private var keyboardAvoiding: KeyboardAvoiding!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyboardAvoiding = KeyboardAvoiding()
        .onKeyboardWillShow { rect in
            // do your stuff here 
        }
        .onKeyboardDidShow { rect in
            // do your stuff here
        }
        .onKeyboardWillHide {
            // do your stuff here
        }
        .onKeyboardDidHide {
            // do your stuff here
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.keyboardAvoiding.start()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.keyboardAvoiding.stop()
    }
}
```
