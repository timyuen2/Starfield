Particle [] bob = new Particle[200];
void setup()
{
	size(700,700);
	for( int i = 0; i < bob.length; i++)
		bob[i] = new NormalParticle();
	bob[0] = new JumboParticle();
	bob[1] = new OddballParticle();
}
void draw()
{
	background(0);
	for(int i = 0; i < bob.length; i++)
	{
	bob[i].move();
	bob[i].show();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, myAngle;
	int myColor;
	NormalParticle()
	{
		myX = 350;
		myY = 350;
		mySpeed = (int)(Math.random()*7+5); 
		myAngle = (Math.random()*2*PI);
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
	}
	public void show(){
		fill(myColor);
		ellipse((int)myX,(int)myY,20,20);

	}
	public void move() {
	myX = myX + Math.cos(myAngle)*mySpeed;
	myY = myY + Math.sin(myAngle)*mySpeed;
	if(myX <50 || myX >650 ||myY <50 || myY >650)
	{
		mySpeed = -mySpeed;
		
	}
	else if(myX == 350 || myY == 350){
		mySpeed = -mySpeed;
	}
	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;

	OddballParticle()
	{
		myX = 500;
		myY = 500;
		mySpeed = (int)(Math.random()*7+5); 
		myAngle = (int)(Math.random()*2*PI);
	}
		public void move()
		{
			myX = myX + Math.cos(myAngle)*mySpeed;
			myY = myY + Math.cos(myAngle)*mySpeed;
			myAngle = myAngle + .1;
			if(myX == 350 || myY == 350)
			
				mySpeed = -mySpeed;
			
		}

		public void show()
		{
			rect((int)myX,(int)myY,(int)myX-450,(int)myY-450);
		}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		ellipse((int)myX,(int)myY,50,50);
	}
}
