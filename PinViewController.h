//
//  PinViewController.h
//  BlockPlace
//
//  Created by Antonino Buscetta on 30/05/15.
//  Copyright (c) 2015 Tonish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinViewController : UIViewController <UINavigationControllerDelegate>
{
    __weak IBOutlet UISegmentedControl *chooseOrder;
    __weak IBOutlet UISegmentedControl *chooseControl;
    
}


- (void)save:(id)sender;

@end
