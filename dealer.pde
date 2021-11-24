class Dealer{
  PImage fCard;
  int fc;
  int dTotal;
  PImage[] newdCards;
  int numdCards;
  
  
Dealer(int cIndex){
  this.numdCards = 0;
  this.fc = cIndex;
  this.fCard = img[this.fc];
  this.dTotal+= checkNum(this.fc);
  this.newdCards = new PImage[5];
}




void newdCard(int cIndex){
   newdCards[numdCards] = img[cIndex];
   println(numdCards,newdCards[numdCards]);
   this.numdCards++;
   this.dTotal+= checkNum(cIndex);
   

 }
void drawdHand(){
  image(this.fCard,3700,1000);

}


int cdx = 4200;
 
 void drawNewCards(){
   for(int p = 0;p<this.numdCards;p++){
     image(newdCards[p],cdx+500*p,1000);
   
   }
 }

void drawdTotal(){
  textSize(175);
  fill(255);
  text(this.dTotal, 4800,750 ); 
  
}


}
