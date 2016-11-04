SpaceShip boat = new SpaceShip();//your variable declarations here

Star[] shine;

public void setup() 
{
  size(1000,1000);
  
  shine = new Star[250];
  for(int i = 0; i < shine.length; i++)
  {
    shine[i] = new Star();
  }
}

public void draw() 
{
  background(0);
  boat.show();
  boat.move();
  for(int i = 0 ; i < shine.length; i++)
  {
    shine[i].appear();
  }
}

class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
  corners = 6;  //the number of corners, a triangular floater has 3   
  xCorners = new int[corners];   
  yCorners = new int[corners];
  xCorners[0] = 25;
  yCorners[0] = 0;
  xCorners[1] = 0;
  yCorners[1] = -10;
  xCorners[2] = -10;
  yCorners[2] = -5;
  xCorners[3] = -1;
  yCorners[3] = 0;
  xCorners[4] = -10;
  yCorners[4] = 5;
  xCorners[5] = 0;
  yCorners[5] = 10;
  myColor = color(46,245,255);    
  myCenterX = 500;
  myCenterY = 500;
  myDirectionX = 0;
  myDirectionY = 0;
  myPointDirection = 0/PI;
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return (int)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (int)myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return (int)myPointDirection;} 
}

  // public void hyperspace()
  //   {
  //     boat.myCenterX = (Math.random()*401)+100;
  //     boat.myCenterY = (Math.random()*401)+100;
  //     boat.accelerate = 0;
  //   }

  public void keyPressed()
  {
    if(key == 'a'){boat.rotate(-5);}
    if(key == 'd'){boat.rotate(5);}
    if(key == 'w'){boat.accelerate(.5);}
    if(key == 's'){boat.accelerate(-.5);}
    if(key == 'q')
      {
        boat.setX((int)(Math.random()*1000));
        boat.setY((int)(Math.random()*1000));
        boat.setDirectionX(0);
        boat.setDirectionY(0);
      }
    //if(key == 'spacebar') {;}
  }

class Star
{
  int myX,myY;
  public Star()
  {
  myX = (int)(Math.random()*900);
  myY = (int)(Math.random()*900);
  }
  public void appear()
  {
  fill(((int)Math.random()*16)+240,255,(int)Math.random()*256);
  stroke(0);
  ellipse(myX,myY,7,7);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 


  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 