@objc(FontsRuntimeLoader)
class FontsRuntimeLoader: NSObject {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(
    params: [String: Float],
    resolve:RCTPromiseResolveBlock,
    reject:RCTPromiseRejectBlock
  ) -> Void {
    if let a = params["a"], let b = params["b"] {
      resolve(a*b)
    } else {
      reject(nil, "Invalid parameters", nil)
    }
  }
}
