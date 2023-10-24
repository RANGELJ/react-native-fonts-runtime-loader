package com.fontsruntimeloader

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.Arguments
import java.io.File
import android.graphics.Typeface

class FontsRuntimeLoaderModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun loadFontFromFilePath(data: ReadableMap, promise: Promise) {
    var filePath = data.getString("filePath")
    var fontName: String = data.getString("fontName") ?: ""

    var fontNameRegex = "^[a-zA-Z]+$".toRegex()

    if (fontNameRegex.matches(fontName)) {
      promise.reject("INVALID_FONT_NAME", "The font name '$fontName' is invalid. Should have only letters.")
      return
    }

    val file = File(filePath)

    if (!file.exists()) {
      promise.reject("FILE_NOT_FOUND", "The file does not exist.")
      return
    }

    val typeface: Typeface
    try {
        typeface = Typeface.createFromFile(filePath)
    } catch (e: Exception) {
        promise.reject("TYPEFACE_CREATION_FAILED", "Failed to create typeface from file.")
        return
    }

    val typefaceData = Arguments.createMap()
    typefaceData.putInt("style", typeface.style)
    typefaceData.putBoolean("isBold", typeface.isBold)
    typefaceData.putBoolean("isItalic", typeface.isItalic)

    promise.resolve(typefaceData)
  }

  companion object {
    const val NAME = "FontsRuntimeLoader"
  }
}
