SpaceShip boat = new SpaceShip();//your variable declarations here
ArrayList<Asteroids> rock;
Star[] shine;
ArrayList<Bullet> bob;

public void setup() 
{
  size(800,800);
  shine = new Star[200];
  for(int i = 0; i < shine.length; i++)
  {
    shine[i] = new Star();
  }

  rock = new ArrayList<Asteroids>();
  for(int j = 0; j < 15; j++)
  {
    rock.add(new Asteroids());
  }

  bob = new ArrayList<Bullet>();
}

public void draw() 
{
  background(0);
  //int score = 0; 

  boat.show();
  boat.move();

  for(int i = 0 ; i < shine.length; i++)
  {
    shine[i].appear();
  }  

  for(int j = 0; j < rock.size(); j++)
  {
  rock.get(j).show();
  rock.get(j).spin();
  rock.get(j).move();
  if(dist(boat.getX(), boat.getY(), rock.get(j).getX(), rock.get(j).getY()) < 25)
    {
    rock.remove(j);
    rock.add(new Asteroids());
    }
  }

  for(int m = 0; m < bob.size(); m++)
  {
    bob.get(m).show();
    bob.get(m).move();
  }
  for(int l = rock.size()-1; l >= 0; l--)
    {
    for(int k = bob.size()-1; k >= 0; k--)
      {
      if(dist(rock.get(l).getX(), rock.get(l).getY(), bob.get(k).getX(), bob.get(k).getY()) < 25)
        {
        rock.remove(l);
        rock.add(new Asteroids());
        bob.remove(k);
        //score = score + 10;
        break;
        }
      }
    }
 // fill(255);
  //text(score,50,50,20); 
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
  myCenterX = 400;
  myCenterY = 400;
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
    if(key == 'k' && frameCount % 7 == 0){bob.add(new Bullet());}
    //if(key == 'k'){bob.add(new Bullet());}
  }
  
class Star
{
  int myX,myY;
  public Star()
  {
  myX = (int)(Math.random()*800);
  myY = (int)(Math.random()*800);
  }
  public void appear()
  {
  fill(((int)Math.random()*16)+240,255,(int)Math.random()*256);
  noStroke();
  ellipse(myX,myY,7,7);
  }
}

class Asteroids extends Floater
{
  private int spinaround = (int)(Math.random()*20)-10;
  private int soar = (int)(Math.random()*20)-10;
  public Asteroids()
  {
  corners = 10;  //the number of corners, a triangular floater has 3   
  xCorners = new int[corners];   
  yCorners = new int[corners];
  xCorners[0] = 45;
  yCorners[0] = 0;
  xCorners[1] = 30;
  yCorners[1] = -15;
  xCorners[2] = 10;
  yCorners[2] = -22;
  xCorners[3] = 22;
  yCorners[3] = -15;
  xCorners[4] = 12;
  yCorners[4] = -27;
  xCorners[5] = -5;
  yCorners[5] = -15;
  xCorners[6] = -15;
  yCorners[6] = -7;
  xCorners[7] = -3;
  yCorners[7] = 15;
  xCorners[8] = -2;
  yCorners[8] = 22;
  xCorners[9] = 30;
  yCorners[9] = 15;
  myColor = color(118,141,148);    
  myCenterX = Math.random()*801;
  myCenterY = Math.random()*801;
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
  public void spin(){myPointDirection+=spinaround;}   
  public void move()
  { 
    if(spinaround >= 0)
    {
      myDirectionX = ((Math.random()*5)+3);
      myDirectionY = ((Math.random()*5)+3);
    }
    else
    {
      myDirectionX = -((Math.random()*5)+3);
      myDirectionY = -((Math.random()*5)+3);
    }
    // myCenterX+= soar;
    // myCenterY+= soar;
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;      
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
}

abstract class Floater //Do NOT modify the Floater class! Make changes to the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing to degrees    
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


  //Accelerates the floater to the direction it is pointing (myPointDirection)   
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
  //move the floater to the current direction of travel
  public void move ()
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