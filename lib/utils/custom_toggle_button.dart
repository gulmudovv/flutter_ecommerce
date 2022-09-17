void toggButChangeState(int index, List<bool> list){
  for(var i=0; i<list.length; i++){
    list[i]=false;
  }
  list[index] = true;
}