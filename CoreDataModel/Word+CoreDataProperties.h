//
//  Word+CoreDataProperties.h
//  护林宝
//
//  Created by Apple on 11/23/15.
//  Copyright © 2015 cnbin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Word.h"

NS_ASSUME_NONNULL_BEGIN

@interface Word (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *pinyin;
@property (nullable, nonatomic, retain) NSString *zhongwen;

@end

NS_ASSUME_NONNULL_END
