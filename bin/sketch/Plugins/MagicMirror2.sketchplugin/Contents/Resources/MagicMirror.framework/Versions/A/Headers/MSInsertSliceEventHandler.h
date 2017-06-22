//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSInsertLayerEventHandler.h"

@class MSLayer, NSArray;

@interface MSInsertSliceEventHandler : MSInsertLayerEventHandler
{
    NSArray *_allSlices;
    MSLayer *_hoveringLayer;
}


- (BOOL)absoluteMouseMoved:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)absoluteMouseUp:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (struct CGPoint)alignMouseToGrid:(struct CGPoint)arg1;
@property(retain, nonatomic) NSArray *allSlices; // @synthesize allSlices=_allSlices;
- (void)drawInRect:(struct CGRect)arg1;
- (void)handlerGotFocus;
@property(retain, nonatomic) MSLayer *hoveringLayer; // @synthesize hoveringLayer=_hoveringLayer;
- (id)layersBelowPoint:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (id)toolbarIdentifier;

@end

