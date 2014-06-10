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

@property  (nonatomic,readwrite) NSInteger mode;//0：2-card，1：3-card

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{//延迟实例化
    if (!_cards) {
        _cards=[NSMutableArray new];
    }
    return _cards;
}

-(NSInteger)mode{//默认模式为2-card
    if (!_mode) {
        _mode=0;
    }
    return _mode;
}

//初始化桌面上的卡牌，从牌堆里随机抽取一定数量的卡牌
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
    Card *card=[self cardAtIndex:index];//当前选中的牌
    
    if (!card.isMatched) {//未匹配
        if (card.isChosen) {
            card.chosen=NO;
            //NSLog(@"已选中，则隐藏！");
        }else{
            NSMutableArray * chosenCards=[[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards ) {
                if(otherCard.isChosen && !otherCard.isMatched){
                    [chosenCards addObject:otherCard];
                }
            }
            
            if ([chosenCards count]==self.mode+1) {
                
                NSLog(@"Other Card count:%lu",(unsigned long)[chosenCards count]);
                
                int matchScore=[card match:chosenCards];
                
                NSLog(@"matchScoe by this time:%d",matchScore);
                if (matchScore) {
                    self.score+=matchScore*MATCH_BONUS;
                    
                    card.matched=YES;
                    for (Card * otherCard in chosenCards) {
                        otherCard.matched=YES;
                    }
                    
                }else{
                    NSLog(@"No matched!");
                    self.score-=MISMATCH_PENALTY_SCORE;
                    
                    for (Card * otherCard in chosenCards) {
                        NSLog(@"set match status");
                        otherCard.chosen=NO;
                    }
                }
            }

            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;

        }
    }
}

-(void)resetGame{
    self.score=0;
    for (Card *card in self.cards ) {
        card.chosen=NO;
        card.matched=NO;
    }
}

-(void)setGameMode:(NSInteger)mode{
    _mode=mode;
}
@end
