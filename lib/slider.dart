import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';

class Slider extends DisplayObjectContainer {

var sliderBackground;
var sliderForeground;
var target;
var indicatorBackground;
var indicatorForeground;
bool looping = false;
Tween moveIndicatorBackground, moveIndicatorForeground;

Slider() {

  sliderBackground = Bitmap(BitmapData(400, 50, Color.White, 4));
  sliderBackground.pivotX = sliderBackground.width / 2;
  sliderBackground.pivotY = sliderBackground.height / 2;
  sliderBackground.x = 200;
  sliderBackground.y = 200;
  addChild(sliderBackground);

  sliderForeground = Bitmap(BitmapData(392, 42, Color.Black));
  sliderForeground.pivotX = sliderForeground.width / 2;
  sliderForeground.pivotY = sliderForeground.height / 2;
  sliderForeground.x = sliderBackground.x;
  sliderForeground.y = sliderBackground.y;
  addChild(sliderForeground);

  generateTarget();

  generateIndicator();

  //On mouse click or press v key, start indicator
  html.window.onMouseDown.listen((e) {
    //Start moving the indicator
    moveIndicatorBackground = stage.juggler.addTween(indicatorBackground, 1.6, Transition.linear);
    moveIndicatorBackground.animate.x.to(indicatorBackground.x + 384);
    moveIndicatorForeground = stage.juggler.addTween(indicatorForeground, 1.6, Transition.linear);
    moveIndicatorForeground.animate.x.to(indicatorForeground.x + 384);
    //moveIndicatorBackground.onComplete = () => moveIndicatorBackground = null;
    //moveIndicatorForeground.onComplete = () => moveIndicatorForeground = null;
    indicator();
    looping = true;
  });

  html.window.onKeyPress.listen((e) {
    if (e.key == 'v') {
      //Start moving the indicator
      moveIndicatorBackground = stage.juggler.addTween(indicatorBackground, 1.6, Transition.linear);
      moveIndicatorBackground.animate.x.to(indicatorBackground.x + 384);
      moveIndicatorForeground = stage.juggler.addTween(indicatorForeground, 1.6, Transition.linear);
      moveIndicatorForeground.animate.x.to(indicatorForeground.x + 384);
      //moveIndicatorBackground.onComplete = () => moveIndicatorBackground = null;
      //moveIndicatorForeground.onComplete = () => moveIndicatorForeground = null;
      indicator();
      looping = true;
    }
  });

}

  void generateIndicator() {
  indicatorBackground = Bitmap(BitmapData(8, 42, Color.Black));
  indicatorBackground.pivotX = indicatorBackground.width / 2;
  indicatorBackground.pivotY = indicatorBackground.height / 2;
  indicatorBackground.x = sliderBackground.x - 192;
  indicatorBackground.y = sliderBackground.y;
  addChild(indicatorBackground);

  indicatorForeground = Bitmap(BitmapData(4, 38, Color.White));
  indicatorForeground.pivotX = indicatorForeground.width / 2;
  indicatorForeground.pivotY = indicatorForeground.height / 2;
  indicatorForeground.x = indicatorBackground.x;
  indicatorForeground.y = indicatorBackground.y;
  addChild(indicatorForeground);
  }

  void generateTarget() {

    //TODO target moves in higher difficulty, different colors to represent different patterns

    Random rand = new Random();

    //random number between 10 and 30
    int randomWidth = 10 + rand.nextInt(20);
    //random number between +80 or -80 from the x pos center of slider background
    int randomX = sliderBackground.x - 80 + rand.nextInt(160);

    target = Bitmap(BitmapData(randomWidth, 38, Color.Green));
    target.pivotX = target.width / 2;
    target.pivotY = target.height / 2;
    target.x = randomX;
    target.y = sliderBackground.y;
    addChild(target);
  }

  void indicator() {

    if (looping == false) return;

    //Stop moving the indicator
    stage.juggler.clear();
    moveIndicatorBackground = null;
    moveIndicatorForeground = null;
        
    //Delay and visual effect

    //Delete current target and create a new one
    removeChild(target);
    generateTarget();

    //Hit detection
    bool indicatorOnTarget = indicatorBackground.hitTestObject(target);

    if (indicatorOnTarget) {
      //Target hit

    } else {
      //Target missed

    }

    //Delete current indicator and create a new one
    removeChild(indicatorBackground);
    removeChild(indicatorForeground);
    generateIndicator();

    moveIndicatorBackground = stage.juggler.addTween(indicatorBackground, 1.6, Transition.linear);
    moveIndicatorBackground.animate.x.to(indicatorBackground.x + 384);
    moveIndicatorForeground = stage.juggler.addTween(indicatorForeground, 1.6, Transition.linear);
    moveIndicatorForeground.animate.x.to(indicatorForeground.x + 384);
  }

}