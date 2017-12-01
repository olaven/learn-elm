



//impure function
/*
  Affects count -> has sideffects
  Returns no value
  Takes no parameters
*/
let count
function increment(){
  increment++;
}

//pure version
function increment(x){
  return x++;
}
