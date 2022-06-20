//Declaring gobal variables. 
float houseWidth = width*4;
float houseHeight = height*4;

float roofWidth = houseWidth;
float roofHeight =  houseHeight * .10;

float grassWidth = houseWidth*50;
float grassHeight = houseHeight *.08;

float doorWidth = houseWidth*.15;
float doorHeight = houseHeight*.19;

float knobWidth = doorWidth*.1;
float knobHeight = doorHeight*.075;

float windowWidth = doorWidth *1.2;
float windowHeight = doorHeight * 0.65;

float poleWidth = doorWidth *.1;
float poleHeight = houseHeight*.7;

float flagbaseWidth = poleWidth*7;
float flagbaseHeight = windowHeight*.65;

float blueflagWidth = flagbaseWidth*.40;
float blueflagHeight = flagbaseHeight*.5;

float stripeWidth = blueflagWidth*1.55;
float stripeHeight = blueflagHeight*.3;

//second stripes
float stripeWidth2 = blueflagWidth*2.50;
float stripeHeight2 = blueflagHeight*.3;


//Creating a class named Firework to hold my particle variables.
// Firework code adapted from: https://natureofcode.com/book/chapter-4-particle-systems/

class Firework {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan; //variable for how long the particle has been alive. 

//Assigning Particle values to a pvector: "PVector b".
  Firework (PVector b) {
    acceleration = new PVector(-.01, .01);
    velocity = new PVector(random(-5, 5), random(-5, 5));
    position = b.copy();
    lifespan = 1000; //lifespan of particles. 
  }

  void run() {
    update();
    display();
  }

  // Creating an update function that decreases the lifespan of my particles by 40.  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 40; //decreases lifespan of particles.
  }

  // Creating a display function to print my particle system.
  void display() {
    stroke(500, lifespan);
    fill(#1470DE, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Creating a function to determine if my particles are dead.
  boolean isDead() {
    if (lifespan < 0.0) { //checking for lifespan < 0. 
      return true;
    } else {
      return false;
    }
  }
}

//Creating my particle system: FireworksParticleSystem.

class FireworksParticleSystem {
  ArrayList<Firework> particles;
  PVector origin;

  FireworksParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Firework>();
  }

  void addParticle() {
    particles.add(new Firework(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Firework p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

ArrayList<FireworksParticleSystem> systems;
void setup() {
  size(1000,800);
  systems = new ArrayList<FireworksParticleSystem>();
}

//Creating a mouse function so new systems can populate when I click on my canvas.
void mousePressed() {
  systems.clear();
  color c = color(random(50, 255), random(50, 255), random(50, 255));
  systems.add(new FireworksParticleSystem(new PVector(mouseX,mouseY,c)));
 
}

//Drawing my shapes.
void draw() {
  background(0);
 
//Creating static shapes.   
  fill(#50905B);
  noStroke();
  rect(width/600,height*.96,grassWidth,grassHeight); //Creating grass.
  fill(#7F7F7F);
  rect(width*.29,height*.73,houseWidth,houseHeight); //Creating base of the house.
  //fill(#654321);
  fill(#676767);
  stroke(2);
  triangle(width*.29,height*.73,width/2, height/2, width*.29 + houseWidth, height*.73); //creating the roof.
  fill(45);
  rect(width/2-houseWidth*.085,height/2*1.85, doorWidth,doorHeight); //creating the door for the house. 
  fill(255);
  ellipse(width/2*1.03,height/2*1.92,knobWidth,knobHeight); //creating door knob
  fill(255);
  rect(width/2*.72,height/2*1.6, windowWidth,windowHeight); //creating left window 
  rect(width/2*1.1,height/2*1.6, windowWidth,windowHeight); //creating right window 
  fill(#C0C0C0);
  rect(width/2*.3,height/2*1.6, poleWidth,poleHeight); //creating flag pole
  fill(#ffffff);
  rect(width/2*.3,height/2*1.6, flagbaseWidth,flagbaseHeight); //creating base rect for flag
  fill(#3c3b6e);
  rect(width/2*.3,height/2*1.6, blueflagWidth,blueflagHeight); //creating blue rect on flag
  fill(#b22234);
  rect(width/2*.333,height/2*1.6, stripeWidth,stripeHeight); //red stripes on flag
  rect(width/2*.3,height/2*1.639, stripeWidth2,stripeHeight2); //red stripes on flag(3)
  rect(width/2*.3,height/2*1.62, stripeWidth2,stripeHeight2); //red stripes on flag(2)
  rect(width/2*.3,height/2*1.659, stripeWidth2,stripeHeight2); //red stripes on flag(3)
  fill(#3c3b6e); 
  rect(width/2*.3,height/2*1.6, blueflagWidth,blueflagHeight); //creating blue rect on flag

  
  
  
//Creating a foor loop to add additional particles. 
  for (FireworksParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}
