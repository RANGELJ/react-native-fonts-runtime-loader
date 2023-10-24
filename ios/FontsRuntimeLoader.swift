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

    guard let fontName = params["fontName"], fontName.allSatisfy({ $0.isLetter }) else {
      reject(nil, "Invalid fontName: \(params["fontName"] ?? "") Should have only letters.", nil)
      return
    }

    resolve(filePath)
  }
}
