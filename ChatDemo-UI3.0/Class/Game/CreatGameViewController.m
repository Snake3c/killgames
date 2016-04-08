//
//  CreatGameViewController.m
//  ChatDemo-UI3.0
//
//  Created by Xu Chong on 16/3/9.
//  Copyright © 2016年 Xu Chong. All rights reserved.
//

#import "CreatGameViewController.h"

@interface CreatGameViewController ()

@end

@implementation CreatGameViewController

- (void)viewWillAppear:(BOOL)animated {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    self.navigationItem.leftBarButtonItems = @[item];

}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"创建游戏";
    
    [self loadUI];

}


- (void)loadUI {
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    [btn setBackgroundColor:[UIColor grayColor]];
    
    [btn setTitle:@"发放身份" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(sendStatus) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
}


- (void)sendStatus {
    EMCmdMessageBody *body = [[EMCmdMessageBody alloc] initWithAction:@"p and k"];
    NSString *from = [[EMClient sharedClient] currentUsername];
    
    // 生成message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:@"xuchong" from:from to:@"xuchong" body:body ext:nil];
    message.chatType = EMChatTypeChat;
    
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:^(int progress) {
        
        NSLog(@"%d",progress);
        
    } completion:^(EMMessage *message, EMError *error) {
        NSLog(@"message = %@",message);
        
    }];
//    message.messageType = eMessageTypeChat; // 设置为单聊消息
    //message.messageType = eConversationTypeGroupChat;// 设置为群聊消息
    //message.messageType = eConversationTypeChatRoom;// 设置为聊天室消息

}

- (void)getPeople {
    //    NSString *name = [[EMClient sharedClient] currentUsername];
    
    EMGroup *group = [[EMClient sharedClient].groupManager fetchGroupInfo:@"171193186847293896" includeMembersList:YES error:NULL];
    
    NSArray *listLocal = group.members;
    NSLog(@"listLocal = %@",listLocal);
    
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
