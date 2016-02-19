//
//  TestTableViewCell.h
//  PeekAndPopTest
//
//  Created by Sergey Sedov on 19/02/16.
//  Copyright © 2016 Sergey Sedov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface TestTableViewCell : UITableViewCell

@property (nonatomic, strong) id previewingContext;
@property (nonatomic, weak) ViewController *controller;

@end
