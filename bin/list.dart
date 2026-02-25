void main()
{
  List <int> x=[1,2,3,4,5,6];
  print(x.where((int a){
  if(a>6)
  {
    return true;
  }
  else
  {
    return false;
  }

  }));

}
bool test(int a)
{
  if(a>6)
    {
      return true;
    }
    else
    {
      return false;
    }

}
