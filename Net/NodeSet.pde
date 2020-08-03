class NodeSet
{
  Node[] n;
  int count;
  boolean randomLinkColor;
  boolean randomNodeColor;

  NodeSet(int _count, boolean _randomLinkColor, boolean _randomNodeColor)
  {
    count = _count;
    n = new Node[count];
    randomLinkColor = _randomLinkColor;
    randomNodeColor = _randomNodeColor;
    for (int i = 0; i < count; i++)
    {
      n[i] = new Node(randomNodeColor);
    }
  }

  void update()
  {
    for (int i = 0; i < count; i++)
    {
      n[i].update();
    }
  }

  void draw()
  {
    for (int i = 0; i < count; i++)
    {
      for (int j = 0; j < count; j++)
      {
        if (dist(n[i].position.x, n[i].position.y, n[j].position.x, n[j].position.y) < perceptionRadius && i!= j)
        {
          if (randomLinkColor)
          {
            stroke(map(n[i].position.x, 0, width, 0, 500), map(dist(n[i].position.x, n[i].position.y, n[j].position.x, n[j].position.y), 0, perceptionRadius, 0, 255), map(n[j].position.y, 0, height, 0, 255));
          } else
          {
            stroke(average(n[i].clr, n[j].clr));
          }
          line(n[i].position.x, n[i].position.y, n[j].position.x, n[j].position.y);
        }
      }

      n[i].draw();
    }
  }
}

color average(color a, color b)
{
  float red = (red(a) + red(b))/2;
  float green = (green(a) + green(b))/2;
  float blue = (blue(a) + blue(b))/2;

  return color(red, green, blue);
}
