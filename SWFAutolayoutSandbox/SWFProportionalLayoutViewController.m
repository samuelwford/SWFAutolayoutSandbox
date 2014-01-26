//
//  SWFProportionalLayoutViewController.m
//  SWFAutolayoutSandbox
//
//  Created by Samuel Ford on 1/25/14.
//  Copyright (c) 2014 Sam Ford. All rights reserved.
//

#import "SWFProportionalLayoutViewController.h"

@interface SWFProportionalLayoutViewController ()

@property (weak, nonatomic) IBOutlet UIView *container1;
@property (weak, nonatomic) IBOutlet UIView *blueInContainer1;
@property (weak, nonatomic) IBOutlet UIView *purpleInContainer1;

@property (weak, nonatomic) IBOutlet UIView *container2;
@property (weak, nonatomic) IBOutlet UIView *blueInContainer2;

@end

@implementation SWFProportionalLayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // replace the placeholder constraint with a child to parent proportional width constraint
    
    NSLayoutConstraint *parentProportionalWidth = [NSLayoutConstraint constraintWithItem:self.blueInContainer2
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.container2
                                                                         attribute:NSLayoutAttributeWidth
                                                                        multiplier:0.33
                                                                          constant:0];
    
    // we're adding the constraint to the parent since both the left and right hand views in the constraint
    // have to be in the hierarchy of view the constraint is added to - in this case the parent
    
    [self.container2 addConstraint:parentProportionalWidth];
    
    // replace the placeholder constraint with a peer to peer proportional width constraint
    
    NSLayoutConstraint *peerProportionalWidth = [NSLayoutConstraint constraintWithItem:self.blueInContainer1
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.purpleInContainer1
                                                                             attribute:NSLayoutAttributeWidth
                                                                            multiplier:0.5
                                                                              constant:0];
    
    // note that the constraint has to be added to a view at a place in the heirarchy that an see both the
    // left and right hand view - in this case the parent of the blue and purple views (container1)
    
    [self.container1 addConstraint:peerProportionalWidth];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
