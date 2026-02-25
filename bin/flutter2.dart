void main() {

calculate(sum);

}
void calculate (int Function(int x1,int x2) operation){
  print(operation(10,50));
}
int sum(int x1, int x2){
  return x1+x2;
}
int multiply(int x1, int x2)=>x1*x2;