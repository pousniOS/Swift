//
//  ViewController.m
//  NavigationBar
//
//  Created by mac on 2021/1/19.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *tf = UITextView.new;
    tf.layer.borderColor = UIColor.redColor.CGColor;
    tf.layer.borderWidth = 1.0f;
    
    tf.frame = CGRectMake(30, 90, 200, 500);
    [self.view addSubview:tf];
    // Do any additional setup after loading the view.
}


@end
