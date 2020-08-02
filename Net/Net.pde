float t = 0;
float dTime = 0.0001;
NodeSet nodes;
int circleSize = 10;
float maxSpeed = 20;
float perceptionRadius = 150;

void setup()
{
  fullScreen();
  nodes = new NodeSet(250);
}

void draw()
{
  background (0);
  nodes.update();
  nodes.draw();
  t += dTime;
}
