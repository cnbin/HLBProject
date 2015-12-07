//
//  ConnectTableViewController.m
//  护林宝
//
//  Created by Apple on 11/6/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "ConnectTableViewController.h"
#import "CoreMediaFuncManagerVC.h"
#import "ChineseString.h"

@interface ConnectTableViewController ()

@property (strong, nonatomic) NSArray * nameArray;  //所有联系人
@property (strong, nonatomic) UISearchBar *mySearchBar;
@property (strong, nonatomic) UISearchDisplayController *searchDisplayController;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (strong, nonatomic) NSArray *indexArray;
@property (strong, nonatomic) NSArray *letterResultArr;
@property (strong, nonatomic) NSMutableDictionary *connectUserDict;

@end

@implementation ConnectTableViewController

#pragma mark - 初始化searchBar

- (void)initSearchBar {
    
    self.mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    self.mySearchBar.delegate = self;
    [self.mySearchBar setPlaceholder:@"快速查询"];
    
    self.searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.mySearchBar contentsController:self];
    self.searchDisplayController.active = NO;
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
    self.tableView.tableHeaderView = self.mySearchBar;

    [self.view addSubview:self.mySearchBar];

}

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"联系人";
    [self initSearchBar];
    
    self.connectUserDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];

    self.indexArray = [ChineseString IndexArray:[self.connectUserDict allKeys]];
    self.letterResultArr = [ChineseString LetterSortArray:[self.connectUserDict allKeys]];
    
    self.nameArray = [NSArray array];
    self.nameArray = [self.connectUserDict allKeys];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return 1;
    }
    else {

        return [self.indexArray count];
    }
}

#pragma mark - 返回对应分组的cell个数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return self.searchResults.count;
    }
    else {
        
        return [[self.letterResultArr objectAtIndex:section] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return nil;
    }
    else {
        
        NSString *key = [self.indexArray objectAtIndex:section];
        return key;
    }
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"fristCell";
    UITableViewCell *cell;
    
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
    
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
      cell.textLabel.text = self.searchResults[indexPath.row];
     
    }
    
    else {
    
      cell.textLabel.text = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        [CoreMediaFuncManagerVC call:[self.connectUserDict objectForKey:self.searchResults[indexPath.row]] inViewController:self failBlock:^{
            NSLog(@"不能打");
        }];
//        NSLog(@"name is %@",self.searchResults[indexPath.row]);
//        NSLog(@"number is %@",[self.connectUserDict objectForKey:self.searchResults[indexPath.row]]);
//        
    } else {
        
        NSLog(@"---->%@",[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:[self.connectUserDict objectForKey:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]]
                                                               delegate:nil
                                                      cancelButtonTitle:@"YES" otherButtonTitles:nil];
        [alert show];

     }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.searchResults = [[NSMutableArray alloc]init];
    if (self.mySearchBar.text.length>0&&![ChineseInclude isIncludeChineseInString:self.mySearchBar.text]) {
        for (int i=0; i<_nameArray.count; i++) {
            if ([ChineseInclude isIncludeChineseInString:_nameArray[i]]) {
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:_nameArray[i]];
                NSRange titleResult=[tempPinYinStr rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.searchResults addObject:_nameArray[i]];
                }
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:_nameArray[i]];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [self.searchResults addObject:_nameArray[i]];
                }
            }
            else {
                NSRange titleResult=[_nameArray[i] rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [self.searchResults addObject:_nameArray[i]];
                }
            }
        }
    } else if (self.mySearchBar.text.length>0&&[ChineseInclude isIncludeChineseInString:self.mySearchBar.text]) {
        for (NSString *tempStr in _nameArray) {
            NSRange titleResult=[tempStr rangeOfString:self.mySearchBar.text options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [self.searchResults addObject:tempStr];
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
