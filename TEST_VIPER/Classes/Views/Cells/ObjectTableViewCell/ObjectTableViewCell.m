//
//  ObjectTableViewCell.m
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import "ObjectTableViewCell.h"
#import "ObjectViewModel.h"

@interface ObjectTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIView *activeView;

@end

@implementation ObjectTableViewCell

#pragma mark - Overrided

- (void)awakeFromNib {
    [super awakeFromNib];
    self.activeView.layer.cornerRadius = 2.0;
}

#pragma mark - Public

- (void)setupWithObjectViewModel:(ObjectViewModel *)objectViewModel {
    self.nameLabel.text = objectViewModel.name;
    self.createdLabel.text = objectViewModel.created;
    self.countLabel.text = objectViewModel.count;
    self.activeView.backgroundColor = objectViewModel.isActive ? [UIColor greenColor] : [UIColor redColor];
}

@end
