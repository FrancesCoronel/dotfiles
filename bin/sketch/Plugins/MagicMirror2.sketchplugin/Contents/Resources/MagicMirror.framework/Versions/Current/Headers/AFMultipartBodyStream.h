//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSInputStream.h"

#import "NSCopying.h"
#import "NSStreamDelegate.h"

@class AFHTTPBodyPart, NSEnumerator, NSError, NSMutableArray, NSMutableData, NSOutputStream, NSString;

@interface AFMultipartBodyStream : NSInputStream <NSCopying, NSStreamDelegate>
{
    id <NSStreamDelegate> delegate;
    unsigned long long streamStatus;
    NSError *streamError;
    unsigned long long _numberOfBytesInPacket;
    double _delay;
    NSInputStream *_inputStream;
    unsigned long long _stringEncoding;
    NSMutableArray *_HTTPBodyParts;
    NSEnumerator *_HTTPBodyPartEnumerator;
    AFHTTPBodyPart *_currentHTTPBodyPart;
    NSOutputStream *_outputStream;
    NSMutableData *_buffer;
}


@property(retain, nonatomic) NSEnumerator *HTTPBodyPartEnumerator; // @synthesize HTTPBodyPartEnumerator=_HTTPBodyPartEnumerator;
@property(retain, nonatomic) NSMutableArray *HTTPBodyParts; // @synthesize HTTPBodyParts=_HTTPBodyParts;
- (void)_scheduleInCFRunLoop:(struct __CFRunLoop *)arg1 forMode:(struct __CFString *)arg2;
- (BOOL)_setCFClientFlags:(unsigned long long)arg1 callback:(CDUnknownFunctionPointerType)arg2 context:(CDStruct_e097db04 *)arg3;
- (void)_unscheduleFromCFRunLoop:(struct __CFRunLoop *)arg1 forMode:(struct __CFString *)arg2;
- (void)appendHTTPBodyPart:(id)arg1;
@property(retain, nonatomic) NSMutableData *buffer; // @synthesize buffer=_buffer;
- (void)close;
@property(readonly, nonatomic) unsigned long long contentLength;
- (id)copyWithZone:(struct _NSZone *)arg1;
@property(retain, nonatomic) AFHTTPBodyPart *currentHTTPBodyPart; // @synthesize currentHTTPBodyPart=_currentHTTPBodyPart;
@property(nonatomic) double delay; // @synthesize delay=_delay;
- (id)delegate;
- (BOOL)getBuffer:(char **)arg1 length:(unsigned long long *)arg2;
- (BOOL)hasBytesAvailable;
- (id)initWithStringEncoding:(unsigned long long)arg1;
@property(retain, nonatomic) NSInputStream *inputStream; // @synthesize inputStream=_inputStream;
@property(readonly, nonatomic, getter=isEmpty) BOOL empty;
@property(nonatomic) unsigned long long numberOfBytesInPacket; // @synthesize numberOfBytesInPacket=_numberOfBytesInPacket;
- (void)open;
@property(retain, nonatomic) NSOutputStream *outputStream; // @synthesize outputStream=_outputStream;
- (id)propertyForKey:(id)arg1;
- (long long)read:(char *)arg1 maxLength:(unsigned long long)arg2;
- (void)removeFromRunLoop:(id)arg1 forMode:(id)arg2;
- (void)scheduleInRunLoop:(id)arg1 forMode:(id)arg2;
- (void)setDelegate:(id)arg1;
- (void)setInitialAndFinalBoundaries;
- (BOOL)setProperty:(id)arg1 forKey:(id)arg2;
- (void)setStreamError:(id)arg1;
- (void)setStreamStatus:(unsigned long long)arg1;
@property(nonatomic) unsigned long long stringEncoding; // @synthesize stringEncoding=_stringEncoding;
- (id)streamError;
- (unsigned long long)streamStatus;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

