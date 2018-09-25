ArrayList<Particle> particles=new ArrayList<Particle>();
PVector attractionCoordinate;
 // short and quick definition

int timer=0;
 

int targetIndex;

void setup() {
  size(500,500);
  background(111);
  
  
  
  particles.add( new Particle (100, 50));
  particles.get(0).setVelocity(0,0.5);
  particles.get(0).mass=2;
  particles.get(0).radius=15;
  
  particles.add( new Particle (20, 400)); 
  particles.get(1).setVelocity(0.1,-0.5);
  particles.get(1).mass=5;
  particles.get(1).radius=15;
  
  particles.add( new Particle (150, 300));
  particles.get(2).setVelocity(0.7,0.1);
   particles.get(2).mass=1;
  particles.get(2).radius=15;
  
  particles.add( new Particle (200, 200));
  particles.get(3).setVelocity(1,0.2);
  particles.get(3).radius=15;
  
  particles.add( new Particle (90, 400));
  particles.get(4).setVelocity(2,0.2);
  particles.get(4).radius=15;
  
  particles.add( new Particle (250, 60));
  particles.get(5).setVelocity(3,0.2);
  particles.get(5).radius=15;

  strokeWeight(1);
  
  
  targetIndex=(int)random(particles.size());
  attractionCoordinate=particles.get(targetIndex).location;
}
 
 
void draw() {
  timer++;
  if(timer>100){
    assignIndex();
    timer=0;
  }
  PVector attractionCoordinate=particles.get(targetIndex).location;
  particles.get(targetIndex).velocity.limit(0.1);
  background(111);
  for(int i=0;i<particles.size();i++){
    if(i==targetIndex)
      fill(255,0, 0);
    else
      fill(255, 255, 255);
    particles.get(i).display() ;
    particles.get(i).addForce(World.gravity);

    
    PVector refPos=particles.get(i).location;
    if(i!=targetIndex){
       
       attractionCoordinate=particles.get(targetIndex).location;
       particles.get(i).acceleration=PVector.sub(attractionCoordinate,refPos).limit(0.1);
       particles.get(i).velocity.limit(1);
    }
    
 
    particles.get(targetIndex).velocity.limit(10);
   
    for(int j=0;j<particles.size();j++){
      if(i!=j&&i!=targetIndex){
        particles.get(i).checkParticleCollision(particles.get(j));
        
      }
    }
  }
  
}
void assignIndex(){
  targetIndex=(int)random(particles.size()); 
  //particles.get(targetIndex).velocity.mult(random(5,10));
  //particles.get(targetIndex).setVelocity(new PVector(100,100));
  particles.get(targetIndex).setVelocity(2,0.2);
  println(targetIndex);
}
