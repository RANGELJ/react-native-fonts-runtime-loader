package com.fontsruntimeloader

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise
import java.io.File

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

    val file = File(filePath)

    if (!file.exists()) {
      promise.reject("FILE_NOT_FOUND", "The file does not exist.")
      return
    }

    promise.resolve(filePath)
  }

  companion object {
    const val NAME = "FontsRuntimeLoader"
  }
}
