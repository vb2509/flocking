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
  
  particles.add( new Particle (190, 100)); 
  particles.get(1).setVelocity(0.1,-0.5);
  particles.get(1).mass=5;
  particles.get(1).radius=15;
  
  particles.add( new Particle (150, 100));
  particles.get(2).setVelocity(0.2,0.1);
   particles.get(2).mass=1;
  particles.get(2).radius=15;
  
  particles.add( new Particle (200, 100));
  particles.get(3).setVelocity(0.5,0.2);
  particles.get(3).radius=15;
  
  particles.add( new Particle (90, 50));
  particles.get(4).setVelocity(0.5,0.2);
  particles.get(4).radius=15;
  
  particles.add( new Particle (250, 60));
  particles.get(5).setVelocity(0.5,0.2);
  particles.get(5).radius=15;

  strokeWeight(1);
  
  
  targetIndex=(int)random(particles.size());
  attractionCoordinate=particles.get(targetIndex).location;
  
}
 
 
void draw() {
  timer++;
  if(timer>1000){
    assignIndex();
    timer=0;
  }
  PVector attractionCoordinate=particles.get(targetIndex).location;
  particles.get(targetIndex).acceleration.setMag(20);
  background(111);
  for(int i=0;i<particles.size();i++){
    particles.get(i).display() ;
    particles.get(i).addForce(World.gravity);

    
    PVector refPos=particles.get(i).location;
    if(dist(attractionCoordinate.x,attractionCoordinate.y,particles.get(i).location.x,particles.get(i).location.y)>150&&i!=targetIndex){
       attractionCoordinate=particles.get(targetIndex).location;
       particles.get(i).acceleration=PVector.sub(attractionCoordinate,refPos).setMag(0.1);
       particles.get(i).velocity.setMag(1);
    }
    else{
      particles.get(i).acceleration.setMag(0);
    }
    for(int j=0;j<particles.size();j++){
      if(i!=j){
        particles.get(i).checkParticleCollision(particles.get(j));
        
      }
    }
  }
  
}
void assignIndex(){
  targetIndex=(int)random(particles.size()); 
  println(targetIndex);
}
