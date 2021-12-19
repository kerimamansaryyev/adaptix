library adaptix;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
export 'package:adaptix/adaptix.dart';
part 'package:adaptix/src/models/sizing.dart';
part 'package:adaptix/src/models/resizer.dart';
part 'package:adaptix/src/widgets/initializer.dart';


abstract class Adaptix{
  static EdgeInsets get systemPadding => _Sizing.systemPadding;
  static double get systemAspectRatio => _Sizing.aspectRatio;

  static double xSmallScreenScaleFactor = 1.0;
  static double smallScreenScaleFactor = 1.1;
  static double mediumScreenScaleFactor = 1.15;
  static double largeScreenScaleFactor = 1.2;
  static double xLargeScreenScaleFactor = 1.25;
  static double commonScaleFactor = 1.0;

  ///use under the context of [SizeInitializer] to notify widgets with constant constructors
  static void depend(BuildContext context){
    try {
      Provider.of<_SizingNotifierAdapter>(context, listen: true);
    } catch (e) {
      throw FlutterError('Use method Adaptix.depend only inside build methods under SizeInitializer widget\' context');
    }
  }

}

extension SizingExtendsion on num{

  double get orientationWidth => _Sizing._blocksizeHorizontal*this;

  double get orientationHeight => _Sizing._blockSizeVertical*this;

  double adaptedPx(){
    return this*Resizer<double>(
      xSmall:Adaptix.xSmallScreenScaleFactor*Adaptix.commonScaleFactor,
      small:Adaptix.smallScreenScaleFactor*Adaptix.commonScaleFactor, 
      medium:Adaptix.mediumScreenScaleFactor*Adaptix.commonScaleFactor, 
      large:Adaptix.largeScreenScaleFactor*Adaptix.commonScaleFactor, 
      xlarge:Adaptix.xLargeScreenScaleFactor*Adaptix.commonScaleFactor,
      totalWidth: _Sizing._screenWidth
    ).value;
  }

}