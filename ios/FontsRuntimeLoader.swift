@objc(FontsRuntimeLoader)
class FontsRuntimeLoader: NSObject {

  @objc(loadFontFromFilePath:withB:withResolver:withRejecter:)
  func loadFontFromFilePath(
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
