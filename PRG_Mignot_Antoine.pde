// Importation des différentes librairies
import processing.video.*;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import SimpleOpenNI.*;

SimpleOpenNI context;

// Mise en places des player son
AudioPlayer son1;
AudioPlayer son2;
AudioPlayer son3;
AudioPlayer son4;
AudioPlayer son5;
AudioPlayer son6;

Movie myMovie;

//Imporation des différentes classes
SmartPoint sp;
Btn btn0;
Btn btn1;
Btn btn2;
Btn btn3;
Btn btn4;
Btn btn5;
Btn btn6;

//Définition des différentes variables
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

int changement_img = 0;

int interval = 5000;
int interval2 = 2000;
int lastRecordedTime = 0;

Minim minim;
MaConsole console;

void setup(){
  size(750,600);
  
  context = new SimpleOpenNI(this);
  context.setMirror(true);
  context.enableDepth();
  
  sp = new SmartPoint();
  minim = new Minim(this);
  
//Chargement des différentes images
  img0 = loadImage("bouton.jpg");
  img1 = loadImage("dents_de_la_mer.jpg");
  img2 = loadImage("exorciste.jpg");
  img3 = loadImage("indiana_jones.jpg");
  img4 = loadImage("jurassic_park.jpg");
  img5 = loadImage("seigneur_des_anneaux.jpg");
  img6 = loadImage("star_wars.jpg");

//Chargement des différents sons
  son1 = minim.loadFile("dents_de_la_mer.wav");
  son2 = minim.loadFile("exorciste.wav");
  son3 = minim.loadFile("indiana_jones.wav");
  son4 = minim.loadFile("jurassic_park.wav");
  son5 = minim.loadFile("seigneur_des_anneaux.wav");
  son6 = minim.loadFile("star_wars.wav");

//Chargement de la vidéo
  myMovie = new Movie(this, "victoire.mp4");
  
  console = new MaConsole(30,50);

//Définition emplacement des images et boutons
  btn0 = new Btn(275,250,200,100,color(255,0,0), 0);
  btn1 = new Btn(0, 0, 250, 300, color(255,0,0), 1);
  btn2 = new Btn(250, 0, 250, 300, color(0,255,0), 2);
  btn3 = new Btn(500, 0, 250, 300, color(0,0,255), 3);
  btn4 = new Btn(0, 300, 250, 300, color(0,0,255), 4);
  btn5 = new Btn(250, 300, 250, 300, color(0,0,255), 5);
  btn6 = new Btn(500, 300, 250, 300, color(0,0,255), 6);
  
}

void movieEvent(Movie m){
  m.read();
}

void draw(){
//Mise en place des différentes classes
  background(255);
  context.update();

  image(context.depthImage(), 750, 600);

  sp.update();

  btn0.display();
  btn1.display();
  btn2.display();
  btn3.display();
  btn4.display();
  btn5.display();
  btn6.display();
  
  sp.display();
  
  console.display();

//Mise en place de la machine à état
  switch(changement_img){
  default:
    changement_img = 0;
    image(img1, 0, 0, 250, 300);
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img4, 0, 300, 250, 300);
    image(img5, 250, 300, 250, 300);
    image(img6, 500, 300, 250, 300);
    image(img0,275,250,200,100);

  break;

  case 0:
    image(img1, 0, 0, 250, 300);
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img4, 0, 300, 250, 300);
    image(img5, 250, 300, 250, 300);
    image(img6, 500, 300, 250, 300);
    image(img0,275,250,200,100);

    if(millis()-lastRecordedTime>interval2){    
      if(sp.hitTarget(btn0)){
        image(img0,0,0,0,0);  
        changement_img = 1;  
      }
    }
  break;
  
  case 1:
    image(img1, 0, 0, 250, 300);
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img4, 0, 300, 250, 300);
    image(img5, 250, 300, 250, 300);
    image(img6, 500, 300, 250, 300);
    
    son1.play();
    
    if(millis()-lastRecordedTime>interval){    
      if(sp.hitTarget(btn1)){
        son1.close();
        image(img1,0,0,0,0);  
        changement_img = 2;  
      }
    }
  break;
  
  case 2:
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img4, 0, 300, 250, 300);
    image(img5, 250, 300, 250, 300);
    image(img6, 500, 300, 250, 300);
    
    son6.play();
    
    if(millis()-lastRecordedTime>interval){    
      if(sp.hitTarget(btn6)){
        son6.close();
        image(img6,0,0,0,0);  
        changement_img = 3;  
      }
    }
  break;

  case 3:
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img4, 0, 300, 250, 300);
    image(img5, 250, 300, 250, 300);
    
    son4.play();

    if(millis()-lastRecordedTime>interval){    
      if(sp.hitTarget(btn4)){
        son4.close();
        image(img4,0,0,0,0);  
        changement_img = 4;  
      }
    }
  break;
  
  case 4:
    image(img2, 250, 0, 250, 300);
    image(img3, 500, 0, 250, 300);
    image(img5, 250, 300, 250, 300);
    
    son2.play();

    if(millis()-lastRecordedTime>interval){    
      if(sp.hitTarget(btn2)){
        son2.close();
        image(img2,0,0,0,0);  
        changement_img = 5;  
      }
    }
  break;
  
  case 5:
    image(img3, 500, 0, 250, 300);
    image(img5, 250, 300, 250, 300);
    
    son3.play();
    
    if(millis()-lastRecordedTime>interval){
      if(sp.hitTarget(btn3)){
        son3.close();
        image(img3,0,0,0,0);  
        changement_img = 6;  
      }
    }
  break;
  
  case 6:
    image(img5, 250, 300, 250, 300);
    
    son5.play();

    if(millis()-lastRecordedTime>interval){
      if(sp.hitTarget(btn5)){
        son5.close();
        image(img5,0,0,0,0);  
        changement_img = 7;  
      }
    }
  break;

  case 7:
   image(myMovie,0,0, width, height);
   myMovie.play();
  break;
  }
  
  sp.display();

}

//Définition de la fonction stop pour arréter les sons au moment voulu
void stop(){
  son1.close();
  son2.close();
  son3.close();
  son4.close();
  son5.close();
  son6.close();
  minim.stop();
  super.stop();
}


