//
//  ViewController.m
//  Dome
//
//  Created by liubaojian on 16/8/27.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewControllerOne.h"
#import "ShowViewControllerTwo.h"


@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArray;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视图遮罩层的效果";
    
    titleArray = @[@"触之所及都变色",@"华丽变换图片"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *Tb = [[UITableView alloc] initWithFrame:CGRectMake(0,64, 320, 500) style:UITableViewStylePlain];
    Tb.backgroundColor=[UIColor whiteColor];
    Tb.delegate=self;
    Tb.dataSource=self;
    Tb.scrollEnabled=YES;
    [self.view addSubview:Tb];
    Tb.tableFooterView = [UIView new];


}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"firstCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.tag = indexPath.row;
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *str = titleArray[indexPath.row];
    
    switch (indexPath.row) {
        case 0:{
            
            ShowViewControllerOne *subVC = [[ShowViewControllerOne alloc]init];
            subVC.title = str;
            [self.navigationController pushViewController:subVC animated:YES];
            break;
        }
        case 1:{
            
            ShowViewControllerTwo *subVC = [[ShowViewControllerTwo alloc]init];
            subVC.title = str;
            [self.navigationController pushViewController:subVC animated:YES];
            break;
        }
            
        default:
            break;
    }
}



@end
