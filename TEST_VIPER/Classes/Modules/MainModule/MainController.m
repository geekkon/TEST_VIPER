//
//  MainController.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainController.h"
#import "MainControllerOutputProtocol.h"

@interface MainController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
    [self.presenter controllerDidLoad];
}

#pragma mark - Setup 

- (void)setupViewController {
    [self setupNavigationItems];
    [self registerNibs];
    [self setupTableView];
}

- (void)setupNavigationItems {
    
}

- (void)registerNibs {
    
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - MainControllerInputProtocol

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate

@end
