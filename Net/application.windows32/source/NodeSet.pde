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
