import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';

class Slider extends DisplayObjectContainer {

Slider() {

  var background = BitmapData(400, 50, Color.White);
  var backgroundBitmap = Bitmap(background);
  addChild(backgroundBitmap);

  var foreground = BitmapData(390, 42, Color.Black);
  var foregroundBitmap = Bitmap(foreground);
  addChild(foregroundBitmap);

  var indicatorBg = BitmapData(14, 42, Color.Black);
  var indicatorBgBitmap = Bitmap(indicatorBg);
  addChild(indicatorBgBitmap);

  //indicatorBg.colorTransform(indicatorBg, ColorTransform(4));

  var indicatorFg = BitmapData(5, 34, Color.White);
  var indicatorFgBitmap = Bitmap(indicatorFg);
  addChild(indicatorFgBitmap);

  //30 should be random
  var target = BitmapData(30, 34, Color.Green);
  var targetBitmap = Bitmap(target);
  addChild(targetBitmap);

  backgroundBitmap.pivotX = backgroundBitmap.width / 2;
  backgroundBitmap.pivotY = backgroundBitmap.height / 2;
  backgroundBitmap.x = 100;
  backgroundBitmap.y = 100;

  foregroundBitmap.pivotX = foregroundBitmap.width / 2;
  foregroundBitmap.pivotY = foregroundBitmap.height / 2;
  foregroundBitmap.x = backgroundBitmap.x;
  foregroundBitmap.y = backgroundBitmap.y;

  targetBitmap.pivotX = targetBitmap.width / 2;
  targetBitmap.pivotY = targetBitmap.height / 2;
  targetBitmap.x = backgroundBitmap.x;
  //y should be random inside slider
  targetBitmap.y = backgroundBitmap.y;

  indicatorBgBitmap.pivotX = indicatorBgBitmap.width / 2;
  indicatorBgBitmap.pivotY = indicatorBgBitmap.height / 2;
  indicatorBgBitmap.x = backgroundBitmap.x - 187;
  indicatorBgBitmap.y = backgroundBitmap.y;

  indicatorFgBitmap.pivotX = indicatorBgBitmap.width / 2;
  indicatorFgBitmap.pivotY = indicatorFgBitmap.height / 2;
  indicatorFgBitmap.x = indicatorBgBitmap.x + 4;
  indicatorFgBitmap.y = indicatorBgBitmap.y;

  Tween indicatorBgSlide, indicatorFgSlide;

  html.window.onKeyPress.listen((e) {

    if (e.key == 'c') {
      //start moving indicator
      if (indicatorBgSlide != null) return;
      if (indicatorFgSlide != null) return;
      indicatorBgSlide = stage.juggler.addTween(indicatorBgBitmap, 1.6, Transition.linear);
      indicatorFgSlide = stage.juggler.addTween(indicatorFgBitmap, 1.6, Transition.linear);
      indicatorBgSlide.animate.x.to(indicatorBgBitmap.x + 374);
      indicatorFgSlide.animate.x.to(indicatorFgBitmap.x + 374);
      indicatorBgSlide.onComplete = () => indicatorBgSlide = null;
      indicatorFgSlide.onComplete = () => indicatorFgSlide = null;

      if (e.key == 'v') {
        //stop moving indicator and check if hit target and visual

        //stop todo

        //visual
        var test = BitmapData(10,42,Color.White);
        indicatorBgBitmap = Bitmap(test);

        //if the indicator intersects with the target, true
        bool indicatorHitTarget = indicatorBgBitmap.hitTestObject(targetBitmap);

        if (indicatorHitTarget) {
          //result todo
        }

      }

      //for generating target, setTransform

    }
  });

  }
}