
//declare bacteria variables here  
Bacteria [] spiders = new Bacteria [5];
float score = 0;
float oldScore = 0;
float highScore = 0;
 void setup()   
 {     
   size(1280, 650); 
   background(150);
   for(int i = 0; i < spiders.length; i++){
     spiders[i] = new Bacteria((int)(Math.random()*1280), 100);
   }
 }   
 void draw()   
 {    
   background(150);
   
   //stick figure person
   fill(255);
   ellipse(mouseX, mouseY-35, 40, 40); //head
   line(mouseX, mouseY-15, mouseX, mouseY+15); //body
   line(mouseX, mouseY+15, mouseX-10, mouseY+30); //Rleg
   line(mouseX, mouseY+15, mouseX+10,  mouseY+30); //Lleg
   line(mouseX, mouseY, mouseX+10, mouseY-5); //Lhand
   line(mouseX, mouseY, mouseX-10, mouseY-5); //Rhand
   ellipse(mouseX-10, mouseY-35, 1, 1); //Reye
   ellipse(mouseX+10, mouseY-35, 1, 1); //Leye
   ellipse(mouseX, mouseY-25, 15, 5); //mouth
   
   //move and show the bacteria   
   for(int i = 0; i < spiders.length; i++){
     spiders[i].show();
     spiders[i].scurry();
   }
   stroke(255);
   fill(255);
   rect(0, 0, 200, 70);
   stroke(0);
   fill(0);
   textSize(25);
   text("Score: "+score, 10, 20);
   text("Highscore: "+highScore, 10, 45);
   score = round((millis()/1000.0) - oldScore);
 }  
 class Bacteria    
 {
   int spiderX;
   int spiderY;
   int spiderCol;
   Bacteria(int x,int y){
     spiderX = x;
     spiderY = y; 
     spiderCol = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   }
   void show(){
     //noStroke();
     strokeWeight(3);
     line(spiderX, spiderY, spiderX+49, spiderY-42);
     line(spiderX, spiderY, spiderX+75, spiderY-10);
     line(spiderX, spiderY, spiderX+60, spiderY+30);
     line(spiderX, spiderY, spiderX+33, spiderY+48);
     line(spiderX, spiderY, spiderX-49, spiderY-42);
     line(spiderX, spiderY, spiderX-75, spiderY-10);
     line(spiderX, spiderY, spiderX-60, spiderY+30);
     line(spiderX, spiderY, spiderX-33, spiderY+48);
     fill(spiderCol);
     strokeWeight(1);
     ellipse(spiderX, spiderY, 100, 80); //body
     fill(255);
     ellipse(spiderX-20, spiderY-20, 20, 20);
     ellipse(spiderX+20, spiderY-20, 20, 20);
     fill(0);
     ellipse(spiderX-20, spiderY-20, 5, 5); //eyes
     ellipse(spiderX+20, spiderY-20, 5, 5);
     ellipse(spiderX, spiderY+10, 70, 30);
   }
   void scurry(){
     if(mouseX < spiderX){ //spider is to the right of person
        spiderX = spiderX-((int)(Math.random()*15)-3);
     }
     if(mouseX > spiderX){ //spider is to the left of person
        spiderX = spiderX+((int)(Math.random()*15)-3);
     }
     if(mouseY > spiderY){ //spider is above person
        spiderY = spiderY+((int)(Math.random()*15)-3);
     }
     if(mouseY < spiderY){ //spider is under person
        spiderY = spiderY-((int)(Math.random()*15)-3);
     }
     spiderX = spiderX+(int)(Math.random()*7)-3;
     spiderY = spiderY+(int)(Math.random()*7)-3;
     
     if(dist(mouseX, mouseY, spiderX, spiderY) < 10){
       oldScore = millis()/1000.0;
       for(int i = 0; i < spiders.length; i++){
       spiders[i] = new Bacteria((int)(Math.random()*1280), 100);
       }
       if(score > highScore){
       highScore = score;
   }
     }
   }
   
   //lots of java!   
 }    
 void mousePressed(){
   if(score > highScore){
     highScore = score;
   }
   oldScore = millis()/1000.0;
 }
