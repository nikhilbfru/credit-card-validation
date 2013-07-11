//
//  CardValidatior.h
//  timerApp
//
//  Created by Nikhil Challagulla on 6/5/13.
//  Copyright (c) 2013 Nikhil Challagulla. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol cardValidatorDelegte<NSObject>
-(void)resoponseCardDetais:(NSString *)valid;
@end

@interface CardValidatior : NSObject
@property (nonatomic,assign)id <cardValidatorDelegte>delegate;
-(void)validation_check:(NSString*)pass_value;
@end
