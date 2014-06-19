//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Fantasy on 14-5-25.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController<UIAlertViewDelegate>

-(Deck *)createDeck;//for subclass. protected

@end
