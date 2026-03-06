void main(){

  Map<String,int> map1={
    "item1":200,
    "item2":300
  };
  calc(map1);
print(map1);
map1.clear();
}

void calc (Map x){
  x.forEach((key, value)
  {
x[key]=value*=2;

  });
}