//
//  PlayingCard.m
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit=_suit;//如果自定义了存取器，则需要声明

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
        
        //匹配算法
        NSMutableArray * desarray=[NSMutableArray arrayWithArray:otherCards];
        [desarray addObject:self];
        for (int i=0; i<[desarray count]-1; i++) {
            PlayingCard * firstCard=(PlayingCard *)desarray[i];
            for (int j=i+1; j<[desarray count]; j++) {
                PlayingCard * secCard=(PlayingCard *)desarray[j];
                if (firstCard.suit==secCard.suit) {
                    NSLog(@"花色匹配成功!");
                    score=1;
                    return score;
                }else if (firstCard.rank==secCard.rank){
                    NSLog(@"点数匹配成功!");
                    score=4;
                    return score;
                }
            }
        }
        //by sixer 2015年11月20日
    }
    return score;
}
@end
