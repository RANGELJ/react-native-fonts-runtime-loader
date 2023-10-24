#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(FontsRuntimeLoader, NSObject)

RCT_EXTERN_METHOD(loadFontFromFilePath:(NSDictionary *)params
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
