//
//  PlayingCard.h
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//当前游戏中的卡牌类，包括花色、点数两个属性

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic)NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
