//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//从Deck中随机抽取指定数量的牌
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;
-(void)resetGame;
-(void)setGameMode:(NSInteger)mode;

@property (nonatomic,readonly)NSInteger score;
@property (nonatomic,readonly)NSInteger mode;
@end
