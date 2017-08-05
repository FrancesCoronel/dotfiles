//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class FBBezierContour, FBBezierCurve, FBBezierGraph;

@interface FBCurveLocation : NSObject
{
    FBBezierGraph *_graph;
    FBBezierContour *_contour;
    FBBezierCurve *_edge;
    double _parameter;
    double _distance;
}

+ (id)curveLocationWithEdge:(id)arg1 parameter:(double)arg2 distance:(double)arg3;

@property(retain, nonatomic) FBBezierContour *contour; // @synthesize contour=_contour;
@property(readonly, nonatomic) double distance; // @synthesize distance=_distance;
@property(readonly, nonatomic) FBBezierCurve *edge; // @synthesize edge=_edge;
@property(retain, nonatomic) FBBezierGraph *graph; // @synthesize graph=_graph;
- (id)initWithEdge:(id)arg1 parameter:(double)arg2 distance:(double)arg3;
@property(readonly, nonatomic) double parameter; // @synthesize parameter=_parameter;

@end

