class Bullet extends Floater
{
	double dRadians;
	public Bullet()
	{
		corners = 4;  //the number of corners, a triangular floater has 3
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = 10;
		yCorners[0] = 1;
		xCorners[1] = 10;
		yCorners[1] = -1;
		xCorners[2] = -10;
		yCorners[2] = -1;
		xCorners[3] = -10;
		yCorners[3] = 1;
		myColor = color(255,0,0);
		myCenterX = boat.getX();
	    myCenterY = boat.getY();
		myPointDirection = boat.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + boat.myDirectionX;
		myDirectionY = 5 * Math.sin(dRadians) + boat.myDirectionY;

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
	public void move()
	{
		myCenterX += myDirectionX;
	    myCenterY += myDirectionY;
	}
}