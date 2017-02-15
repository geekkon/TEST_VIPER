//
//  ObjectTableViewCell.h
//  TEST_VIPER
//
//  Created by Dim on 06.02.17.
//  Copyright © 2017 Dmitriy Baklanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ObjectViewModel;

@interface ObjectTableViewCell : UITableViewCell

- (void)setupWithObjectViewModel:(ObjectViewModel *)objectViewModel;

@end
