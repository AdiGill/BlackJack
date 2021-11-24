class Player{
  int numCards;
  PImage card1;
  int c1;
  int c2;
  PImage card2;
  int bet;
  int total;

  PImage[] newCards;
  
  
  
 Player(int c1index,int c2index){
   this.numCards = 0;
   this.card1 = img[c1index];
   this.card2 = img[c2index];
   this.c1 = c1index;
   this.c2 = c2index;
   int cardNum1 = (this.c1);
   int cardNum2 = (this.c2);
   int checkNum1 = checkNum(cardNum1);
   int checkNum2 = checkNum(cardNum2);
   println(checkNum1,checkNum2);
   this.total = checkNum1+checkNum2;
   this.bet = 0;
   this.newCards = new PImage[6];

 }
 
 void newCard(int c1index){
   newCards[numCards] = img[c1index];
   println(numCards,newCards[numCards]);
   this.numCards++;
   this.total+= checkNum(c1index);
   

 }
 int crx = 4700;
 
 void drawNewCards(){
   for(int c = 0;c<this.numCards;c++){
     image(newCards[c],crx+500*c,3500);
   
   }
 }
 

 
 void drawHand(){
  image(this.card1,3700,3500);
  image(this.card2,4200,3500);

}
void drawTotal(){
  textSize(175);
  fill(255);
  if(total>=21)
    gOver = true;
  text(this.total, 5300,4750 ); 
  
}
  
void drawBet(){
  text("$"+str(this.bet),6700,4750);

}


  
  

  
  
  
  
}
