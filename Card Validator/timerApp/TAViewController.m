//
//  TAViewController.m
//  timerApp
//
//  Created by Nikhil Challagulla on 5/30/13.
//  Copyright (c) 2013 Nikhil Challagulla. All rights reserved.
//

#import "TAViewController.h"

@interface TAViewController ()

@end
@implementation TAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
}


-(IBAction)getDetails:(id)sender{
    
    CardValidatior *validateCard =  [CardValidatior new];
    [validateCard setDelegate:self];
    [validateCard validation_check:cardTF.text];
    
}

-(void)resoponseCardDetais:(NSString *)valid{
    
    stLb.text =  valid;

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
