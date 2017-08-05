//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class NSString;

@interface BCNetworkTime : NSObject
{
    int _socket;
    CDUnknownBlockType _completion;
    NSString *_host;
    struct addrinfo *_allAddressInfo;
    struct addrinfo *_addressInfo;
    unsigned long long _timeout;
}

+ (void)requestTimeFromHost:(id)arg1 timeout:(unsigned long long)arg2 completionBlock:(CDUnknownBlockType)arg3;

@property(nonatomic) struct addrinfo *addressInfo; // @synthesize addressInfo=_addressInfo;
@property(nonatomic) struct addrinfo *allAddressInfo; // @synthesize allAddressInfo=_allAddressInfo;
- (void)closeSocket;
@property(copy, nonatomic) CDUnknownBlockType completion; // @synthesize completion=_completion;
- (void)dealloc;
- (void)determineHostAddress;
@property(copy, nonatomic) NSString *host; // @synthesize host=_host;
- (id)initWithCompletionBlock:(CDUnknownBlockType)arg1;
@property(readonly, nonatomic) BOOL isSocketOpen;
- (void)openSocket;
- (void)readResponse;
- (void)requestNTPTime;
- (void)sendCompletion:(id)arg1;
- (void)sendRequest;
@property(nonatomic) int socket; // @synthesize socket=_socket;
@property(nonatomic) unsigned long long timeout; // @synthesize timeout=_timeout;

@end

