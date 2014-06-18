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
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic)Deck *deck;
@property (strong,nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@property (weak, nonatomic) IBOutlet UILabel *gameInfo;
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


- (IBAction)touchCardButton:(UIButton *)sender {
    self.gameMode.enabled=NO;
    int choosenButtonIndex=(int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButtonIndex];
    [self updateUI];
    self.gameInfo.text=self.game.info;
    //NSLog(@"当前模式：%@",self.game.mode ==0 ? @"2-card mode" : @"3-card mode");
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

- (IBAction)restartGame:(UIButton *)sender {//重新开始游戏
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"重新开始游戏"
                                                    message:@"你确定要重新开始游戏吗？"
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定",nil];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"确定"]) {
        self.gameMode.enabled=YES;
        self.game=nil;//设置game为空，使重新取牌
        self.deck=nil;//牌堆必须重置，否则4次以后会无牌可取
        [self.game resetGame];
        [self.game setGameMode:self.gameMode.selectedSegmentIndex];
         NSLog(@"设置模式：%@",self.gameMode.selectedSegmentIndex ==0 ? @"2-card mode" : @"3-card mode");
        [self updateUI];
    }
}

- (IBAction)changeMode:(UISegmentedControl *)sender {
    [self.game setGameMode:sender.selectedSegmentIndex];
}


@end
