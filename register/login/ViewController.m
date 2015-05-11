//
//  ViewController.m
//  register
//
//  Created by 李俊 on 15/5/6.
//  Copyright (c) 2015年 lijun. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController
{
    UITextField * _userNameFd;
    UITextField *_passwordFd;
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self CreateView];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userNameFd resignFirstResponder];
    [_passwordFd resignFirstResponder];
}
-(void)CreateView
{
    
    CGFloat spaceW = (KDeviceW-150)/2;
    NSLog(@"%f",spaceW);
    CGFloat spaceH = (KDeviceH-210-64)/2;

    _userNameFd = [[UITextField alloc]init];
    _userNameFd.frame = CGRectMake(spaceW, spaceH, 150, 30);
    _userNameFd.borderStyle = UITextBorderStyleRoundedRect;
    _userNameFd.clearButtonMode = UITextFieldViewModeWhileEditing;
    _userNameFd.placeholder = @"手机号";
    [self.view addSubview:_userNameFd];
    
    _passwordFd = [[UITextField alloc]init];
    _passwordFd.frame = CGRectMake(spaceW, spaceH+40, 150, 30);
    _passwordFd.borderStyle = UITextBorderStyleRoundedRect;
    _passwordFd.placeholder = @"密码";
    _passwordFd.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordFd.secureTextEntry = YES;
    [self.view addSubview:_passwordFd];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(spaceW, _passwordFd.frame.origin.y+50, 150, 20);
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
-(void)btnClick:(UIButton *)btn
{
   
    NSLog(@"被点击了");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary * mDict  = [[NSMutableDictionary alloc]init];
    
    [manager POST:[NSString stringWithFormat:kUrlString@"/login?username=%@&password=%@",_userNameFd.text,_passwordFd.text] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    MessageViewController * vc = [[MessageViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
