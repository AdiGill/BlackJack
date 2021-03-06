int amount = 100000;//Starting money amount

import g4p_controls.*;

String name = "";//variables used in the code
boolean hitClicked;
boolean hit = false;
boolean deal = false;
PImage[] img = new PImage[52];
PImage back;
boolean finished = false;
PImage bg;
PImage chips;
boolean stand = false;
Player p1;
Dealer d1;
boolean gOver = false;
boolean hitter;
int hitt = 0;
int timer;
boolean dDown;
int dd = 0;
boolean hint = false;
String curHint = "";
boolean broke = false;
int bj = 0;

void setup(){
  size(1600,1000);
  loadImages(img);//loads the card array with the deck of cards
  back = loadImage("back.png");
  bg = loadImage("bg.png");
  chips = loadImage("chip.png");
  createGUI();

  
}
void draw(){
  
  if(!broke){ // Keeps running the game as long as your money is over $0
  image(bg,0,0);//Controls the background(Will change if you win or lose)
  updateHint();//Updates the hint depending on whats true and false in the code
  hintLabel.setText(curHint);//sets the hint at the bottom of the gui window
  scale(0.188);//makes the cards smaller to fit on the screen
  if(amount<0){//if the amount goes under 0 the game will end
    amount = 0;
    broke = true;
  }
  drawAmount();//draws the total balance of the player
    if(!gOver){//if the current round isnt over the round will run
      bg = loadImage("bg.png");//the background is set to the blackjack table
      int curStackx = 1000;
      int curStacky = 650;
      
      drawName();//draws the player name
      
      for(int x = 0 ;x<12;x++){//draws stack of card at the top left
        drawStack(curStackx,curStacky,x);
      }
      if(deal){//if deal cards is clicked
        d1.drawdHand();//draws the dealers hand
        d1.drawdTotal();//draws the dealers total
        if(stand){ // if player clicks stand then dealers turn starts
          d1.drawNewCards();
          if(d1.dTotal<17){
            d1.newdCard(round(random(0,52)));
          }
          else{//used to check if the dealers total is higher than players or if dealer has a blackjack
            timer++;
            if(timer>3){
              gOver = true;
              if(d1.dTotal == 21){
                bg = loadImage("dw.png");
                if(timer==4)
                amount -= p1.bet;
            }
              else if(d1.dTotal>21){
                bg = loadImage("yw.png");
                if(timer==4)
                amount+=p1.bet*2;
              }
              else if(d1.dTotal == p1.total){
                bg = loadImage("pb.png");
                if(timer==4)
                amount+=p1.bet;
              }
              else if(d1.dTotal>p1.total){
                bg = loadImage("dw.png");
                if(timer==4)
                amount -= p1.bet;
            }
              else{
                bg = loadImage("yw.png");
                if(timer==4)
                amount+=p1.bet*2;
              }
          }
          
          }
        }
        dealAnimate(p1.card1,p1.card2);//animates the dealing for the first round
        if(finished){//when the animation is finished the players cards are drawn and if hit is clicked the new card(s) are drawn
          p1.drawHand();
          if(hitClicked){
            p1.drawNewCards();
            
          }
          }
        p1.drawTotal();//draws the total
        
        p1.drawBet();  //draws the bet
        drawChips();   // draws the bet in chips
        
        
        }
      }
    
    else{ // checks if player gets a black jack or a bust
      if(p1.total == 21){
        bj++;
        bg = loadImage("BJ.png");
        if(bj == 1){
          amount+=p1.bet*2;
        }
    }
      else if(p1.total>21){
        bj++;
        bg = loadImage("bust.png");
        if(bj == 1){
        amount -= p1.bet;
        }
      }
    }
  }
  else{ //if player is broke then the screen will turn black (restart program to start again)
    background(0);
    scale(1);
    fill(255);
    textSize(50);
    text("You've gone broke!",650,500);
  }
}
