//
//  Notification+CoreDataProperties.h
//  护林宝
//
//  Created by Apple on 11/24/15.
//  Copyright © 2015 cnbin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Notification.h"

NS_ASSUME_NONNULL_BEGIN

@interface Notification (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;

@end

NS_ASSUME_NONNULL_END
