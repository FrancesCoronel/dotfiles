//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSBaseAction.h"

#import "MSAltButtonTarget.h"

@class NSString;

@interface MSBaseAlignLayersAction : MSBaseAction <MSAltButtonTarget>
{
}

- (void)alignToKey:(id)arg1;
- (void)alignVectorPointsToKey:(id)arg1;
- (BOOL)altButtonCanShowAltImage:(id)arg1;
- (BOOL)canAlignToArtboardInstead;
- (BOOL)selectionContainsNoArtboards;
- (BOOL)selectionContainsOnlyArtboards;
- (BOOL)validate;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

