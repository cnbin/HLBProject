//
//  ConnectTableViewController.m
//  护林宝
//
//  Created by Apple on 11/6/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "ConnectTableViewController.h"
#import "CoreMediaFuncManagerVC.h"

@interface ConnectTableViewController ()

@property (strong, nonatomic) NSMutableDictionary * dict;
@property (strong, nonatomic) NSArray * wordArray;

@property (strong, nonatomic) NSMutableArray * azhongwenArray;
@property (strong, nonatomic) NSMutableArray * bzhongwenArray;
@property (strong, nonatomic) NSMutableArray * czhongwenArray;
@property (strong, nonatomic) NSMutableArray * dzhongwenArray;
@property (strong, nonatomic) NSMutableArray * ezhongwenArray;
@property (strong, nonatomic) NSMutableArray * fzhongwenArray;
@property (strong, nonatomic) NSMutableArray * gzhongwenArray;
@property (strong, nonatomic) NSMutableArray * hzhongwenArray;
@property (strong, nonatomic) NSMutableArray * izhongwenArray;
@property (strong, nonatomic) NSMutableArray * jzhongwenArray;
@property (strong, nonatomic) NSMutableArray * kzhongwenArray;
@property (strong, nonatomic) NSMutableArray * lzhongwenArray;
@property (strong, nonatomic) NSMutableArray * mzhongwenArray;
@property (strong, nonatomic) NSMutableArray * nzhongwenArray;
@property (strong, nonatomic) NSMutableArray * ozhongwenArray;
@property (strong, nonatomic) NSMutableArray * pzhongwenArray;
@property (strong, nonatomic) NSMutableArray * qzhongwenArray;
@property (strong, nonatomic) NSMutableArray * rzhongwenArray;
@property (strong, nonatomic) NSMutableArray * szhongwenArray;
@property (strong, nonatomic) NSMutableArray * tzhongwenArray;
@property (strong, nonatomic) NSMutableArray * uzhongwenArray;
@property (strong, nonatomic) NSMutableArray * vzhongwenArray;
@property (strong, nonatomic) NSMutableArray * wzhongwenArray;
@property (strong, nonatomic) NSMutableArray * xzhongwenArray;
@property (strong, nonatomic) NSMutableArray * yzhongwenArray;
@property (strong, nonatomic) NSMutableArray * zzhongwenArray;

@property (strong, nonatomic) NSArray *listGroupname;  //排序后的组名，A，B 。。。
@property (strong, nonatomic) NSMutableArray * nameArray;  //所有联系人
@property (strong, nonatomic) UISearchBar *mySearchBar;
@property (strong, nonatomic) UISearchDisplayController *searchDisplayController;
@property (strong, nonatomic) NSMutableArray *searchResults;

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

#pragma mark - 初始化联系人列表

- (void)initWord {
    
    self.nameArray = [NSMutableArray array];
    self.wordArray = [Word MR_findAll];
    
    for (Word * word in self.wordArray) {
        NSLog(@"zhongwen is %@",word.zhongwen);
        NSLog(@"pinyin is %@",word.pinyin);
        [self.nameArray addObject:word.zhongwen];
    }
    
    NSLog(@"word is %@",self.nameArray);
    
    self.dict = [NSMutableDictionary dictionary];
    
    self.azhongwenArray = [NSMutableArray array];
    self.bzhongwenArray = [NSMutableArray array];
    self.czhongwenArray = [NSMutableArray array];
    self.dzhongwenArray = [NSMutableArray array];
    self.ezhongwenArray = [NSMutableArray array];
    self.fzhongwenArray = [NSMutableArray array];
    self.gzhongwenArray = [NSMutableArray array];
    self.hzhongwenArray = [NSMutableArray array];
    self.izhongwenArray = [NSMutableArray array];
    self.jzhongwenArray = [NSMutableArray array];
    self.kzhongwenArray = [NSMutableArray array];
    self.lzhongwenArray = [NSMutableArray array];
    self.mzhongwenArray = [NSMutableArray array];
    self.nzhongwenArray = [NSMutableArray array];
    self.ozhongwenArray = [NSMutableArray array];
    self.pzhongwenArray = [NSMutableArray array];
    self.qzhongwenArray = [NSMutableArray array];
    self.rzhongwenArray = [NSMutableArray array];
    self.szhongwenArray = [NSMutableArray array];
    self.tzhongwenArray = [NSMutableArray array];
    self.uzhongwenArray = [NSMutableArray array];
    self.vzhongwenArray = [NSMutableArray array];
    self.wzhongwenArray = [NSMutableArray array];
    self.xzhongwenArray = [NSMutableArray array];
    self.yzhongwenArray = [NSMutableArray array];
    self.zzhongwenArray = [NSMutableArray array];
    
    //A
    NSPredicate *apre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'a'"];
    NSFetchRequest *aRequest = [Word MR_requestAllWithPredicate:apre];
    [aRequest setReturnsDistinctResults:NO];
    NSArray * aArray = [Word MR_executeFetchRequest:aRequest];
    
    for (Word * word in aArray) {
        
        [self.azhongwenArray addObject:word.zhongwen];
    }
    
    //B
    NSPredicate *bpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'b'"];
    NSFetchRequest *bRequest = [Word MR_requestAllWithPredicate:bpre];
    [bRequest setReturnsDistinctResults:NO];
    NSArray * bArray = [Word MR_executeFetchRequest:bRequest];
    
    for (Word * word in bArray) {
        
        [self.bzhongwenArray addObject:word.zhongwen];
    }
    
    //C
    NSPredicate *cpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'c'"];
    NSFetchRequest *cRequest = [Word MR_requestAllWithPredicate:cpre];
    [cRequest setReturnsDistinctResults:NO];
    NSArray * cArray = [Word MR_executeFetchRequest:cRequest];
    
    for (Word * word in cArray) {
        
        [self.czhongwenArray addObject:word.zhongwen];
    }
    
    //D
    NSPredicate *dpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'd'"];
    NSFetchRequest *dRequest = [Word MR_requestAllWithPredicate:dpre];
    [dRequest setReturnsDistinctResults:NO];
    NSArray * dArray = [Word MR_executeFetchRequest:dRequest];
    
    for (Word * word in dArray) {
        
        [self.dzhongwenArray addObject:word.zhongwen];
    }
    
    //E
    NSPredicate *epre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'e'"];
    NSFetchRequest *eRequest = [Word MR_requestAllWithPredicate:epre];
    [eRequest setReturnsDistinctResults:NO];
    NSArray * eArray = [Word MR_executeFetchRequest:eRequest];
    
    for (Word * word in eArray) {
        
        [self.ezhongwenArray addObject:word.zhongwen];
    }
    
    //F
    NSPredicate *fpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'f'"];
    NSFetchRequest *fRequest = [Word MR_requestAllWithPredicate:fpre];
    [fRequest setReturnsDistinctResults:NO];
    NSArray * fArray = [Word MR_executeFetchRequest:fRequest];
    
    for (Word * word in fArray) {
        
        [self.fzhongwenArray addObject:word.zhongwen];
    }
    
    //G
    NSPredicate *gpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'g'"];
    NSFetchRequest *gRequest = [Word MR_requestAllWithPredicate:gpre];
    [aRequest setReturnsDistinctResults:NO];
    NSArray * gArray = [Word MR_executeFetchRequest:gRequest];
    
    for (Word * word in gArray) {
        
        [self.gzhongwenArray addObject:word.zhongwen];
    }
    
    //H
    NSPredicate *hpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'h'"];
    NSFetchRequest *hRequest = [Word MR_requestAllWithPredicate:hpre];
    [hRequest setReturnsDistinctResults:NO];
    NSArray * hArray = [Word MR_executeFetchRequest:hRequest];
    
    for (Word * word in hArray) {
        
        [self.hzhongwenArray addObject:word.zhongwen];
    }
    
    //I
    NSPredicate *ipre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'i'"];
    NSFetchRequest *iRequest = [Word MR_requestAllWithPredicate:ipre];
    [iRequest setReturnsDistinctResults:NO];
    NSArray * iArray = [Word MR_executeFetchRequest:iRequest];
    
    for (Word * word in iArray) {
        
        [self.izhongwenArray addObject:word.zhongwen];
    }
    
    //J
    NSPredicate *jpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'j'"];
    NSFetchRequest *jRequest = [Word MR_requestAllWithPredicate:jpre];
    [jRequest setReturnsDistinctResults:NO];
    NSArray * jArray = [Word MR_executeFetchRequest:jRequest];
    
    for (Word * word in jArray) {
        
        [self.jzhongwenArray addObject:word.zhongwen];
    }
    
    //K
    NSPredicate *kpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'k'"];
    NSFetchRequest *kRequest = [Word MR_requestAllWithPredicate:kpre];
    [kRequest setReturnsDistinctResults:NO];
    NSArray * kArray = [Word MR_executeFetchRequest:kRequest];
    
    for (Word * word in kArray) {
        
        [self.kzhongwenArray addObject:word.zhongwen];
    }
    
    //L
    NSPredicate *lpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'l'"];
    NSFetchRequest *lRequest = [Word MR_requestAllWithPredicate:lpre];
    [lRequest setReturnsDistinctResults:NO];
    NSArray * lArray = [Word MR_executeFetchRequest:fRequest];
    NSLog(@"larray is %@",lArray);
    for (Word * word in lArray) {
        
        [self.lzhongwenArray addObject:word.zhongwen];
    }
    
    //M
    NSPredicate *mpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'm'"];
    NSFetchRequest *mRequest = [Word MR_requestAllWithPredicate:mpre];
    [mRequest setReturnsDistinctResults:NO];
    NSArray * mArray = [Word MR_executeFetchRequest:mRequest];
    
    for (Word * word in mArray) {
        
        [self.mzhongwenArray addObject:word.zhongwen];
    }
    
    //N
    NSPredicate *npre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'n'"];
    NSFetchRequest *nRequest = [Word MR_requestAllWithPredicate:npre];
    [nRequest setReturnsDistinctResults:NO];
    NSArray * nArray = [Word MR_executeFetchRequest:nRequest];
    
    for (Word * word in nArray) {
        
        [self.nzhongwenArray addObject:word.zhongwen];
    }

    //O
    NSPredicate *opre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'o'"];
    NSFetchRequest *oRequest = [Word MR_requestAllWithPredicate:opre];
    [oRequest setReturnsDistinctResults:NO];
    NSArray * oArray = [Word MR_executeFetchRequest:oRequest];
    
    for (Word * word in oArray) {
        
        [self.ozhongwenArray addObject:word.zhongwen];
    }
    
    //P
    NSPredicate *ppre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'p'"];
    NSFetchRequest *pRequest = [Word MR_requestAllWithPredicate:ppre];
    [pRequest setReturnsDistinctResults:NO];
    NSArray * pArray = [Word MR_executeFetchRequest:pRequest];
    
    for (Word * word in pArray) {
        
        [self.pzhongwenArray addObject:word.zhongwen];
    }
    
    //Q
    NSPredicate *qpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'q'"];
    NSFetchRequest *qRequest = [Word MR_requestAllWithPredicate:qpre];
    [qRequest setReturnsDistinctResults:NO];
    NSArray * qArray = [Word MR_executeFetchRequest:qRequest];
    
    for (Word * word in qArray) {
        
        [self.qzhongwenArray addObject:word.zhongwen];
    }

    //R
    NSPredicate *rpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'r'"];
    NSFetchRequest *rRequest = [Word MR_requestAllWithPredicate:rpre];
    [rRequest setReturnsDistinctResults:NO];
    NSArray * rArray = [Word MR_executeFetchRequest:rRequest];
    
    for (Word * word in rArray) {
        
        [self.rzhongwenArray addObject:word.zhongwen];
    }
    
    //S
    NSPredicate *spre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 's'"];
    NSFetchRequest *sRequest = [Word MR_requestAllWithPredicate:spre];
    [sRequest setReturnsDistinctResults:NO];
    NSArray * sArray = [Word MR_executeFetchRequest:sRequest];
    
    for (Word * word in sArray) {
        
        [self.szhongwenArray addObject:word.zhongwen];
    }
    
    //T
    NSPredicate *tpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 't'"];
    NSFetchRequest *tRequest = [Word MR_requestAllWithPredicate:tpre];
    [tRequest setReturnsDistinctResults:NO];
    NSArray * tArray = [Word MR_executeFetchRequest:tRequest];
    
    for (Word * word in tArray) {
        
        [self.tzhongwenArray addObject:word.zhongwen];
    }
    
    //U
    NSPredicate *upre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'u'"];
    NSFetchRequest *uRequest = [Word MR_requestAllWithPredicate:upre];
    [uRequest setReturnsDistinctResults:NO];
    NSArray * uArray = [Word MR_executeFetchRequest:uRequest];
    
    for (Word * word in uArray) {
        
        [self.uzhongwenArray addObject:word.zhongwen];
    }
    
    //V
    NSPredicate *vpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'v'"];
    NSFetchRequest *vRequest = [Word MR_requestAllWithPredicate:vpre];
    [vRequest setReturnsDistinctResults:NO];
    NSArray * vArray = [Word MR_executeFetchRequest:vRequest];
    
    for (Word * word in vArray) {
        
        [self.vzhongwenArray addObject:word.zhongwen];
    }
    
    //W
    NSPredicate *wpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'w'"];
    NSFetchRequest *wRequest = [Word MR_requestAllWithPredicate:wpre];
    [wRequest setReturnsDistinctResults:NO];
    NSArray * wArray = [Word MR_executeFetchRequest:wRequest];
    
    for (Word * word in wArray) {
        
        [self.wzhongwenArray addObject:word.zhongwen];
    }
    
    //X
    NSPredicate *xpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'x'"];
    NSFetchRequest *xRequest = [Word MR_requestAllWithPredicate:xpre];
    [xRequest setReturnsDistinctResults:NO];
    NSArray * xArray = [Word MR_executeFetchRequest:xRequest];
    
    for (Word * word in xArray) {
        
        [self.xzhongwenArray addObject:word.zhongwen];
    }
    
    //Y
    NSPredicate *ypre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'y'"];
    NSFetchRequest *yRequest = [Word MR_requestAllWithPredicate:ypre];
    [yRequest setReturnsDistinctResults:NO];
    NSArray * yArray = [Word MR_executeFetchRequest:yRequest];
    
    
    for (Word * word in yArray) {
        
        [self.yzhongwenArray addObject:word.zhongwen];
    }
    
    //Z
    NSPredicate *zpre = [NSPredicate predicateWithFormat:@"pinyin BEGINSWITH 'z'"];
    NSFetchRequest *zRequest = [Word MR_requestAllWithPredicate:zpre];
    [zRequest setReturnsDistinctResults:NO];
    NSArray * zArray = [Word MR_executeFetchRequest:zRequest];
    
    for (Word * word in zArray) {
        
        [self.zzhongwenArray addObject:word.zhongwen];
    }
    
    if (self.azhongwenArray != nil && ![self.azhongwenArray isKindOfClass:[NSNull class]] && self.azhongwenArray.count != 0) {
        
        [self.dict setObject:self.azhongwenArray forKey:@"A"];
    }
    
    if (self.bzhongwenArray != nil && ![self.bzhongwenArray isKindOfClass:[NSNull class]] && self.bzhongwenArray.count != 0) {
        
        [self.dict setObject:self.bzhongwenArray forKey:@"B"];
    }
    
    if (self.czhongwenArray != nil && ![self.czhongwenArray isKindOfClass:[NSNull class]] && self.czhongwenArray.count != 0) {
        
        [self.dict setObject:self.czhongwenArray forKey:@"C"];
    }
    
    if (self.dzhongwenArray != nil && ![self.dzhongwenArray isKindOfClass:[NSNull class]] && self.dzhongwenArray.count != 0) {
        
        [self.dict setObject:self.dzhongwenArray forKey:@"D"];
    }
    
    if (self.ezhongwenArray != nil && ![self.ezhongwenArray isKindOfClass:[NSNull class]] && self.ezhongwenArray.count != 0) {
        
        [self.dict setObject:self.ezhongwenArray forKey:@"E"];
    }
    
    if (self.fzhongwenArray != nil && ![self.fzhongwenArray isKindOfClass:[NSNull class]] && self.fzhongwenArray.count != 0) {
        
        [self.dict setObject:self.fzhongwenArray forKey:@"F"];
    }
    
    if (self.gzhongwenArray != nil && ![self.gzhongwenArray isKindOfClass:[NSNull class]] && self.gzhongwenArray.count != 0) {
        
        [self.dict setObject:self.gzhongwenArray forKey:@"G"];
    }
    
    if (self.hzhongwenArray != nil && ![self.hzhongwenArray isKindOfClass:[NSNull class]] && self.hzhongwenArray.count != 0) {
        
        [self.dict setObject:self.hzhongwenArray forKey:@"H"];
    }
    
    if (self.izhongwenArray != nil && ![self.izhongwenArray isKindOfClass:[NSNull class]] && self.izhongwenArray.count != 0) {
        
        [self.dict setObject:self.izhongwenArray forKey:@"I"];
    }
    
    if (self.jzhongwenArray != nil && ![self.jzhongwenArray isKindOfClass:[NSNull class]] && self.jzhongwenArray.count != 0) {
        
        [self.dict setObject:self.jzhongwenArray forKey:@"J"];
    }
    
    if (self.kzhongwenArray != nil && ![self.kzhongwenArray isKindOfClass:[NSNull class]] && self.kzhongwenArray.count != 0) {
        
        [self.dict setObject:self.kzhongwenArray forKey:@"K"];
    }
    
    if (self.lzhongwenArray != nil && ![self.lzhongwenArray isKindOfClass:[NSNull class]] && self.lzhongwenArray.count != 0) {
        
        [self.dict setObject:self.lzhongwenArray forKey:@"L"];
    }
 
    
    if (self.mzhongwenArray != nil && ![self.mzhongwenArray isKindOfClass:[NSNull class]] && self.mzhongwenArray.count != 0) {
        
        [self.dict setObject:self.mzhongwenArray forKey:@"M"];
    }
    
    if (self.nzhongwenArray != nil && ![self.nzhongwenArray isKindOfClass:[NSNull class]] && self.nzhongwenArray.count != 0) {
        
        [self.dict setObject:self.nzhongwenArray forKey:@"N"];
    }
    
    if (self.ozhongwenArray != nil && ![self.ozhongwenArray isKindOfClass:[NSNull class]] && self.ozhongwenArray.count != 0) {
        
        [self.dict setObject:self.ozhongwenArray forKey:@"O"];
    }
    
    if (self.pzhongwenArray != nil && ![self.pzhongwenArray isKindOfClass:[NSNull class]] && self.pzhongwenArray.count != 0) {
        
        [self.dict setObject:self.pzhongwenArray forKey:@"P"];
    }
    
    if (self.qzhongwenArray != nil && ![self.qzhongwenArray isKindOfClass:[NSNull class]] && self.izhongwenArray.count != 0) {
        
        [self.dict setObject:self.qzhongwenArray forKey:@"Q"];
    }
    
    if (self.rzhongwenArray != nil && ![self.rzhongwenArray isKindOfClass:[NSNull class]] && self.rzhongwenArray.count != 0) {
        
        [self.dict setObject:self.rzhongwenArray forKey:@"R"];
    }
    
    if (self.szhongwenArray != nil && ![self.szhongwenArray isKindOfClass:[NSNull class]] && self.szhongwenArray.count != 0) {
        
        [self.dict setObject:self.szhongwenArray forKey:@"S"];
    }
    
    if (self.tzhongwenArray != nil && ![self.tzhongwenArray isKindOfClass:[NSNull class]] && self.tzhongwenArray.count != 0) {
        
        [self.dict setObject:self.tzhongwenArray forKey:@"T"];
    }
    
    if (self.uzhongwenArray != nil && ![self.uzhongwenArray isKindOfClass:[NSNull class]] && self.uzhongwenArray.count != 0) {
        
        [self.dict setObject:self.uzhongwenArray forKey:@"U"];
    }
    
    if (self.vzhongwenArray != nil && ![self.vzhongwenArray isKindOfClass:[NSNull class]] && self.vzhongwenArray.count != 0) {
        
        [self.dict setObject:self.vzhongwenArray forKey:@"V"];
    }
    
    if (self.wzhongwenArray != nil && ![self.wzhongwenArray isKindOfClass:[NSNull class]] && self.wzhongwenArray.count != 0) {
        
        [self.dict setObject:self.wzhongwenArray forKey:@"W"];
    }
    
    if (self.xzhongwenArray != nil && ![self.xzhongwenArray isKindOfClass:[NSNull class]] && self.xzhongwenArray.count != 0) {
        
        [self.dict setObject:self.xzhongwenArray forKey:@"X"];
    }
    
    if (self.yzhongwenArray != nil && ![self.yzhongwenArray isKindOfClass:[NSNull class]] && self.yzhongwenArray.count != 0) {
        
        [self.dict setObject:self.yzhongwenArray forKey:@"Y"];
    }
    
    if (self.zzhongwenArray != nil && ![self.zzhongwenArray isKindOfClass:[NSNull class]] && self.zzhongwenArray.count != 0) {
        
        [self.dict setObject:self.zzhongwenArray forKey:@"Z"];
    }
    
    NSArray *tempList  = [self.dict allKeys];
    NSLog(@"self.dict is %@",self.dict);
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"self.listGroupgameis %@",self.listGroupname);
}

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"联系人";
    
    [self initSearchBar];
    [self initWord];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return 1;
    }
    else {
        
        return self.dict.count;
    }

}

#pragma mark - 返回对应分组的cell个数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return self.searchResults.count;
    }
    else {
        
        //按照节索引从小组名数组中获得组名
        NSString *groupName = [self.listGroupname objectAtIndex:section];
        //按照组名做为key，从字典中取出球队数组集合
        NSArray *listTeams = [self.dict objectForKey:groupName];
        NSLog(@"listTeamscount is %lu",(unsigned long)[listTeams count]);
        return [listTeams count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return nil;
    }
    
    else {
        
        NSString *groupName = [self.listGroupname objectAtIndex:section];
        return groupName;
    }
}

#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"fristCell";
    UITableViewCell *cell;
    
//    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if (cell == nil) {
    
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        cell.textLabel.text = self.searchResults[indexPath.row];
  
    }
    
    else {
        
        //获得选择的节
        NSUInteger section = [indexPath section];
        //获得选择节中的，选中的行索引
        NSUInteger row = [indexPath row];
        //按照节索引从小组名数组中获得组名
        NSString *groupName = [self.listGroupname objectAtIndex:section];
        //按照组名做为key，从字典中取出球队数组集合
        NSArray *listTeams = [self.dict objectForKey:groupName];
        
        cell.textLabel.text = [listTeams objectAtIndex:row];
        NSLog(@"text is %@",[listTeams objectAtIndex:row]);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        [CoreMediaFuncManagerVC call:@"1008611" inViewController:self failBlock:^{
            NSLog(@"不能打");
        }];
        
    } else {
        
//        //获得选择的节
//        NSUInteger section = [indexPath section];
//        //获得选择节中的，选中的行索引
//        NSUInteger row = [indexPath row];
//        //按照节索引从小组名数组中获得组名
//        NSString *groupName = [self.listGroupname objectAtIndex:section];
//        //按照组名做为key，从字典中取出球队数组集合
//        NSArray *listTeams = [self.dict objectForKey:groupName];
        

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

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] initWithCapacity:[self.listGroupname count]];
    //把 A组 -> A
    for (NSString *item in self.listGroupname) {
        [listTitles addObject:item];
    }
    return listTitles;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
