//
//  ConnectTableViewController.h
//  护林宝
//
//  Created by Apple on 11/6/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"

@interface ConnectTableViewController : UITableViewController<NSXMLParserDelegate,NSURLConnectionDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate> 

@end
