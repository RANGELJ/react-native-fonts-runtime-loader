package com.fontsruntimeloader

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.Promise

class FontsRuntimeLoaderModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(data: ReadableMap, promise: Promise) {
    var a = data.getDouble("a")
    var b = data.getDouble("b")
    promise.resolve(a * b)
  }

  companion object {
    const val NAME = "FontsRuntimeLoader"
  }
}
