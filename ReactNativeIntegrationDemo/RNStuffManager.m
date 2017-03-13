//
//  RNStuffManager.m
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/13/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"

@interface RCT_EXTERN_MODULE(RNStuffManager, NSObject)

RCT_EXTERN_METHOD(addEvent:(nonnull NSNumber *)reactTag message:(NSString *)message callback:(RCTResponseSenderBlock *)successCallback);
RCT_EXTERN_METHOD(dismissPresentedViewController:(nonnull NSNumber *)reactTag);
RCT_EXTERN_METHOD(save:(nonnull NSNumber *)reactTag message:(NSString *)message);


@end
