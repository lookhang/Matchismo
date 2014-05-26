//
//  PlayingCard.h
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic)NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
