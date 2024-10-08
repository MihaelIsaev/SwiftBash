<p align="center">
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.1-brightgreen.svg" alt="Swift 5.1">
    </a>
    <a href="https://discord.gg/q5wCPYv">
        <img src="https://img.shields.io/discord/612561840765141005" alt="Swift.Stream">
    </a>
</p>

<br>

#### Support this lib by giving a ⭐️

Built for any swift project

## How to install

### Swift Package Manager

```swift
.package(url: "https://github.com/MihaelIsaev/SwiftBash.git", from:"1.0.0")
```
In your target's dependencies add `"Bash"` e.g. like this:
```swift
.target(name: "App", dependencies: [
    .product(name: "Bash", package: "SwiftBash")
]),
```

## Usage

### Which
```swift
import Bash

try {
    let pathToProgram = try bash.which("systemd")
} catch {
    if let error = error as? WhichError {
        switch error {
        case .notFound(let program):
            print("Program not found")
        }
    } else {
        print("Bash error: \(error)")
    }
}
```

## Dependencies

`Foundation` only

## Contributing

Please feel free to contribute!
