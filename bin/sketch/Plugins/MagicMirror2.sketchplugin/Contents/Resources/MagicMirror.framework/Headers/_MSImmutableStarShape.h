//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSImmutableCustomShapeLayer.h"

@interface _MSImmutableStarShape : MSImmutableCustomShapeLayer
{
    long long _numberOfPoints;
    double _radius;
}

- (void)decodePropertiesWithCoder:(id)arg1;
- (void)encodePropertiesWithCoder:(id)arg1;
- (void)enumerateChildProperties:(CDUnknownBlockType)arg1;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;
- (BOOL)hasDefaultValues;
- (id)initWithMutableModelObject:(id)arg1;
@property(nonatomic) long long numberOfPoints; // @synthesize numberOfPoints=_numberOfPoints;
@property(nonatomic) double radius; // @synthesize radius=_radius;

@end

