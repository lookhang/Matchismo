//
//  PlayingDeck.m
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"

@implementation PlayingDeck

-(instancetype)init{
    self=[super init];
    
    if (self) {
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank=1;rank<=[PlayingCard maxRank];rank++){
                PlayingCard *card=[PlayingCard new];
                card.rank=rank;
                card.suit=suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
