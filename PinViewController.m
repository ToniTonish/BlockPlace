//
//  PinViewController.m
//  BlockPlace
//
//  Created by Antonino Buscetta on 30/05/15.
//  Copyright (c) 2015 Tonish. All rights reserved.
//

#import "PinViewController.h"

@interface PinViewController ()

@end

@implementation PinViewController

- (id)init
{
    self = [super init];
    if (self) {
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                             target:self
                                                                             action:@selector(save:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
    }
    return self;
}

- (void)save:(id)sender // da controllare
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
