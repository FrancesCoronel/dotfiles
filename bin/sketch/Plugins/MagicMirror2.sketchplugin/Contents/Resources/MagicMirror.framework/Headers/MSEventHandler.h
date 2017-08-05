//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "CHViewController.h"

#import "MSInspectorChildController.h"
#import "NSDraggingDestination.h"

@class MSDuplicateOffsetTracker, MSEventHandlerManager, NSString;

@interface MSEventHandler : CHViewController <NSDraggingDestination, MSInspectorChildController>

+ (id)eventHandlerWithManager:(id)arg1;

- (void)absoluteDrawInRect:(struct CGRect)arg1;
- (BOOL)absoluteMouseDown:(struct CGPoint)arg1 clickCount:(unsigned long long)arg2 flags:(unsigned long long)arg3;
- (BOOL)absoluteMouseDragged:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)absoluteMouseMoved:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)absoluteMouseUp:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (struct CGPoint)adjustPoint:(struct CGPoint)arg1;
- (struct CGPoint)adjustPoint:(struct CGPoint)arg1 toLayer:(id)arg2;
- (struct CGPoint)alignMouseToGrid:(struct CGPoint)arg1;
- (BOOL)allowsSwitchToInsertAction;
- (BOOL)arrowKeyIsPressed:(unsigned short)arg1;
- (void)beginUndo;
- (BOOL)canDuplicate;
- (struct CGPoint)centerPointForZooming;
- (void)changeColor:(id)arg1;
- (struct CGPoint)convertAbsolutePointFromEvent:(id)arg1;
- (struct CGPoint)convertAbsolutePointFromMouseLocationInWindow:(struct CGPoint)arg1;
- (struct CGPoint)convertPointFromScreenCoordinates:(struct CGPoint)arg1 inGroup:(id)arg2;
- (void)copy:(id)arg1;
- (id)currentGroup;
- (struct CGPoint)currentMousePointInCanvasCoordinates;
- (id)currentPage;
- (void)currentPageDidChange;
- (void)cursorUpdate:(id)arg1;
- (void)cut:(id)arg1;
- (void)dealloc;
- (id)defaultCursor;
- (void)delete:(id)arg1;
- (BOOL)deleteKeyIsPressed:(unsigned short)arg1;
- (void)didUndoNotification:(id)arg1;
- (void)disableUndoNameRegistration;
- (id)dragDropHintForDropOnPoint:(struct CGPoint)arg1;
- (unsigned long long)draggingEntered:(id)arg1;
- (void)draggingExited:(id)arg1;
- (unsigned long long)draggingUpdated:(id)arg1;
- (void)drawHandles;
- (void)drawInRect:(struct CGRect)arg1;
- (void)drawMeasurementsLabelAtMouseForSize:(struct CGSize)arg1;
- (id)drawView;
- (void)duplicate:(id)arg1;
- (id)duplicateLayer:(id)arg1 toIndex:(unsigned long long)arg2 fromDrag:(BOOL)arg3;
- (id)duplicateSelectedLayers:(BOOL)arg1;
- (id)duplicateSelectedLayersInGroup:(id)arg1 fromDrag:(BOOL)arg2;
- (void)editLayer:(id)arg1;
- (void)enableUndoNameRegistration;
- (void)endUndo;
- (BOOL)enterKeyIsPressed:(unsigned short)arg1;
- (BOOL)escapeKeyIsPressed:(unsigned short)arg1;
- (void)flagsChanged:(id)arg1;
- (void)focusOnMainWindow;
- (void)handlerGotFocus;
- (id)handlerName;
- (void)handlerWillLoseFocus;
- (BOOL)handlesHandToolItself;
- (id)horizontalRulerGuidesForGridAlign:(struct CGPoint)arg1;
- (id)imageName;
- (id)initWithManager:(id)arg1;
- (void)insertBacktab:(id)arg1;
- (void)insertTab:(id)arg1;
- (unsigned long long)inspectorLocation;
- (BOOL)inspectorShouldShowBlendingProperties;
- (BOOL)inspectorShouldShowLayerSpecificProperties;
- (BOOL)inspectorShouldShowPositions;
- (BOOL)inspectorShouldShowSharedStyles;
- (void)keyDown:(unsigned short)arg1 flags:(unsigned long long)arg2;
- (void)keyUp:(unsigned short)arg1 flags:(unsigned long long)arg2;
- (id)lastEvent;
- (void)layerPositionPossiblyChanged;
- (void)layerRulerOriginChanged;
- (id)layersToCopy;
@property(nonatomic) __weak MSEventHandlerManager *manager; // @synthesize manager=_manager;
- (id)menuForEvent:(id)arg1;
- (struct CGPoint)mouseCappedInViewCoordinatesWithMargin:(struct CGSize)arg1;
- (BOOL)mouseDown:(struct CGPoint)arg1 clickCount:(unsigned long long)arg2 flags:(unsigned long long)arg3;
- (BOOL)mouseDownEvent:(id)arg1;
- (BOOL)mouseDragged:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)mouseDraggedEvent:(id)arg1;
- (BOOL)mouseDraggedOutsideViewShouldMoveScrollOrigin;
- (void)mouseExited;
- (struct CGPoint)mouseInScreenCoordinates;
- (BOOL)mouseMoved:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)mouseMovedEvent:(id)arg1;
- (BOOL)mouseUp:(struct CGPoint)arg1 flags:(unsigned long long)arg2;
- (BOOL)mouseUpEvent:(id)arg1;
- (id)nibName;
- (double)nudgeDistanceForFlags:(unsigned long long)arg1;
@property(retain, nonatomic) MSDuplicateOffsetTracker *offsetTracker; // @synthesize offsetTracker=_offsetTracker;
- (void)paste:(id)arg1;
- (void)pasteHere:(id)arg1;
- (void)pasteOverSelection:(id)arg1;
- (id)pastingViewPort;
- (BOOL)performDragOperation:(id)arg1;
- (void)prepareForDisplay;
- (BOOL)prepareForDragOperation:(id)arg1;
@property(copy, nonatomic) NSString *pressedKeys; // @synthesize pressedKeys=_pressedKeys;
- (void)readFromPasteboard:(id)arg1;
- (void)redo;
- (void)refreshMeasurementsLabel;
- (void)refreshRulers;
- (void)refreshViewsWithMask:(unsigned long long)arg1;
- (void)returnToDefaultHandler;
- (void)returnToDefaultHandlerByClickingOutside;
- (void)rightMouseDown:(id)arg1;
- (struct CGRect)rulerGuidesRectAroundMouse:(struct CGPoint)arg1;
- (BOOL)scrollEventShouldExitHandler:(id)arg1;
@property(nonatomic) struct CGPoint scrollOrigin; // @dynamic scrollOrigin;
- (void)selectAll:(id)arg1;
- (void)selectToolbarItemWithIdentifier:(id)arg1;
- (id)selectedLayers;
- (id)selectedLayersA;
- (struct CGRect)selectedRect;
- (void)selectionDidChangeTo:(id)arg1;
@property(nonatomic) struct CGPoint viewCoordinateMouse; // @synthesize viewCoordinateMouse=_viewCoordinateMouse;
- (BOOL)shouldDrawLayerSelection;
- (BOOL)shouldFitToPixelBounds;
- (BOOL)shouldHideExportBar;
- (id)toolbarIdentifier;
- (void)undo;
- (id)undoManager;
- (void)undoNotification:(id)arg1;
- (id)valueForUndefinedKey:(id)arg1;
- (id)verticalRulerGuidesForGridAlign:(struct CGPoint)arg1;
- (id)view;
- (void)viewDidScroll:(id)arg1;
- (id)views;
- (void)willPerformUndo;
- (void)willResignFirstResponder;
- (void)windowDidResize:(id)arg1;
- (void)writeLayers:(id)arg1 toPasteboard:(id)arg2;
- (struct CGPoint)zoomPoint:(struct CGPoint)arg1;
- (double)zoomValue;
- (void)zoomValueDidChange;
- (void)zoomValueWillChangeTo:(double)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

