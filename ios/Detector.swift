import Foundation
import UIKit
import CoreML

@objc(Detector)
class Detector: NSObject {
  @objc(detect:resolver:rejecter:)
  func detect(_ filePath: String, resolver resolve: RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
  
    let model = VansModel()

    let size = CGSize(width: 299, height: 299)
    let url = NSURL(string: filePath)
    let data = NSData(contentsOf: url! as URL)
    let image = UIImage(data: data! as Data)

    guard let buffer = image?.resize(to: size)?.pixelBuffer() else {
      fatalError("Scaling or converting to pixel buffer failed!")
    }

    guard let result = try? model.prediction(image: buffer) else {
      fatalError("Prediction failed!")
    }

    resolve(result.classLabel)
  }
}

