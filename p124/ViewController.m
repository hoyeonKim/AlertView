//
//  ViewController.m
//  p124
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(1==alertView.tag){
        NSLog(@"Cancel");
    }
    else if(alertView.firstOtherButtonIndex == buttonIndex)
    {
        NSLog(@"선택1");
    }
    else if ((alertView.firstOtherButtonIndex +1)==buttonIndex){
        NSLog(@"선택2");
    }
    
    else if (2==alertView.tag){
        if(alertView.firstOtherButtonIndex==buttonIndex){
            UITextField *idfield = [alertView textFieldAtIndex:0];
            UITextField *pwfield = [alertView textFieldAtIndex:1];
            NSLog(@"id: %@, pw: %@",idfield.text,pwfield.text);
        }
        else{
            NSLog(@"로그인 취소");
        }
    }
    else{
        
    }

}
-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    if (2==alertView.tag) {
        UITextField *idfield = [alertView textFieldAtIndex:0];
        UITextField *pwfield = [alertView textFieldAtIndex:1];
        return([idfield.text length] > 3&&[pwfield.text length]>3);
    }
return YES;
}
- (IBAction)showAlertWithInput:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"로그인" message:@"id/pw를 입력하세요" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.tag=2;
    [alert show];
    [alert message];
}
- (IBAction)showBasicAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"제목" message:@"메시지" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"선택1",@"선택2", nil];
    alert.tag=1;
    [alert show];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
