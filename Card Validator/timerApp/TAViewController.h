//
//  TAViewController.h
//  timerApp
//
//  Created by Nikhil Challagulla on 5/30/13.
//  Copyright (c) 2013 Nikhil Challagulla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardValidatior.h"
#import <MediaPlayer/MediaPlayer.h>
@interface TAViewController : UIViewController<cardValidatorDelegte>
{
    IBOutlet UITextField  *cardTF;
    IBOutlet UILabel *stLb,*typeLb;
    MPMoviePlayerController *player;
    
}
-(IBAction)getDetails:(id)sender;
@end
