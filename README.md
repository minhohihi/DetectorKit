# DetectorKit
Easy object detection, framing and obfuscation with Swift

## Installation
The easiest way the use DetectorKit is with CocoaPods

### Installation with CocoaPods
To integrate DetectorKit into your Xcode project using CocoaPods, specify it in your `Podfile`

```ruby
platform :ios, '10.0'

target 'TargetName' do
  pod 'DetectorKit', :git => 'https://github.com/stevewight/DetectorKit.git
end
```

Then, run the following command:

```bash
$ pod install
```


## Architecture

![uml diagram of DetectorKits object model](https://github.com/stevewight/DetectorKit/blob/master/images/v002-architecture.png)

The light gray boxes at the top of the architecture diagram above are the public interface into DetectorKit.  Through these you can easily access the core features of detecting, framing and obfuscating faces and text within images.

## Usage

### Detecting
#### Faces
```swift
// Detect all faces within an image
let faceDetector = FaceDetector(image)

// Then you can easily access the faces (as CIFeatures)
let faces = faceDetector.faces

// Access underlying CIDetector
let detector = faceDetector.detector
```

### Framing
#### Faces
```swift
let faceFramer = FaceFramer(imageView)

// Change color and borderWidth 
// Note: borderWidth only works for box() and radial()
faceFramer.shapeColor = UIColor.red
faceFramer.borderWidth = 2.0

// Frame faces with a rectangle
faceFramer.box()

// or with a radial frame
faceFramer.radial()

// or with a pulsing circle
faceFramer.pulse()

// or with rotating boxes
faceFramer.boxRotate()
```
![](https://github.com/stevewight/DetectorKit/blob/master/images/box-frame.gif)
![](https://github.com/stevewight/DetectorKit/blob/master/images/radial-frame.gif)
![](https://github.com/stevewight/DetectorKit/blob/master/images/pulse-frame.gif)
![](https://github.com/stevewight/DetectorKit/blob/master/images/box-rotate-frame.gif)

### Obfuscating
#### Faces
```swift
let faceObscure = FaceObscure(image)

// pixelate all faces within an image
faceObscure.pixelate()

// or use a crystalize filter
faceObscure.crystalize()
```
![Faces pixelated](https://github.com/stevewight/DetectorKit/blob/master/images/pixelate-faces.png)
![Faces crystalized](https://github.com/stevewight/DetectorKit/blob/master/images/crystalize-faces.png)

## Example

For an example app implementing the above usage, take a look at [Sherlock](https://github.com/stevewight/Sherlock)

## License

DetectorKit is released under the ***MIT*** license. See LICENSE for details.
