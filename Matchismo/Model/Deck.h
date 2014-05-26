//
//  Deck.h
//  Matchismo
//
//  Created by Fantasy on 14-5-26.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
