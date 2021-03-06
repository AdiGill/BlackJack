String[] allImages = {"2C","2D","2H","2S","3C","3D","3H","3S","4C","4D","4H","4S","5C","5D","5H","5S","6C","6D","6H","6S","7C","7D","7H","7S","8C","8D","8H","8S","9C","9D","9H","9S","10C","10D","10H","10S","AC","AD","AH","AS","JC","JD","JH","JS","QC","QD","QH","QS","KC","KD","KH","KS"};

void loadImages(PImage[] img){
  for(int f = 0;f<allImages.length;f++){
    img[f] = loadImage(allImages[f] + ".png");
  }

}
void drawStack(float x,float y,int frame){
  image(back,x-frame*2,y-frame*2);

}
int checkNum(int cn){
  int cardN;
  String[] curNum = allImages[cn].split("");
  
  if(cn>51-12)
    cardN = 10;
  else if(cn>51-12-4){
    if(p1.total>11 && p1.numCards > 0)
      cardN = 1;
    else
      cardN = 11;
    
  }
  else{
      if(int(curNum[0]) == 1)
        cardN = 10;
      else
        cardN = int(curNum[0]);
  }
  return(cardN);
}
int c1x = 1000;
int c1y = 650;
int c2x = 1000;
int c2y = 650;
int sp = 200;

void dealAnimate(PImage curCard,PImage curCard1){
  
 if(c1x<3600 || c2x<4100){
   image(back,c1x,c1y);
   image(back,c2x,c2y);
   c1x+=sp;
   c1y+=sp;
   c2x+=sp*1.25;
   c2y+=sp;
 } 
 else{
 finished = true;
  
}
}

void drawChips(){
  scale(6);
  int numChips = p1.bet/100;
  int chipx = 200;
  for(int d = 0; d<numChips;d++){
      image(chips,chipx+857,655-d*6);

  }

}

void drawName(){
  fill(255);
  textSize(175);
  text(name+":",100,5000);
  text("Dealer:",100,250);
  
}
void updateHint(){
  if(deal == false){
     curHint = "Press Deal Cards";
  }
  else if(gOver == true)
    curHint = "Press Deal Cards To Reset";
    
  else if(hitter == false)
    curHint = "Place a bet";
  else if(hitter == true){
    if(hitt<1)
      curHint = "Press hit to add to your card total or stand to pass your turn";
    else
      curHint = "Press hit to add to your card total or stand to pass your turn(or double down to double your bet)";
  }
  else if(broke)
    curHint = "You've gone broke! come back with money >:(";
    
  
  
}

void drawAmount(){
  textSize(75);
  text(name+"'s Balance: $"+ amount,100,4500);

}
