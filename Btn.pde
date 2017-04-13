//Définition de la classe Btn, donc de ses proprités
class Btn{

  PVector location;
  int mWidth, mHeight;
  color couleur;
  int alpha;
  int id;
  
  Btn(float _x, float _y, int _mWidth, int _mHeight, color _couleur, int _id){
  
    location = new PVector(_x, _y);
    mWidth = _mWidth;
    mHeight = _mHeight;
    couleur = _couleur;
    alpha = 0;
    id = _id;
  }
  
  void isHit(){
    
    if(alpha < 255){
    alpha++;
    } else if (alpha == 255){
      console.updateMessage(str(id));
      console.testCombinaison();
      alpha = 0;
    } 
  }
  void isNotHit(){
  
    if(alpha>0){
      alpha--;
    }
  }
  void display(){
    noStroke();
    fill(couleur, alpha);
    rect(location.x, location.y, mWidth, mHeight);
  }
}
