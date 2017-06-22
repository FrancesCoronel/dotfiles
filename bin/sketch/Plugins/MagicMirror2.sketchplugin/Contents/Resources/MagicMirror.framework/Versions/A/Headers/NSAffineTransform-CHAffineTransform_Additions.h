//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSAffineTransform.h"

@interface NSAffineTransform (CHAffineTransform_Additions)
+ (id)rotationTransformWithDegrees:(double)arg1 aroundPoint:(struct CGPoint)arg2;
+ (id)transformByScaling:(double)arg1;
+ (id)transformByTranslatingXBy:(double)arg1 yBy:(double)arg2;
+ (id)transformFromStruct:(struct _CHTransformStruct)arg1 aroundPoint:(struct CGPoint)arg2;
+ (id)transformFromStruct:(struct _CHTransformStruct)arg1 aroundPoint:(struct CGPoint)arg2 inPlace:(BOOL)arg3;
+ (id)transformWithOffset:(struct CGPoint)arg1;
- (struct CGAffineTransform)CGAffineTransform;
- (id)invertedTransform;
- (void)rotateWithDegrees:(double)arg1 aroundPoint:(struct CGPoint)arg2;
- (void)transactionWithBlock:(CDUnknownBlockType)arg1;
- (void)translateByOffset:(struct CGPoint)arg1;
@end

