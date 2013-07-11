//
//  CardValidatior.m
//  timerApp
//
//  Created by Nikhil Challagulla on 6/5/13.
//  Copyright (c) 2013 Nikhil Challagulla. All rights reserved.
//

#import "CardValidatior.h"

@implementation CardValidatior
@synthesize delegate;
-(void)validation_check:(NSString*)pass_value
{
    
    
    NSString *cardType =  pass_value;
    NSMutableArray *character;
    
    unsigned long long odd_no;
    unsigned long long new_odd_no;
    unsigned long long even_no;
    unsigned long long new_even_no;
    unsigned long long multiplied_even_no;
    unsigned long long changed_even_no;
    unsigned long long final_value;
    unsigned long long revers_card_no;
    unsigned long long card_no;
    unsigned long long check_reverse;
    new_odd_no = 0;
    new_even_no = 0;
    
    card_no = [pass_value longLongValue];
    
    character = [[NSMutableArray alloc]init];
    
    //-------reversing order of entered card number---------
    for(int i = 0; i<[pass_value length];i++)
    {
        check_reverse =(card_no % 10);
        card_no = (card_no / 10);
        
        [character addObject:[NSString stringWithFormat:@"%qu",check_reverse]];
        
        revers_card_no=revers_card_no*10+check_reverse;
        check_reverse=card_no;
        
    }
    pass_value = [NSString stringWithFormat:@"%qu",revers_card_no];
    
    //--------checking for even and odd numbers--------
    for(int j=0;j<[character count];j++)
    {
        if(j % 2 == 0)
        {
            odd_no = [[character objectAtIndex:j]longLongValue];
            
            new_odd_no = new_odd_no+odd_no;
        }
        else
        {
            //------doubling the value of even no's--------
            even_no = [[character objectAtIndex:j]longLongValue];
            multiplied_even_no=even_no*2;
            
            NSLog(@"%qu",multiplied_even_no);
            
            //-------if even is a single digit--------
            if((multiplied_even_no % 10) == 0)
            {
                if(multiplied_even_no == 10)
                {
                    new_even_no = 1+new_even_no;
                }
                else
                {
                    new_even_no = multiplied_even_no + new_even_no;
                }
            }
            //----------if there is multiple digits in even no---------
            else
            {
                int x=(multiplied_even_no % 10);
                int y=multiplied_even_no /10;
                
                changed_even_no = x+y;
                
                new_even_no = new_even_no + changed_even_no;
                
            }
        }
    }
    
    //--------calculating final value--------
    final_value = new_even_no + new_odd_no;
    
    NSLog(@"%qu",final_value);
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES '^5[1-5][0-9]{14}$'"];
    if ([pred evaluateWithObject:cardType]) {
        
        
        cardType = @"Master Card";
        
    }
    
    NSPredicate *predTwo = [NSPredicate predicateWithFormat:@"SELF MATCHES '^4[0-9]{12}(?:[0-9]{3})?$'"];
    if ([predTwo evaluateWithObject:cardType]) {
        
        
        cardType = @"Visa";
        
    }
    
    
    
    NSPredicate *predThree = [NSPredicate predicateWithFormat:@"SELF MATCHES '^3[47][0-9]{13}$'"];
    if ([predThree evaluateWithObject:cardType]) {
        
        
        cardType = @"American Express";
        
    }

    
    NSPredicate *predFour = [NSPredicate predicateWithFormat:@"SELF MATCHES '^3(?:0[0-5]|[68][0-9])[0-9]{11}$'"];
    if ([predFour evaluateWithObject:cardType]) {
        
        
        cardType = @"Diners Club";
        
    }
    
     
    
    
    NSPredicate *predFive = [NSPredicate predicateWithFormat:@"SELF MATCHES '^6(?:011|5[0-9]{2})[0-9]{12}$'"];
    if ([predFive evaluateWithObject:cardType]) {
        
        
        cardType = @"Discover";
        
    }
    
    if((final_value % 10) == 0)
    {
        
       [delegate resoponseCardDetais:[NSString stringWithFormat:@"Card no is valid, Card type %@",cardType]];
    }
    else
    {
       [delegate resoponseCardDetais:@"Card No is not valid"];

    }
    
}

@end
