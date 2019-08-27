# CoreKit KeyboardAvoiding

Watch out ! We've got a keyboard here!



## Installation

### Swift Package Manager

```
.package(url: "https://github.com/CoreKit/KeyboardAvoiding", from: "1.0.0"),
```

### CocoaPods

```
source 'https://github.com/CoreKit/KeyboardAvoiding.git'
pod 'KeyboardAvoiding'
```

### Carthage

```
github "CoreKit/KeyboardAvoiding" "1.0.0"
```

## Usage

```swift
import UIKit
import KeyboardAvoiding

class ViewController: UIViewController {

    private var keyboardAvoiding: KeyboardAvoiding!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.keyboardAvoiding = KeyboardAvoiding({ rect in
            //do your stuff on show keyboard
        }, {
            //do your stuff on hide keyboard
        })
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


## License

[WTFPL](LICENSE) - Do what the fuck you want to.
