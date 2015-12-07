//
//  GlobalResource.h
//  护林宝
//
//  Created by Apple on 11/7/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalResource : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic)NSMutableArray * notificationArray;

@property (strong, nonatomic)NSArray * notificationContentArray;

@end
