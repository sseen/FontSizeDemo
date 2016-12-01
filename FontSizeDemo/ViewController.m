//
//  ViewController.m
//  FontSizeDemo
//
//  Created by sseen on 2016/12/1.
//  Copyright © 2016年 sseen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblios7;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _lblTitle.numberOfLines = 0;
    _lblTitle.text = @"Parallels Remote Application Server 是适用于虚拟应用程序和桌面交付的首选解决方案。它为使用任何操作系统或移动设备的所有用户提供了 Windows 应用程序。应用程序和桌面交付外围设备重定向与 RDS 和所有主要 Hypervisor 集成适用于 Windows、Linux、Mac、Android 和 iOS 的本机客户端令人惊叹不已的移动体验和HTML5客户端";
    
    NSLog(@"_lblTitle %@", NSStringFromCGSize([_lblTitle.text sizeWithFont:_lblTitle.font]));
    NSLog(@"_lblTitle %@", NSStringFromCGSize([_lblTitle.text sizeWithAttributes:@{NSFontAttributeName:_lblTitle.font}]));
    NSLog(@"_lblTitle %@", NSStringFromCGSize([_lblTitle.text sizeWithFont:_lblTitle.font
                                                         constrainedToSize:_lblTitle.frame.size
                                                             lineBreakMode:NSLineBreakByWordWrapping]));
    
    //ios 7 label
    _lblios7.frame = CGRectMake(10, 10, 355, 20);
    _lblios7.numberOfLines = 0;
    _lblios7.lineBreakMode = NSLineBreakByWordWrapping;
    _lblios7.text = _lblTitle.text;
    
    [_lblios7 sizeToFit];
    
    NSLog(@"%@", NSStringFromCGSize([_lblios7.text sizeWithFont:_lblios7.font
                                              constrainedToSize:_lblios7.frame.size
                                                  lineBreakMode:NSLineBreakByWordWrapping]));
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:_lblios7.font, NSParagraphStyleAttributeName:paragraphStyle};
    
    CGSize expectedLabelSize = [_lblios7.text boundingRectWithSize:_lblios7.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    NSLog(@"%@", NSStringFromCGSize( expectedLabelSize ));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
