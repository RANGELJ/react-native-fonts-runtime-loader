@objc(FontsRuntimeLoader)
class FontsRuntimeLoader: NSObject {

  @objc(loadFontFromFilePath:withResolver:withRejecter:)
  func loadFontFromFilePath(
    params: [String: String],
    resolve:RCTPromiseResolveBlock,
    reject:RCTPromiseRejectBlock
  ) -> Void {
    guard let filePath = params["filePath"] else {
      reject(nil, "filePath not provided", nil)
      return
    }
    guard let filePath = params["fontName"] else {
      reject(nil, "fontName not provided", nil)
      return
    }
    resolve(filePath)
  }
}
