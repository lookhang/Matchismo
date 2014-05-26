//
//  Card.m
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "Card.h"

@implementation Card
-(int)match:(NSArray *)otherCards{
    int score=0;
    
    for (Card * card in otherCards ) {
        if ([card.contents isEqualToString:self.contents]) {
            score=1;
        }
    }
    return score;
}
@end
