//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "_MSBitmapLayer.h"

#import "MSImageOwner.h"

@class NSString;

@interface MSBitmapLayer : _MSBitmapLayer <MSImageOwner>
{
    BOOL _lightweightTreatAsAlpha;
}

+ (id)bitmapLayerFromImage:(id)arg1;
+ (id)bitmapLayerWithImageFromPasteboard:(id)arg1;
+ (id)bitmapLayerWithImageFromPath:(id)arg1;
+ (unsigned long long)traits;
- (id)NSImage;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
- (void)addImageOwnersToSet:(id)arg1;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
- (id)defaultName;
- (void)drawPreviewInRect:(struct CGRect)arg1 selected:(BOOL)arg2;
- (void)fillInEmptyObjects;
- (id)handlerName;
- (BOOL)hasNineSliceEnabled;
- (void)initEmptyObject;
- (id)initWithFrame:(struct CGRect)arg1 image:(id)arg2;
@property(nonatomic) BOOL lightweightTreatAsAlpha; // @synthesize lightweightTreatAsAlpha=_lightweightTreatAsAlpha;
- (void)migratePropertiesFromV56OrEarlierWithCoder:(id)arg1;
- (void)migratePropertiesFromV59OrEarlierWithCoder:(id)arg1;
- (struct CGSize)minimumSize;
- (void)prepareObjectCopy:(id)arg1;
- (void)reduceImageSize;
- (Class)rendererClass;
- (void)setupWithLayerBuilderDictionary:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

