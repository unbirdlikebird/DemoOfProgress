//
//  ViewController.m
//  DemoOfProgress
//
//  Created by Dianyi Jiang on 23/06/15.
//  Copyright (c) 2015 Dianyi Jiang. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()<UIScrollViewDelegate>
@property   (strong, nonatomic) UITableView     *tblOfRepairProcess;
@property   (strong, nonatomic) NSArray         *arrayOfDataSource;
@property   (strong, nonatomic) UIScrollView    *scrollView;

@end

@implementation ViewController

- (NSArray *)arrayOfDataSource{
    if (!_arrayOfDataSource) {
        _arrayOfDataSource = [[NSArray alloc]initWithObjects:@{@"status":@"1", @"title":@"title", @"subtitle":@"subtitle", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"subtitle", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"subtitle", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"", @"timestamp":@"timestamp"}, @{@"status":@"2", @"title":@"title", @"subtitle":@"", @"timestamp":@"timestamp"}, @{@"status":@"1", @"title":@"title", @"subtitle":@"subtitle", @"timestamp":@"timestamp"}, nil];
    }
    return _arrayOfDataSource;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self layoutHeaderView];
    [self layoutDetailView];
    self.view.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
}

- (void)layoutHeaderView{
    UIView *viewOfHeader = [[UIView alloc]initWithFrame:CGRectMake(20, 70, self.view.frame.size.width - 40, 100)];
    [viewOfHeader.layer setCornerRadius:10.0];
    [viewOfHeader.layer setMasksToBounds:YES];
    viewOfHeader.backgroundColor = [UIColor whiteColor];
    [viewOfHeader.layer setBorderColor:[[UIColor redColor] CGColor]];
    [viewOfHeader.layer setBorderWidth:1.0];
    [self.scrollView addSubview:viewOfHeader];
    
    UILabel *lblOfTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 30)];
    lblOfTitle.text = @"报修内容";
    [viewOfHeader addSubview:lblOfTitle];
    
    UIView *aLine = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 400, 1)];
    aLine.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    [viewOfHeader addSubview:aLine];
    
    UILabel *lblOfDetail = [[UILabel alloc]initWithFrame:CGRectMake(10, 51, 200, 42)];
    lblOfDetail.numberOfLines = 0;
    lblOfDetail.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    lblOfDetail.text = @"报修内容报修内容报修内容报修内容报修内容报修内容报修内容报修内容报修内容";
    [viewOfHeader addSubview:lblOfDetail];
    
    
}

- (void)layoutDetailView{
    
    UIView *viewOfDetail = [[UIView alloc]initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 100)];
    [viewOfDetail.layer setCornerRadius:10.0];
    [viewOfDetail.layer setMasksToBounds:YES];
    viewOfDetail.backgroundColor = [UIColor whiteColor];
    CGFloat heightOfDetailView = 0;
    CGFloat pointOfLineStart = 0.0;
    CGFloat pointOfLineEnd;
    
    for (int index = 0; index < [self.arrayOfDataSource count]; index ++) {
        int yOfFirstTitle = 0;
        if (index == 0) {
            yOfFirstTitle = 30;
        }
        else {
            yOfFirstTitle = 0;
        }
        UILabel *lblOfTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, yOfFirstTitle + heightOfDetailView, 200, 20)];
        lblOfTitle.text = self.arrayOfDataSource[index][@"title"];
        lblOfTitle.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        lblOfTitle.font = [UIFont systemFontOfSize:23];
        int yOfTimeStampLabel = lblOfTitle.frame.size.height + lblOfTitle.frame.origin.y;
        
        
        UIImageView *ivOfCircle = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, 20, 20)];
        ivOfCircle.backgroundColor = [UIColor whiteColor];
        ivOfCircle.image = [UIImage imageNamed:@"circle02.png"];
        [viewOfDetail addSubview:ivOfCircle];
        if (index == 0) {
            ivOfCircle.image = [UIImage imageNamed:@"circle01.png"];
            ivOfCircle.frame = CGRectMake(0, 0, 25, 25);
            pointOfLineStart = lblOfTitle.center.y;
        }
        ivOfCircle.center = CGPointMake(40, lblOfTitle.center.y);
        
        if ([self.arrayOfDataSource count] > 1 && index == [self.arrayOfDataSource count] - 1) {
            pointOfLineEnd = lblOfTitle.center.y;
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(40, pointOfLineStart, 1, pointOfLineEnd - pointOfLineStart)];
            lineView.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
            [viewOfDetail insertSubview:lineView atIndex:0];
        }
        
        if (![self.arrayOfDataSource[index][@"subtitle"] isEqualToString:@""]) {
            
            UILabel *lblOfSubtitle = [[UILabel alloc]initWithFrame:CGRectMake(80, yOfTimeStampLabel, lblOfTitle.frame.size.width, lblOfTitle.frame.size.height)];
            lblOfSubtitle.text = self.arrayOfDataSource[index][@"subtitle"];
            lblOfSubtitle.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
            if (index == 0) {
                lblOfSubtitle.textColor = [UIColor colorWithRed:0/255.0 green:65/255.0 blue:58/255.0 alpha:1.0];
            }
            yOfTimeStampLabel += lblOfSubtitle.frame.size.height;
            [viewOfDetail addSubview:lblOfSubtitle];
        }
        
        UILabel *lblOfTimeStamp = [[UILabel alloc]initWithFrame:CGRectMake(80, yOfTimeStampLabel, lblOfTitle.frame.size.width, lblOfTitle.frame.size.height)];
        lblOfTimeStamp.text = self.arrayOfDataSource[index][@"timestamp"];
        lblOfTimeStamp.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        if (index == 0) {
            lblOfTitle.textColor = [UIColor colorWithRed:0/255.0 green:65/255.0 blue:58/255.0 alpha:1.0];
            lblOfTimeStamp.textColor = [UIColor colorWithRed:0/255.0 green:65/255.0 blue:58/255.0 alpha:1.0];
        }
        
        UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(20, yOfTimeStampLabel + lblOfTimeStamp.frame.size.height, 1, 30)];
        [viewOfDetail addSubview:lblOfTitle];
        [viewOfDetail addSubview:lblOfTimeStamp];
        heightOfDetailView = whiteView.frame.origin.y + whiteView.frame.size.height;
        
    }
    
    CGRect rect = viewOfDetail.frame;
    rect.size.height = heightOfDetailView;
    viewOfDetail.frame = rect;
    
    [viewOfDetail.layer setBorderColor:[[UIColor redColor] CGColor]];
    [viewOfDetail.layer setBorderWidth:1.0];
    [self.scrollView addSubview:viewOfDetail];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, viewOfDetail.frame.origin.y + viewOfDetail.frame.size.height + 100);
}


@end
