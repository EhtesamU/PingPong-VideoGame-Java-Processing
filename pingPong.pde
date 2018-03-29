float ballX=20;
float ballY=20;
float ballR=10;
float dX=random(1,2);
float dY=random(1,2);
float paddleX;
float paddleY=10;
float paddleH=30;
float paddleW=10;
void setup(){
  size(400,400);
  paddleX= width-15;
  frameRate(40);
}
void draw(){
    background(0);
    fill(255);
    ellipse(ballX,ballY,2*ballR,2*ballR);
    
    rect(paddleX,paddleY,paddleW,paddleH);
    
    if(ballRight()>width){
      fill(255);
      rect(0,0,width,height);
      textSize(50);
      fill(0);
      text("End Game",80,200);
      noLoop();
    }
    
    if(collision()){
      dX=-dX;
    }
    if(ballLeft()<0){
      dX=-dX;
    }
    if(ballBottom()>height){
      dY=-dY;
    }
    if(ballTop()<0){
      dY=-dY;
    }
    
    ballX=ballX+dX;
    ballY=ballY+dY;
}
boolean collision(){
  boolean returnValue=false; //assume there is no collision
  
  if((ballRight() >= paddleX) && (ballLeft() <=paddleX+paddleW)) {
   
      if((ballBottom()>=paddleY) && (ballTop()<=paddleY+paddleH)){
      returnValue= true;
    }
  }
  return returnValue;
}
float ballLeft(){
  return ballX-ballR;
}
float ballRight(){
  return ballX+ballR; 
}
float ballTop(){
  return ballY-ballR;
}
float ballBottom(){
  return ballY+ballR;
}


//based on code reference of
//https://processing.org/reference/keyCode.html

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      if(paddleY >=0){
      paddleY=paddleY-paddleH*0.2;
    }}
    else if(keyCode==DOWN){
      if(paddleY <=height - paddleH){
      paddleY=paddleY+paddleH*0.2;
    }
    
  }}
}
void mouseMoved(){
  paddleY=mouseY;
}