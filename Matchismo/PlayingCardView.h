//
//  PlayingCardView.h
//  Matchismo
//
//  Created by Fantasy on 14-7-7.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (nonatomic) NSUInteger rank;
@property (strong,nonatomic) NSString * suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;
@end
