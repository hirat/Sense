//
//  FeedTableViewController.m
//  Sense
//
//  Created by Hirat on 16/3/31.
//  Copyright © 2016年 Hirat. All rights reserved.
//

#import "FeedTableViewController.h"
#import "FeedTableViewModel.h"
#import "FeedTableViewCell.h"
#import <ReactiveCocoa.h>
#import "FeedModel.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "FeedTableViewTopCell.h"
#import "FeedTableViewHeader.h"

@interface FeedTableViewController ()
@property (nonatomic, strong) FeedTableViewModel* viewModel;
@property (nonatomic, strong) FeedTableViewHeader* tableViewHeader;
@end

@implementation FeedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self makeUI];
    [self bindViewModel];
    
    self.viewModel.active = YES;
}

#pragma mark - 私有函数

- (void)makeUI
{
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass: [FeedTableViewCell class] forCellReuseIdentifier: NSStringFromClass([FeedTableViewCell class])];
    [self.tableView registerClass: [FeedTableViewTopCell class] forCellReuseIdentifier: NSStringFromClass([FeedTableViewTopCell class])];
}

- (void)bindViewModel
{
    @weakify(self);
    [[RACObserve(self.viewModel, feed) filter:^BOOL(FeedModel* feed) {
        return feed;
    }] subscribeNext:^(FeedModel* feed) {
        
        @strongify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableViewHeader = [[FeedTableViewHeader alloc] initWithFrame: CGRectMake(0, 0, self.tableView.frame.size.width, 400)];
            self.tableViewHeader.backgroundColor = [UIColor whiteColor];
            FeedObject* object = [feed.list firstObject];
            FeedImageObject* image = object.imageList.firstObject;
            NSArray* lengths = [image.pixel componentsSeparatedByString: @"*"];
            [self.tableViewHeader updateWith: image.imgsrc width: [lengths.firstObject floatValue] height: [lengths.lastObject floatValue]];
            self.tableView.tableHeaderView = self.tableViewHeader;
            
            [self.tableView reloadData];            
        });

        
    }];
}

#pragma mark - Set/Get

- (FeedTableViewModel*)viewModel
{
    if (!_viewModel)
    {
        _viewModel = [FeedTableViewModel new];
        _viewModel.topicid = @"00961GKN";
    }
    
    return _viewModel;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.feed.list.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        FeedTableViewTopCell* cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([FeedTableViewTopCell class]) forIndexPath: indexPath];
        FeedObject* feed = self.viewModel.feed.list[indexPath.row];
        [cell bind: feed];
        [cell updateIndexPath: indexPath];
        
        return cell;
        
    }
    else
    {
        FeedTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([FeedTableViewCell class]) forIndexPath: indexPath];
        FeedObject* feed = self.viewModel.feed.list[indexPath.row];
        [cell bind: feed];
        [cell updateIndexPath: indexPath];
        
        return cell;

    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return [tableView fd_heightForCellWithIdentifier: NSStringFromClass([FeedTableViewTopCell class]) cacheByIndexPath: indexPath configuration:^(FeedTableViewTopCell* cell) {
            
            FeedObject* feed = self.viewModel.feed.list[indexPath.row];
            [cell bind: feed];
            [cell updateIndexPath: indexPath];
            
        }];
        
    }
    else
    {
        return [tableView fd_heightForCellWithIdentifier: NSStringFromClass([FeedTableViewCell class]) cacheByIndexPath: indexPath configuration:^(FeedTableViewCell* cell) {
            
            FeedObject* feed = self.viewModel.feed.list[indexPath.row];
            [cell bind: feed];
            [cell updateIndexPath: indexPath];
            
        }];

    }
}

#pragma mark - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tableViewHeader.offset = scrollView.contentOffset.y;
}

@end
