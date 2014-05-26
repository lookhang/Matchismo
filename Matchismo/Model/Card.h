//
//  Card.h
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property(nonatomic,getter = isChosen)BOOL chosen;
@property(nonatomic,getter = isMatched)BOOL matched;

-(int)match:(NSArray *)otherCards;
@end
