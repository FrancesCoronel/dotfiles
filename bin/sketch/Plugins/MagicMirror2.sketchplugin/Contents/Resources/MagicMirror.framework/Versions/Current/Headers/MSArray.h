//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSModelBase.h"

@interface MSArray : MSModelBase <NSFastEnumeration>

+ (id)array;
+ (id)dataArray;
+ (id)dataArrayWithArray:(id)arg1;
+ (Class)immutableClass;

- (void)addImageOwnersToSet:(id)arg1;
- (void)addObject:(id)arg1;
- (void)addObjectsFromArray:(id)arg1;
@property(readonly, copy, nonatomic) NSArray *array; // @synthesize array;
- (void)breakConnectionWithAllObjects;
- (BOOL)containsObject:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (unsigned long long)count;
- (void)dealloc;
- (void)decodePropertiesWithCoder:(id)arg1;
//@property(nonatomic) __weak id <MSArrayDelegate> delegate; // @synthesize delegate=_delegate;
- (id)description;
- (id)detachAllObjects;
- (void)fillInEmptyObjects;
- (id)firstObject;
- (BOOL)hasDefaultValues;
- (id)immutableModelObject;
- (unsigned long long)indexOfObject:(id)arg1;
- (void)initEmptyObject;
- (id)initWithArray:(id)arg1;
- (id)initWithArray:(id)arg1 lightweight:(BOOL)arg2;
- (void)insertObject:(id)arg1 afterObject:(id)arg2;
- (void)insertObject:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)insertObject:(id)arg1 beforeObject:(id)arg2;
- (BOOL)isEqualForSync:(id)arg1 asPartOfSymbol:(id)arg2;
- (BOOL)isValidIndex:(unsigned long long)arg1;
- (id)lastObject;
- (unsigned long long)length;
- (id)objectAtIndex:(unsigned long long)arg1;
- (id)objectAtIndexOrNil:(unsigned long long)arg1;
- (id)objectAtIndexedSubscript:(unsigned long long)arg1;
- (void)removeAllObjects;
- (void)removeObject:(id)arg1;
- (void)removeObjectAtIndex:(unsigned long long)arg1;
- (void)removeObjectsAtIndexes:(id)arg1;
- (void)removeObjectsInArray:(id)arg1;
- (void)replaceContentsWithArray:(id)arg1;
- (void)replaceObjectAtIndex:(unsigned long long)arg1 withObject:(id)arg2;
- (void)setArray:(id)arg1;
- (void)setAsParentOnChildren;
- (id)treeAsDictionary;
- (NSArray *)layers;

@end

