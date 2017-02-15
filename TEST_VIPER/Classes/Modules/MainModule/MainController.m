//
//  MainController.m
//  TEST_VIPER
//
//  Created by Dim on 05.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "MainController.h"
#import "MainControllerOutputProtocol.h"
#import "ObjectViewModel.h"
#import "ObjectTableViewCell.h"

static NSString * const CELL_IDENTIFIER = @"ObjectTableViewCell";

@interface MainController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray <ObjectViewModel *> *objectViewModels;

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
    [self setupPlaceholder];
    [self registerNibs];
    [self setupTableView];
    [self setupUI];
}

- (void)setupNavigationItems {
    self.navigationItem.title = @"VIPER";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                          target:self
                                                                                          action:@selector(refreshAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(addAction:)];
}

- (void)setupPlaceholder {
    self.placeholderLabel.text = @"No results";
    self.placeholderLabel.hidden = YES;
}

- (void)registerNibs {
    [self.tableView registerNib:[UINib nibWithNibName:CELL_IDENTIFIER bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CELL_IDENTIFIER];
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setupUI {
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark - MainControllerInputProtocol

- (void)showActivityIndicator {
    self.activityIndicatorView.hidden = NO;
    self.contentView.hidden = YES;
}

- (void)hideActivityIndicator {
    self.contentView.hidden = NO;
    self.activityIndicatorView.hidden = YES;
}

- (void)showEmptyResultsPlaceholder {
    self.placeholderLabel.hidden = NO;
    self.tableView.hidden = YES;
}

- (void)hideEmptyResultsPlaceholder {
    self.tableView.hidden = NO;
    self.placeholderLabel.hidden = YES;
}

- (void)disableBarButtons {
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)enableBarButtons {
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)updateContentWithObjectViewModels:(NSArray <ObjectViewModel *> *)objectViewModels {
    self.objectViewModels = objectViewModels;
    [self.tableView reloadData];
}

- (void)showError:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                             message:[error localizedDescription]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objectViewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ObjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    ObjectViewModel *objectViewModel = self.objectViewModels[indexPath.row];
    [cell setupWithObjectViewModel:objectViewModel];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ObjectViewModel *objectViewModel = self.objectViewModels[indexPath.row];
    [self.presenter controllerDidSelectObjectID:objectViewModel.objectID];
}

#pragma mark - Actions

- (void)refreshAction:(UIBarButtonItem *)sender {
    [self.presenter controllerDidTapRefreshButton];
}

- (void)addAction:(UIBarButtonItem *)sender {
    [self.presenter controllerDidTapAddButton];
}

@end
