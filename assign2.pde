PImage start1,start2,img1,img2,enemy,fighter,hp,treasure,end1,end2;
int g1,g2,fx,fy,ex,ey,tx,ty,lift,gameState;
final int GAMESTART=0,GAMERUN=1,GAMELOSE=2;
boolean up=false,down=false,left=false,right=false;
void setup () 
{
  size(640,480);
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  img1=loadImage("img/bg1.png");
  img2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png"); 
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  gameState=GAMESTART;
  g1=0;
  g2=640;
  fx=width-50; 
  fy=height/2-25;
  tx=floor(random(550));
  ty=floor(random(440));
  ey=floor(random(440));
  ex=-60;
  lift=40;
}
void draw() 
{
  switch(gameState)
  {
    case GAMESTART:
    if(mouseX>205&&mouseX<460&&mouseY>375&&mouseY<420)
    {
      image(start1,0,0);
      if(mousePressed)
        gameState=GAMERUN;
    }
    else
      image(start2,0,0);
    break;
    case GAMERUN:
    ex%=640;
    g1%=1280;
    g2%=1280;
    image(img1,-640+g1,0);
    image(img2,-640+g2,0);
    ex+=2;
    if(ex+60>fx&&fx+50>ex&&ey+60>fy&&fy+50>ey)
    {
      ex=-60;
      lift-=40;
      if(lift<=0)
        gameState=GAMELOSE;
    }
    if(ey+5<fy)
      ey++;
    else
      ey--;
    image(enemy,ex,ey);
    if(up&&fy>=0)
      fy-=3;
    if(down&&fy<height-50)
      fy+=3;
    if(left&&fx>=0)
      fx-=3;
    if(right&&fx<width-50)
      fx+=3;
    image(fighter,fx,fy);
    g1+=1;
    g2+=1;
    if(fx<tx+40&&tx<fx+50&&fy<ty+40&&ty<fy+50)
    {
      tx=floor(random(550));
      ty=floor(random(400));
      if(lift<200)
        lift+=20;
    }
    image(treasure,tx,ty);
    fill(250,0,0);
    rect(5,5,lift+5,20);
    image(hp,2,2);
    break;
    case GAMELOSE:
    fx=width-50;
    fy=height/2-25;
    tx=floor(random(600));  
    ty=floor(random(440));
    ey=floor(random(440));
    ex=-60;
    lift=40;
    if(205<mouseX&&mouseX<440&&305<mouseY&&mouseY<350)
    {
      image(end1,0,0);
      if(mousePressed)
        gameState=GAMERUN;
    }
    else
      image(end2,0,0);
    break;
  } 
}
void keyPressed()
{
  if(key==CODED)
  {
    switch(keyCode)
    {
      case UP:
      up=true;
      break;
      case DOWN:
      down=true;
      break;
      case LEFT:
      left=true;
      break;
      case RIGHT:
      right=true;
      break;   
    }
  }
}
void keyReleased()
{
  if(key==CODED)
  {
    switch(keyCode)
    {
      case UP:
      up=false;
      break;
      case DOWN:
      down=false;
      break;
      case LEFT:
      left=false;
      break;
      case RIGHT:
      right=false;
      break;   
    }
  }
}
