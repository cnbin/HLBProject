//
//  AppDelegate.m
//  护林宝
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "NotificationTableViewController.h"
#import "SettingViewController.h"

#import "Word.h"
#import "NSString+URLEncoding.h"
#import "AFNetworking.h"
#import "PinYin4Objc.h"
#import "Notification.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@property (strong, nonatomic) UITabBarController * tabBarController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self tabBar];
    [self.window makeKeyAndVisible];
    
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"HLBao.sqlite"];
   
    [self initNotification];
    
    BOOL isconnectPeople = [[NSUserDefaults standardUserDefaults] boolForKey:@"key_isConnectPeople"];
    
    if (isconnectPeople) {
        
    }
    
    else
    {
       [self connectPeople];
    }
    
    return YES;
}

#pragma mark - 初始化远程化通知

- (void)initNotification {
    
    UIUserNotificationType myTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

}

#pragma mark - 此方法是用户点击了通知，应用在 前台 或者 开启后台 并且应用在 后台 时调起

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    completionHandler(UIBackgroundFetchResultNewData);
    
    NSLog(@"活跃状态下的远程推送");
    
    Notification * notification = [Notification MR_createEntity];
    notification.content = userInfo[@"aps"][@"alert"];

    NSLog(@"noti content is %@",notification.content);

    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到一条消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
}

#pragma mark - 处理收到的消息推送

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    NSLog(@"接收到远程推送");
    
    Notification * notification = [Notification MR_createEntity];
    notification.content = userInfo[@"aps"][@"alert"];
    
    NSLog(@"noti content is %@",notification.content);
    
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到一条消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alertView show];
    
}

#pragma mark - 在 iOS8 系统中，还需要添加这个方法。通过新的 API 注册推送服务

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

#pragma mark - 获取DeviceToken成功

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
//    NSLog(@"DeviceToken: {%@}",deviceToken);
//    //这里进行的操作，是将Device Token发送到服务端
//    
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"DeviceToken:%@",deviceToken] delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    [alert show];
}

#pragma mark - 注册消息推送失败

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Register Remote Notifications error:{%@}",error);
}

#pragma mark - 获取服务端通讯录列表

- (void)connectPeople {
    
        NSString *url = [webserviceURL stringByAppendingString:@"/GetUsers?"];
        NSString *k_initUrl3 =[url stringByAppendingFormat:@"iPageNo=%d",1];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:k_initUrl3] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
        
        AFHTTPRequestOperation *operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *html = operation.responseString;
            
            //将返回字符串头去掉：<?xml version=\"1.0\" encoding=\"utf-8\"?>
            NSString *str =@"<?xml version=\"1.0\" encoding=\"utf-8\"?>";
            NSString *strhtml =[html stringByReplacingOccurrencesOfString:str withString:@""];
            //将返回字符串头去掉
            strhtml = [strhtml stringByReplacingOccurrencesOfString:@"<string xmlns=\"http://tempuri.org/\">" withString:@""];
            //将返回的字符串尾去掉
            strhtml = [strhtml stringByReplacingOccurrencesOfString:@"</string>" withString:@""];
            //去掉结尾空格
            NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            strhtml= [[NSString alloc]initWithString:[strhtml stringByTrimmingCharactersInSet:whiteSpace]];
            
            NSError *error;
            NSData *data =[strhtml dataUsingEncoding:NSUTF8StringEncoding];
            self.jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            for (int i=0; i<self.jsonArray.count; i++) {
                
                NSString *sourceText=[[self.jsonArray objectAtIndex:i]objectForKey:@"TrueName"];

                HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
                [outputFormat setToneType:ToneTypeWithoutTone];
                [outputFormat setVCharType:VCharTypeWithV];
                [outputFormat setCaseType:CaseTypeLowercase];
                NSString *outputPinyin=[PinyinHelper toHanyuPinyinStringWithNSString:sourceText withHanyuPinyinOutputFormat:outputFormat withNSString:@" "];
             
                Word * word = [Word MR_createEntity];
                word.pinyin = outputPinyin;
                word.zhongwen = sourceText;
   
                [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
                
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        [operation start];
    
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key_isConnectPeople"];
        [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)tabBar {
    
    MenuViewController * menuViewController = [[MenuViewController alloc]init];
    UINavigationController * menuNavigationController = [[UINavigationController alloc]initWithRootViewController:menuViewController];
    
    NotificationTableViewController * notificationTableViewController = [[NotificationTableViewController alloc]init];
    UINavigationController * notificationTableViewNavigationController =[[UINavigationController alloc]initWithRootViewController:notificationTableViewController];
    
    SettingViewController * settingViewController = [[SettingViewController alloc]init];
    UINavigationController * settingViewNavigationController = [[UINavigationController alloc]initWithRootViewController:settingViewController];
    
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.delegate = self;//实现委托切记要写这句委托对象
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:menuNavigationController,notificationTableViewNavigationController,settingViewNavigationController,nil];
    
    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
    self.tabBarController.tabBar.barTintColor = SystemThemeColor;
    [self.tabBarController.tabBar setTranslucent:NO];
    
    menuNavigationController.tabBarItem.title = @"首页";
    menuNavigationController.tabBarItem.image = [UIImage imageNamed:@"home"];
    
    notificationTableViewNavigationController.tabBarItem.title = @"通知";
    notificationTableViewNavigationController.tabBarItem.image = [UIImage imageNamed:@"discover"];
    
    settingViewNavigationController.tabBarItem.title = @"设置";
    settingViewNavigationController.tabBarItem.image = [UIImage imageNamed:@"home"];
    
    self.window.rootViewController = self.tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
