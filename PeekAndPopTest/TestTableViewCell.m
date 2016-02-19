//
//  TestTableViewCell.m
//  PeekAndPopTest
//
//  Created by Sergey Sedov on 19/02/16.
//  Copyright © 2016 Sergey Sedov. All rights reserved.
//

#import "TestTableViewCell.h"
#import "ViewController.h"

@interface TestTableViewCell ()


@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [self.controller unregisterForPreviewingWithContext:self.previewingContext];
}

@end
