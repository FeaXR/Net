float t = 0;
final float dTime = 0.0001;
NodeSet nodes;
final int circleSize = 10;
final float maxSpeed = 20;
final float perceptionRadius = 150;
final boolean randomLinkColors = false;
final boolean randomNodeColors = true;

void setup()
{
  fullScreen();
  nodes = new NodeSet(150, randomLinkColors, randomNodeColors);
}

void draw()
{
  background (0);
  nodes.update();
  nodes.draw();
  t += dTime;
}
