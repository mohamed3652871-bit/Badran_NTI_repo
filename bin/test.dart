
void main(){
  List x = [1,2,3];
  List z =[];

  x.forEach((element) {
    z.add(element);
  });

  calc(x);
  calc(List.from(x));
  print(x);
//-----------------------------------
  Map m = {"name1": "ali"};
  calc2(Map.from(m));
  print(m);

  int s = 10;
  s = calc1(s);
  print(s);
}


int calc1(int s){
  return ++s;
}
void calc2(Map x){
  x.addAll({"name2": "ahmed"});
  print (x);
}
void calc(List x){
  x.add(4);
}