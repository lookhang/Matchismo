//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Fantasy on 14-6-19.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingDeck.h"

@interface PlayingCardGameViewController ()
@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck{
    NSLog(@"PlayingCardGameViewController.createDeck");
    return [[PlayingDeck alloc] init];
}

@end
