//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSModelBase.h"

@class MSArray, MSAssetCollection, MSSharedLayerContainer, MSSharedLayerStyleContainer, MSSharedLayerTextStyleContainer;

@interface _MSDocumentData : MSModelBase
{
    BOOL _enableLayerInteraction;
    BOOL _enableSliceInteraction;
    unsigned long long _currentPageIndex;
    MSArray *_pages;
    MSAssetCollection *_assets;
    MSSharedLayerStyleContainer *_layerStyles;
    MSSharedLayerContainer *_layerSymbols;
    MSSharedLayerTextStyleContainer *_layerTextStyles;
}


@property(retain, nonatomic) MSAssetCollection *assets; // @synthesize assets=_assets;
- (void)copyPropertiesToObjectCopy:(id)arg1;
@property(nonatomic) unsigned long long currentPageIndex; // @synthesize currentPageIndex=_currentPageIndex;
- (void)decodePropertiesWithCoder:(id)arg1;
@property(nonatomic) BOOL enableLayerInteraction; // @synthesize enableLayerInteraction=_enableLayerInteraction;
@property(nonatomic) BOOL enableSliceInteraction; // @synthesize enableSliceInteraction=_enableSliceInteraction;
- (void)enumerateChildProperties:(CDUnknownBlockType)arg1;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;
- (void)fillInEmptyObjects;
- (BOOL)hasDefaultValues;
- (id)immutableModelObject;
- (void)initEmptyObject;
- (BOOL)isEqualForSync:(id)arg1 asPartOfSymbol:(id)arg2;
@property(retain, nonatomic) MSSharedLayerStyleContainer *layerStyles; // @synthesize layerStyles=_layerStyles;
@property(retain, nonatomic) MSSharedLayerContainer *layerSymbols; // @synthesize layerSymbols=_layerSymbols;
@property(retain, nonatomic) MSSharedLayerTextStyleContainer *layerTextStyles; // @synthesize layerTextStyles=_layerTextStyles;
@property(retain, nonatomic) MSArray *pages; // @synthesize pages=_pages;
- (id)primitiveAssets;
- (unsigned long long)primitiveCurrentPageIndex;
- (BOOL)primitiveEnableLayerInteraction;
- (BOOL)primitiveEnableSliceInteraction;
- (id)primitiveLayerStyles;
- (id)primitiveLayerSymbols;
- (id)primitiveLayerTextStyles;
- (id)primitivePages;
- (void)setAsParentOnChildren;
- (void)setPrimitiveAssets:(id)arg1;
- (void)setPrimitiveCurrentPageIndex:(unsigned long long)arg1;
- (void)setPrimitiveEnableLayerInteraction:(BOOL)arg1;
- (void)setPrimitiveEnableSliceInteraction:(BOOL)arg1;
- (void)setPrimitiveLayerStyles:(id)arg1;
- (void)setPrimitiveLayerSymbols:(id)arg1;
- (void)setPrimitiveLayerTextStyles:(id)arg1;
- (void)setPrimitivePages:(id)arg1;

@end

