//
//  FridndsViewController.m
//  register
//
//  Created by 李俊 on 15/5/8.
//  Copyright (c) 2015年 lijun. All rights reserved.
//

#import "FridndsViewController.h"
#import "AFNetworking.h"
@interface FridndsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FridndsViewController
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //上面标题
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake((view.frame.size.width-140)/2, 20, 150, 25)];
    lable.text = @"好友成员列表";
    lable.font = [UIFont systemFontOfSize:15.0];
    [view addSubview:lable];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self LoadData];
}
-(void)LoadData
{
    
    _dataArray = [[NSMutableArray alloc]init];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     NSString *urlString = [NSString stringWithFormat:kUrlString@"user/%@/friends",_userName];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    for (int i  = 0; i<26; i++)
    {
       
    }
    [_tableView reloadData];
    //[self useASIGetReqeuest];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",_dataArray.count);
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifyName = @"MyCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifyName];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyName];
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
