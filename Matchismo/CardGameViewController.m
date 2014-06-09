//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Fantasy on 14-5-25.
//  Copyright (c) 2014年 Fantasy. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic)Deck *deck;
@property (strong,nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

-(Deck *)deck{
    if (!_deck) {
        _deck=[PlayingDeck new];
    }
    return _deck;
}

-(CardMatchingGame *)game{
    if (!_game) {
        _game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    }
    
    return _game;
}

-(void)setFlipCount:(int)flipCount{
    //flipCount=flipCount;
    //self.flipsLabel.text=[NSString stringWithFormat:@"Flips:%d",self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    /*if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else{
        Card *card=[self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
        
    }*/
    
    int choosenButtonIndex=(int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButtonIndex];
    [self updateUI];
    //self.flipCount++;
}

-(void)updateUI{
    for(UIButton * cardButton in self.cardButtons){
        int cardButtonIndex=(int)[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;//禁用已经匹配的卡牌
        
        //测试字体样式
        NSString * score_txt=[NSString stringWithFormat:@"Score: %ld",self.game.score];
        NSMutableAttributedString * new_scoreText=[[NSMutableAttributedString alloc] initWithString:score_txt];
        [new_scoreText addAttributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]}range:NSMakeRange(0, score_txt.length)];
        self.scoreLabel.attributedText=new_scoreText;
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents:@"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end
