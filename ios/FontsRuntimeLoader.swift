import CoreGraphics
import CoreText
import CoreFoundation

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

    let fileManager = FileManager.default
    guard fileManager.fileExists(atPath: filePath) else {
      reject(nil, "File does not exist at the provided filePath", nil)
      return
    }

    guard let fontDataProvider = CGDataProvider(filename: filePath) else {
      reject(nil, "Could not create font data provider for file at \(filePath)", nil)
      return
    }

    guard let newFont = CGFont(fontDataProvider) else {
      reject(nil, "Could not create CGFont from data at \(filePath)", nil)
      return
    }

    let registeredFonts = CTFontManagerCopyRegisteredFonts()
    for i in 0..<CFArrayGetCount(registeredFonts) {
      let font = unsafeBitCast(CFArrayGetValueAtIndex(registeredFonts, i), to: CGFont.self)
      if font.postScriptName == newFont.postScriptName {
        resolve(font.postScriptName)
        return
      }
    }

    var error: Unmanaged<CFError>?
    if !CTFontManagerRegisterGraphicsFont(newFont, &error) {
      reject(nil, "Could not register font", nil)
      return
    }

    var postName = newFont.postScriptName

    resolve(postName)
  }
}
