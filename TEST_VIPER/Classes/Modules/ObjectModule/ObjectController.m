//
//  ObjectController.m
//  TEST_VIPER
//
//  Created by Dim on 14.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectController.h"
#import "ObjectControllerOutputProtocol.h"
#import "ObjectInfoViewModel.h"

@interface ObjectController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (nonatomic, strong) ObjectInfoViewModel *objectInfo;

@end

@implementation ObjectController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.presenter controllerDidLoad];
}

#pragma mark - Setup

- (void)setupNavigationBarTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)setupInfoLabel:(NSString *)text {
    self.infoLabel.text = text;
}

#pragma mark - ObjectControllerInputProtocol

- (void)updateContentWithObjectInfoViewModel:(ObjectInfoViewModel *)objectInfo {
    self.objectInfo = objectInfo;
    [self setupNavigationBarTitle:objectInfo.name];
    [self setupInfoLabel:objectInfo.info];
}

@end
