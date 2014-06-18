//
//  PlayingCard.m
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit=_suit;

-(NSString *)contents{
    
    NSArray *rankStrings =[PlayingCard rankString];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


+(NSArray *)validSuits{
    return @[@"♣︎",@"♦︎",@"♥︎",@"♠︎"];
}

+(NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit] ){
        _suit=suit;
    }
}

-(NSString *)suit{
    return _suit ?_suit :@"?";
}

+(NSUInteger)maxRank{
    return [[self rankString] count]-1;
}

-(void) setRank:(NSUInteger)rank{
    if (rank<=[PlayingCard maxRank]) {
        _rank=rank;
    }
}

-(int)match:(NSArray *)otherCards{
    int score=0;
    long cardCount=[otherCards count];
    if (cardCount) {
        for (int i=0; i<cardCount; i++) {
            Card * card=otherCards[i];//mainCard of otherCards
            if ([card isKindOfClass:[PlayingCard class]]) {
                //先与当前卡牌比较
                PlayingCard *otherCard=(PlayingCard *)card;
                if (otherCard.suit==self.suit) {
                    NSLog(@"花色匹配成功!");
                    score=1;
                    return score;
                }else if (otherCard.rank==self.rank){
                    NSLog(@"点数匹配成功!");
                    score=4;
                    return score;
                }
                
                //再与otherCards中的其他卡牌做比较
                for (int j=i+1; j<cardCount; j++) {
                    Card *thisCard=otherCards[j];
                    if ([thisCard isKindOfClass:[PlayingCard class]]) {
                        PlayingCard *nextCard=(PlayingCard *)thisCard;
                        if (otherCard.suit==nextCard.suit) {
                            NSLog(@"花色匹配成功!");
                            score=1;
                            return score;
                        }else if (otherCard.rank==nextCard.rank){
                            NSLog(@"点数匹配成功!");
                            score=4;
                            return score;
                        }
                    }
                }
            }
            
        }
    }
    return score;
}
@end
