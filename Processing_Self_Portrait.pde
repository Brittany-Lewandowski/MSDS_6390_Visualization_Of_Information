//Creating grid and setting my background color. 

void setup() {
    size(800,450);
    background(#ABD8E5); //setting the background of my portrait to light blue 
}

void draw(){
  
  //Defining variables. 
 
  float faceWidth = width * .25;
  float faceHeight = height * .45;
  
  float bottomHairWidth = width * .30;
  float bottomHairHeight = height *  .50;
  
  float topHairWidth = bottomHairWidth;
  float topHairHeight = height * .27;
  
  float ArmWidth = width * .35;
  float ArmHeight = height * .05;
  
  float torsoWidth = width * .40;
  float torsoHeight = height * .60;
  
  float eyeWidth = faceWidth * .20;
  float eyeHeight = faceHeight * .10;
  
  float pupilWidth = eyeWidth *.50;
  float pupilHeight = eyeHeight * .50;
  
  float eyebrowWidth = faceWidth * .20;
  float eyebrowHeight = faceHeight * .05;
  
  float mouthWidth = faceWidth * .40;
  float mouthHeight = faceHeight * .08;
  
  float noseWidth = faceWidth * .10;
  float noseHeight =  faceHeight * .10;
   

//Creating the bottom portion of my hair. 
fill (#4B3E3E); 
noStroke();
rect(width/2 - bottomHairWidth/2, height/2, bottomHairWidth, bottomHairHeight, 12, 24, 48, 72);  

//Creating the top portion of my hair.
fill (#4B3E3E); 
noStroke();
circle(width/2,height/2, topHairWidth);

//Creating my torso. 
fill (#445BC1); //color for my torso
ellipse(width/2,height, torsoWidth, torsoHeight);

//Creating my face.
fill (#E8BEAC); //making my face skin colored. 
noStroke();
circle(width/2,height/2, faceWidth);

//Creating my left eyebrow. 
fill (#4B3E3E);
ellipse(width/2 - eyebrowWidth, faceHeight*.85, eyebrowWidth, eyebrowHeight);

//Creating my right eyebrow. 
fill (#4B3E3E);
ellipse(width/2 + eyebrowWidth, faceHeight*.85, eyebrowWidth, eyebrowHeight);

//Creating the left eyebrow shaper.
fill (#E8BEAC);
ellipse(width/2 - eyebrowWidth, faceHeight*.88, eyebrowWidth*1.5, eyebrowHeight);

//Creating the right eyebrow shaper.
fill (#E8BEAC);
ellipse(width/2 + eyebrowWidth, faceHeight*.88, eyebrowWidth*1.5, eyebrowHeight);

//Creating my left eyeball.
fill (255);
circle(width/2-eyeWidth, faceHeight,eyeWidth);

//Creating my right eyeball.
fill (255);
circle(width/2+eyeWidth, faceHeight,eyeWidth);

//Creating my left pupil.
fill (#644747); // brown color for my eyes
circle(width/2-eyeWidth,faceHeight,pupilWidth); //creating my left eye

//Creating my right pupil/
fill (#644747); // brown color for my eyes
circle(width/2+eyeWidth,faceHeight,pupilWidth); //creating my left eye

//Creating my nose. 
fill (#644747);
triangle(width/2 - noseWidth/2, height/2 + noseHeight/2, width/2, height/2 - noseHeight/2, width/2 + noseWidth/2, height/2 + noseHeight/2);

//Creating my mouth.
noFill (#644747);
arc(width/2, height/1.75, eyeWidth*2, eyeHeight*2, 0, PI, CHORD);

}
