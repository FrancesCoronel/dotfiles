//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class NSMutableDictionary;

@interface BCBonjourBlockHandler : NSObject
{
    NSMutableDictionary *_handlers;
}


- (void)handleCommand:(id)arg1 message:(id)arg2 receiver:(id)arg3;
@property(retain, nonatomic) NSMutableDictionary *handlers; // @synthesize handlers=_handlers;
- (void)setCommand:(id)arg1 handler:(CDUnknownBlockType)arg2;

@end

