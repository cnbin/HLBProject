//
//  AppDelegate.h
//  护林宝
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIStoryboard *storyBoard;
@property (strong, nonatomic) NSArray *jsonArray; //获取通讯录列表JSON数组

@end

