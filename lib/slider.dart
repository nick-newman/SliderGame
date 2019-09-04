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
Random rand = Random();

Slider() {

  sliderBackground = Bitmap(BitmapData(400, 50, Color.White));
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

  generateRandomTarget();
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

  void generateRandomTarget() {

    //random number between +80 or -80 from the x pos center of slider background
    int randomX = sliderBackground.x - 80 + rand.nextInt(160);
    int customWidth;
    Tween moveTarget;

    //random number between 1 and 100
    //1-40 41-60 61-80 81-100
    int typeValue = 1 + rand.nextInt(99);

    if (typeValue <= 40) {
      //width of 15 to 35
      customWidth = 15 + rand.nextInt(20);
      target = Bitmap(BitmapData(customWidth, 38, Color.Green));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

    } else if (typeValue > 40 && typeValue <= 60) {
      //width of 15 to 30
      customWidth = 15 + rand.nextInt(15);
      target = Bitmap(BitmapData(customWidth, 38, Color.BlueViolet));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

      moveTarget = stage.juggler.addTween(target, 1.4, Transition.sine);
      if (typeValue >= 50) {
      moveTarget.animate.x.to(target.x + 70);
      } else {
      moveTarget.animate.x.to(target.x - 70);
      }

    } else if (typeValue > 60 && typeValue <= 80) {
      //width of 25 to 40
      customWidth = 25 + rand.nextInt(15);
      target = Bitmap(BitmapData(customWidth, 38, Color.Crimson));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

      //if (target != null) {
      moveTarget = stage.juggler.addTween(target, 0.8, Transition.linear);
      if (typeValue >= 70) {
      moveTarget.animate.x.to(target.x - 60);
      moveTarget.onComplete = () {
      moveTarget = stage.juggler.addTween(target, 0.8, Transition.linear);
      moveTarget.animate.x.to(target.x + 60);
      };
      } else {
      moveTarget.animate.x.to(target.x + 60);
      moveTarget.onComplete = () {
      moveTarget = stage.juggler.addTween(target, 0.8, Transition.linear);
      moveTarget.animate.x.to(target.x - 60);
      };
      }
      
    } else {
      //width of 10 to 20
      customWidth = 10 + rand.nextInt(10);
      target = Bitmap(BitmapData(customWidth, 38, Color.Yellow));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

      moveTarget = stage.juggler.addTween(target, 100, Transition.random);
      moveTarget.animate.x.to(target.x + 5);
    }

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
    //generateTarget(); turn into randomTargetGen
    generateRandomTarget();

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