//
//  ViewController.m
//  filemanager
//
//  Created by CHANEL on 14-9-25.
//  Copyright (c) 2014年 cici. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //错误信息
    NSError *error;
    
    NSFileManager *fm = [[NSFileManager alloc] init];
    //在沙盒创建目录
    [fm createDirectoryAtPath:@"%@/imageCache" withIntermediateDirectories:YES attributes:nil error:&error];
    //获取目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"imageCache"];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"file.txt"];
    //需要写入的字符串
    NSString *str= @"123";
    //写入文件
    [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    //显示文件目录的内容
    NSLog(@"Documentsdirectory: %@",[fm contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    
    //通过移动该文件对文件重命名
    NSString *filePath2 = [documentsDirectory stringByAppendingPathComponent:@"file2.txt"];
    //判断是否移动
    if ([fm moveItemAtPath:filePath toPath:filePath2 error:&error] != YES) {
        NSLog(@"Unable to move file: %@", [error localizedDescription]);
    }
    //显示文件目录的内容
    NSLog(@"Documentsdirectory: %@", [fm contentsOfDirectoryAtPath:documentsDirectory error:&error]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
