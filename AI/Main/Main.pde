import java.util.Iterator;
ArrayList<Drone> list = new ArrayList();
float gravity = 0.1;
public static Drone lastSurvived;
void setup(){
  size(1000,500);
  background(#FFFFFF);
  fill(#0D0606);
  rect(1,470,1000,30);
  createGenerations();
  
}

void createGenerations(){
    for(int i = 0; i<99;i++){
   Drone drone = new Drone(random(0,width/2),random(0,height/2));
   drone.setAForce(10);
   drone.setBForce(10);
   drone.setAPower(random(0,10));
   drone.setBPower(random(0,10));
   drone.calc();
     list.add(drone);
    }
}
void enableGravity(Drone drone){
  float y = drone.getY();
  float speed = drone.getSpeed();
  float rotation = abs(drone.getRotation());
  y = rotation == 0 ? y + speed : y+speed + rotation*30; 
 // y = y + speed;
  speed = speed + gravity;
  if(y > height){
    speed = speed * -0.95;
    y = height;
  }
  drone.setY(y);
  drone.setSpeed(speed);
  drone.draw();
   drone.removeTraits();
}
void draw(){
  textSize(30);
  textAlign(LEFT);
  fill(#000000);
  String str = "Size: " + list.size();
  text("Size: " + list.size(), 600, 50);
  
   fill(#FFFFFF);
   stroke(#FFFFFF);
   text(str, 600, 50);
 for(Iterator<Drone> it = list.iterator(); it.hasNext();){
   Drone drone = it.next();
   enableGravity(drone);
   if(list.size() == 1){
       lastSurvived = drone;
       exit();
   }
   if(drone.isDead()){
       drone.setDead(true);
       it.remove();
   }
 }
  /* 
  r++;
    translate(width/2,height/2);
     rectMode(CENTER);
    rotate(radians(r));//시계 방향
  fill(255,180,150);
     rect(0,0,50,10);
     */
     
}

public static float forceToRadians(float force){
  float k = 2.3;//상수
  return radians(force*k);
}
class Drone{
  private float rotation;
  private float w,h;
  private float speed;
  private float x,y,x_,y_;
  private boolean dead;
  private float aforce,bforce;
  private float apower,bpower;
  private float aresist,bresist;
  private float ax,bx;
  public Drone setDead(boolean flag){
    this.dead = flag;
      if(flag){
       fill(255,#000000);
       stroke(#000000);
        rect(x,y,50,10);
     }
       return this;
  }
   public float getSpeed(){
    return speed;
  }
     public float getRotation(){
    return rotation;
  }
  public Drone removeTraits(){
   if((y-10) < 470){
    float l = abs(y_ - y);
    fill(#FFFFFF);
    stroke(#FFFFFF);
    rectMode(CENTER);
    rect(x,y_,50,l);    
 }
    return this;
  }
   public Drone setSpeed(float speed){
   this.speed = speed;
     return this;
  }
  public float getAForce(){
    return aforce;
  }
  public float getBForce(){
    return bforce;
  }
  public float getAPower(){
    return apower;
  }
  public float getBPower(){
    return bpower;
  }
  public float getAResist(){
    return aresist;
  }
  public float getX(){
    return x;
  }
    public float getY(){
    return y;
  }
  
  public float getBResist(){
    return bresist;
  }
  public Drone setAX(float ax){
    this.ax = ax;
    return this;
  }
   public Drone setBX(float bx){
    this.bx = bx;
    return this;
  }
    public Drone setX(float x){
     x_ = this.x;
    this.x = x;
    return this;
  }
   public Drone setY(float y){
     y_ = this.y;
    this.y = y;
    return this;
  }
  public Drone setAForce(float aforce){
    this.aforce = aforce;
    return this;
  }
   public Drone setBForce(float bforce){
    this.bforce = bforce;
    return this;
  }
  public boolean isDead(){
    if((x >= width) || (y >= height-10)){
      return true;
    }
    return dead;
  }
  public Drone(float x, float y){
    this.x = x;
    this.y = y;
    y_ = y;
    x_ = x;
  }
  public Drone setAPower(float apower){
    this.apower = apower;
    return this;
  }
   public Drone setBPower(float bpower){
    this.bpower = bpower;
    return this;
  }
  public Drone setPos(float x,float y){
      this.x = x;
      this.y = y;
      return this;
  }
  public void calc(){
      aresist = apower - aforce;
      bresist = bpower - bforce;
      if(abs(aresist) > abs(bresist)){
        translate(width/2,height/2);
       rectMode(CENTER);
       rotation = forceToRadians(aresist);
      rotate(rotation);//시계 방향
      fill(#0D0606);
         rect(x,y,50,10);
          //a 쪽 우세
      }else{
               translate(width/2,height/2);
       rectMode(CENTER);
             rotation = forceToRadians(aresist);
      rotate(rotation);//시계 방향
        fill(255,180,150);
     rect(0,0,50,10);
        //b쪽 우세
      }
  }
  public void draw(){
  //  ax = x - 49;
//    bx = x + 49;
    //rotate(forceToRadians());//반시계 방향
 
    fill(#0D0606);
    stroke(#0D0606);
//이전 자리 흰색으로 채움
    rectMode(CENTER);
    rect(x,y,50,10);
  }
  
}
