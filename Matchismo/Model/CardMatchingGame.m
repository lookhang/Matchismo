//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property  (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray * cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{//延迟实例化
    if (!_cards) {
        _cards=[NSMutableArray new];
    }
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self=[super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card=[deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
            
        }
    }
    
    return self;
}

-(Card*)cardAtIndex:(NSUInteger)index{
    return index <[self.cards count] ? self.cards[index]:nil;
}

static const int MISMATCH_PENALTY_SCORE=2;
static const int MATCH_BONUS=4;
static const int COST_TO_CHOOSE=1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card=[self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen=NO;
        }else{
            for (Card *otherCards in self.cards ) {
                if (otherCards.isChosen && !otherCards.isMatched) {
                    int matchScore=[card match:@[otherCards]];
                    if (matchScore) {
                        self.score+=matchScore*MATCH_BONUS;
                        
                        card.matched=YES;
                        otherCards.matched=YES;
                    }else{
                        self.score-=MISMATCH_PENALTY_SCORE;
                        
                        otherCards.chosen=NO;
                    }
                    break;
                }
            }

            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;

        }
    }
}


@end
