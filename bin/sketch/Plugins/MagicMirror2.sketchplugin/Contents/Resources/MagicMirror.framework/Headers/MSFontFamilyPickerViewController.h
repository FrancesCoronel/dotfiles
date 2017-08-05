//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSViewController.h"

#import "BCPopoverContentController.h"
#import "NSTableViewDataSource.h"
#import "NSTableViewDelegate.h"

@class MSFontList, NSString, NSTableView;

@interface MSFontFamilyPickerViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource, BCPopoverContentController>
{
    CDUnknownBlockType _completionBlock;
    MSFontList *_fontList;
    NSTableView *_tableView;
}


- (void)awakeFromNib;
@property(copy, nonatomic) CDUnknownBlockType completionBlock; // @synthesize completionBlock=_completionBlock;
- (void)controlTextDidChange:(id)arg1;
- (void)doubleClickTableView:(id)arg1;
@property(retain, nonatomic) MSFontList *fontList; // @synthesize fontList=_fontList;
- (id)init;
- (long long)numberOfRowsInTableView:(id)arg1;
@property(nonatomic) __weak NSTableView *tableView; // @synthesize tableView=_tableView;
- (double)tableView:(id)arg1 heightOfRow:(long long)arg2;
- (BOOL)tableView:(id)arg1 shouldSelectRow:(long long)arg2;
- (id)tableView:(id)arg1 viewForTableColumn:(id)arg2 row:(long long)arg3;
- (void)tableViewSelectionDidChange:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

