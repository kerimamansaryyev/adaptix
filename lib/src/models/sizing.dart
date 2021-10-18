part of adaptix;

class _Sizing{
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blocksizeHorizontal = 0;
  static late double _blockSizeVertical = 0;
  static late double aspectRatio;
  static late EdgeInsets systemPadding;

  void init( BoxConstraints constraints, Orientation orientation ){
    if( orientation == Orientation.portrait ){
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }
    else{
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }
    _blocksizeHorizontal = _screenWidth/100;
    _blockSizeVertical = _screenHeight/100;

    systemPadding =  MediaQueryData.fromWindow(window).padding;
    aspectRatio =  _blockSizeVertical / _blocksizeHorizontal;
  }
}