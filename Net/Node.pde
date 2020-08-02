class Node
{
  PVector position;
  PVector velocity;
  float xOff;
  float yOff;
  color clr;

  Node()
  {
    int x = int(random(width));
    int y = int(random(height));
    position = new PVector(x, y);
    velocity = new PVector();
    yOff = random(100.1);
    xOff= random(100.5);
    clr = color(random(100, 255), random(100, 255), random(100, 255));
  }

  void update()
  {
    move();
    position.add(velocity);
    edge();
  }

  void draw()
  {
    fill(clr);
    noStroke();
    ellipse(position.x, position.y, circleSize, circleSize);
  }

  void move()
  {
    velocity = new PVector((noise(t*xOff, t)-0.5)*maxSpeed, (noise(t, t*yOff)-0.5)*maxSpeed);
  }

  void edge()
  {
    if (this.position.x > width) 
    { 
      this.position.x = 0;
    } else if (this.position.x < 0)
    { 
      this.position.x = width;
    } 
    if (this.position.y > height) 
    { 
      this.position.y = 0;
    } else if (this.position.y < 0) 
    { 
      this.position.y = height;
    }
  }
}
