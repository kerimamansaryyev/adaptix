library adaptix;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
export 'package:adaptix/adaptix.dart';
part 'package:adaptix/src/models/sizing.dart';
part 'package:adaptix/src/models/resizer.dart';
part 'package:adaptix/src/widgets/initializer.dart';

EdgeInsets get systemPadding => _Sizing.systemPadding;
double get systemAspectRatio => _Sizing.aspectRatio;

extension SizingExtendsion on num{

  double get orientationWidth => _Sizing._blocksizeHorizontal*this;

  double get orientationHeight => _Sizing._blockSizeVertical*this;

  double adaptedPx({bool useIphoneScaleFactor = true}){
    var isIphoneSizeFactor = Platform.isIOS && useIphoneScaleFactor? 1.12: 1.0;
    return this*Resizer<double>(
      xSmall: 1*isIphoneSizeFactor,
      small: 1.1*isIphoneSizeFactor, 
      medium: 1.15*isIphoneSizeFactor, 
      large: 1.2*isIphoneSizeFactor, 
      xlarge: 1.25*isIphoneSizeFactor,
      totalWidth: _Sizing._screenWidth
    ).value;
  }

}