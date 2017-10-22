import ddf.minim.*;
Minim minim;


AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;

PFont police;

PImage constellation;
PImage ficheinfo;
String[] tableauHouseOS = {
  "02 Gypsy Woman (Basement Boy 'Strip To The Bone' Mix).mp3",
  "Angels of Love (Dub From Up Above).mp3",
  "Illusions.mp3"
};

String[] tableauElectro = {
  "04 What's A Girl To Do.mp3",
  "Ballo-Balla.mp3",
  "Computer Love.mp3"
};
String[] tableauTechno = {
  "1-02 Yuko.mp3", 
  "02 Aus (feat. King Aus On The Mic).mp3",
  "02 Peschi.mp3"
};


int bouton1clique;
int bouton2clique;
int bouton3clique;


void setup() {
 
   size(800, 600);
   smooth(2);
   constellation = loadImage("constellation.jpg");
   image(constellation,50,10);
   image(constellation, (width-constellation.width)/2 , (height-constellation.height)/2);
   noFill();
   image(constellation, 0, 0);//background
   minim = new Minim(this);
   int hasard = int(random(tableauHouseOS.length));
   String son = tableauHouseOS[hasard];
   int hasard2 = int(random(tableauElectro.length));
   String son2 = tableauElectro[hasard2];
   int hasard3 = int(random(tableauTechno.length));
   String son3 = tableauTechno[hasard3];
   
   player = minim.loadFile(tableauHouseOS[0]);
   player.pause();
   player2 = minim.loadFile(tableauElectro[1]);
   player2.pause();
   player3 = minim.loadFile(tableauTechno[2]);
   player3.pause();

   
  //background(33, 23, 125);
  
  //  ligne entre house et techno
 
  
  ficheinfo = loadImage("ficheinfo.jpg");
  police = loadFont("OstiaAnticaTrial-Regular.vlw"); textFont(police,14);
   fill(#2049cb);
   //text("CONSTELLATION ÉLECTRONIQUE ", 250, 40);

}
 
 
void draw() {
 
  
      if(bouton1clique==0){
          noStroke();
          fill(251); 
      }else{
          fill(#0a2082);
          stroke(#0a2082);
      }
          ellipse (185, 290, 27, 27);
           

      if(bouton2clique==0){
          noStroke();
          fill(251);
      }else{
          fill(#0a2082);
          stroke(#0a2082);
      }
          ellipse (185, 402, 27, 27);


      if(bouton3clique==0){
          noStroke();
          fill(251);    
      }else{
          fill(#0a2082);
          stroke(#0a2082);
      }
          ellipse (476,323, 27, 27);
          
          
}


void mousePressed(){
  float distance;
  int hasard = int(random(tableauHouseOS.length));
  int hasard2 = int(random(tableauElectro.length));
  int hasard3 = int(random(tableauTechno.length));
  String son = tableauHouseOS[hasard];
  String son2 = tableauElectro[hasard2];
  String son3 = tableauTechno[hasard3];
  
  //-- bouton 1 ----------
  distance=dist(mouseX,mouseY,185, 290);
  if(distance<=16.5){
        if(bouton1clique==0){
          bouton1clique=1;
          player = minim.loadFile(tableauHouseOS[hasard]);
          player.play();
        } else{
          bouton1clique=0;
          player.pause();
        }
    }else{
          bouton1clique=0;
          player.pause();
  }
  
    //-- bouton 2 ----------
  distance=dist(mouseX,mouseY,185, 402);
  if(distance<=16.5){
        if(bouton2clique==0){
          bouton2clique=1;
             player2 = minim.loadFile(tableauElectro[hasard2]);

          player2.play();
        } else{
          bouton2clique=0;
          player2.pause();
        }
    }else{
          bouton2clique=0;
          player2.pause();
  }
  
  //-- bouton 3 ----------
  distance=dist(mouseX,mouseY,476,323);
  if(distance<=16.5){
        if(bouton3clique==0){
          bouton3clique=1;
         player3 = minim.loadFile(tableauTechno[hasard3]);
          player3.play();
        } else{
          bouton3clique=0;
          player3.pause();
        }
        image(ficheinfo, 750, 250);

    }else{
          bouton3clique=0;
          player3.pause();
  }

     
     println (tableauHouseOS[floor(random(tableauHouseOS.length))]);
     println (tableauElectro[floor(random(tableauElectro.length))]);
     println (tableauElectro[floor(random(tableauTechno.length))]);
}
   


    
    
  void stop(){
 
    player.close();
    minim.stop();
    super.stop();
    
    player2.close();
    minim.stop();
    super.stop();
    
    player3.close();
    minim.stop();
    super.stop();
    
  }
