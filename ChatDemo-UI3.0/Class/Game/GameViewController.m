//
//  GameViewController.m
//  ChatDemo-UI3.0
//
//  Created by Xu Chong on 16/3/7.
//  Copyright © 2016年 Xu Chong. All rights reserved.
//

#import "GameViewController.h"
#import "CreatGameViewController.h"
#import "EMSDK.h"

@interface GameViewController () <EMChatManagerDelegate>

@property (nonatomic,weak) UIButton *rightBtn;

@end

@implementation GameViewController




- (void)creatGame {
    
    CreatGameViewController *addController = [[CreatGameViewController alloc]init];
    
    addController.view.backgroundColor = [UIColor whiteColor];

    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:addController];
    
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    
    [self presentViewController:nvc animated:YES completion:nil];
    
//    [self.navigationController pushViewController:addController animated:YES];
    
}

- (void)getPeople {
//    NSString *name = [[EMClient sharedClient] currentUsername];
    
    EMGroup *group = [[EMClient sharedClient].groupManager fetchGroupInfo:@"171193186847293896" includeMembersList:YES error:NULL];
    
    NSArray *listLocal = group.members;
    NSLog(@"listLocal = %@",listLocal);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //消息回调:EMChatManagerChatDelegate
    //注册消息回调
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    //移除消息回调
    [[EMClient sharedClient].chatManager removeDelegate:self];

}

-(void)didReceiveCmdMessages:(NSArray *)aCmdMessages {
    NSLog(@"cmdMessage = %@",aCmdMessages);
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
