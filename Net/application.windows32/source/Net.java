import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Net extends PApplet {

float t = 0;
float dTime = 0.0001f;
NodeSet nodes;
int circleSize = 10;
float maxSpeed = 20;
float perceptionRadius = 150;

public void setup()
{
  
  nodes = new NodeSet(250);
}

public void draw()
{
  background (0);
  nodes.update();
  nodes.draw();
  t += dTime;
}


class Node
{
  PVector position;
  PVector velocity;
  float xOff;
  float yOff;
  int clr;

  Node()
  {
    int x = PApplet.parseInt(random(width));
    int y = PApplet.parseInt(random(height));
    position = new PVector(x, y);
    velocity = new PVector();
    yOff = random(100.1f);
    xOff= random(100.5f);
    clr = color(random(100, 255), random(100, 255), random(100, 255));
  }

  public void update()
  {
    move();
    position.add(velocity);
    edge();
  }

  public void draw()
  {
    fill(clr);
    noStroke();
    ellipse(position.x, position.y, circleSize, circleSize);
  }

  public void move()
  {
    velocity = new PVector((noise(t*xOff, t)-0.5f)*maxSpeed, (noise(t, t*yOff)-0.5f)*maxSpeed);
  }

  public void edge()
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
class NodeSet
{
  Node[] n;
  int count;

  NodeSet(int _count)
  {
    count = _count;
    n = new Node[count];

    for (int i = 0; i < count; i++)
    {
      n[i] = new Node();
    }
  }

  public void update()
  {
    for (int i = 0; i < count; i++)
    {
      n[i].update();
    }
  }

  public void draw()
  {
    for (int i = 0; i < count; i++)
    {
      n[i].draw();
      for (int j = 0; j < count; j++)
      {
        if (dist(n[i].position.x,n[i].position.y, n[j].position.x,n[j].position.y) < perceptionRadius && i!= j)
        {
          stroke(map(n[i].position.x, 0, width, 0, 500), map(dist(n[i].position.x,n[i].position.y, n[j].position.x,n[j].position.y), 0, perceptionRadius, 0,255), map(n[j].position.y, 0, height, 0, 255));
          line(n[i].position.x,n[i].position.y, n[j].position.x, n[j].position.y);
        }
        //ellipse(200,200,30,30);
      }
    }
  }
}

  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Net" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
