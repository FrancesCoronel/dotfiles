//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSEventHandler.h"

@class MSShapeGroup;

@interface MSInsertLineEventHandler : MSEventHandler
{
    CDUnknownBlockType _lineShapeCreator;
    MSShapeGroup *_lineShape;
}


- (BOOL)absoluteMouseDown:(struct CGPoint)arg1 clickCount:(unsigned long long)arg2 flags:(unsigned long long)arg3;
- (BOOL)absoluteMouseDragged:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (void)createShapeAtMouse:(struct CGPoint)arg1;
- (id)defaultCursor;
- (id)findCurrentGroup;
@property(retain, nonatomic) MSShapeGroup *lineShape; // @synthesize lineShape=_lineShape;
@property(copy, nonatomic) CDUnknownBlockType lineShapeCreator; // @synthesize lineShapeCreator=_lineShapeCreator;
- (double)lineThickness;
- (BOOL)mouseMoved:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)mouseUp:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (struct CGPoint)roundMouse:(struct CGPoint)arg1;
- (id)style;

@end
