//
//  ViewController.m
//  PeekAndPopTest
//
//  Created by Sergey Sedov on 19/02/16.
//  Copyright © 2016 Sergey Sedov. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "TestTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:TestTableViewCell.class forCellReuseIdentifier:@"cell"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    
    if ([self isForceTouchAvailable]) {
        cell.previewingContext = [self registerForPreviewingWithDelegate:self sourceView:cell];
        cell.controller = self;
    }

    
    return cell;
}

- (BOOL)isForceTouchAvailable {
    BOOL isForceTouchAvailable = NO;
    if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
        isForceTouchAvailable = self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
    }
    return isForceTouchAvailable;
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    if ([self.presentedViewController isKindOfClass:[TestViewController class]]) {
        return nil;
    }
    
    UITableViewCell *tableCell = (TestTableViewCell *) [previewingContext sourceView];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TestViewController *previewController = [storyboard instantiateViewControllerWithIdentifier:@"test"];
    previewController.text = tableCell.textLabel.text;
    return previewController;
    return nil;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    [self presentViewController:viewControllerToCommit animated:NO completion:nil];
}



@end
