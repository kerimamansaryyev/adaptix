import 'dart:io';
import 'dart:ui';

import 'package:adaptix/src/models/resizer.dart';
import 'package:flutter/material.dart';

class Sizing{
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

extension SizingExtendsion on num{

  double get orientationWidth => Sizing._blocksizeHorizontal*this;

  double get orientationHeight => Sizing._blockSizeVertical*this;

  double adaptedPx({bool useIphoneScaleFactor = true}){
    var isIphoneSizeFactor = Platform.isIOS && useIphoneScaleFactor? 1.12: 1.0;
    return this*Resizer<double>(
      xSmall: 1*isIphoneSizeFactor,
      small: 1.1*isIphoneSizeFactor, 
      medium: 1.15*isIphoneSizeFactor, 
      large: 1.2*isIphoneSizeFactor, 
      xlarge: 1.25*isIphoneSizeFactor,
      totalWidth: Sizing._screenWidth
    ).value;
  }

}