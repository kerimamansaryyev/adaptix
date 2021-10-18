class Resizer<T>{

 late final T _xSmall;
 late final T _small;
 late final T _medium;
 late final T _large;
 late final T _xlarge;
 late final double totalWidth;
 late final T value;

  T _invoke(){
     if(totalWidth <= 380 ){
       return _xSmall;
     }
     else if(totalWidth>380 && totalWidth <= 414){
       return _small;
     }
     else if(totalWidth>414 && totalWidth<=600){
       return _medium;
     }
     else if(totalWidth>600 && totalWidth<=800){
       return _large;
     }
     else{
       return _xlarge;
     }
  }

  Resizer({T? xSmall ,required T small, T? medium, T? large, T? xlarge,required this.totalWidth }):
    _xSmall = xSmall ?? small,
    _small = small,
    _medium = medium ?? small,
    _large = large ?? small,
    _xlarge = xlarge ?? small
    {
      value = _invoke();
    }

}