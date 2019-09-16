import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:math';

class Slider extends DisplayObjectContainer {
  var sliderBackground,
      sliderForeground,
      target,
      indicatorBackground,
      indicatorForeground;
  int hit = 0, miss = 0, streak = 0, highestStreak = 0;
  TextField hitText = TextField("Hits: 0", TextFormat("Arial", 18, 0x000000));
  TextField missText = TextField("Misses: 0", TextFormat("Arial", 18, 0x000000));
  TextField streakText = TextField("Streak: 0", TextFormat("Arial", 18, 0x000000));
  TextField highestStreakText = TextField("Highest: 0", TextFormat("Arial", 18, 0x000000));
  bool looping = false;
  Tween moveIndicatorBackground, moveIndicatorForeground;
  Random rand = Random();

  Slider() {
    hitText.textColor = Color.White;
    hitText.x = 0;
    hitText.y = 80;
    addChild(hitText);

    missText.textColor = Color.White;
    missText.x = 0;
    missText.y = 115;
    addChild(missText);

    streakText.textColor = Color.White;
    streakText.x = 300;
    streakText.y = 80;
    addChild(streakText);

    highestStreakText.textColor = Color.White;
    highestStreakText.x = 300;
    highestStreakText.y = 115;
    addChild(highestStreakText);

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

    html.window.onMouseDown.listen((e) {
      //Start moving the indicator
      moveIndicatorBackground =
          stage.juggler.addTween(indicatorBackground, 1.6, Transition.linear);
      moveIndicatorBackground.animate.x.to(indicatorBackground.x + 384);
      moveIndicatorForeground =
          stage.juggler.addTween(indicatorForeground, 1.6, Transition.linear);
      moveIndicatorForeground.animate.x.to(indicatorForeground.x + 384);
      indicator();
      looping = true;
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
    //random number between +80 or -40 from the x pos center of slider background
    int randomX = sliderBackground.x - 40 + rand.nextInt(120);
    int customWidth;
    Tween moveTarget;

    //random number between 1 and 100
    //1-40 41-60 61-80 81-100
    int typeValue = 1 + rand.nextInt(99);

    if (typeValue <= 40) {
      //width of 15 to 30
      customWidth = 15 + rand.nextInt(15);
      target = Bitmap(BitmapData(customWidth, 38, Color.Green));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);
    } else if (typeValue > 40 && typeValue <= 60) {
      //width of 20 to 35
      customWidth = 20 + rand.nextInt(15);
      target = Bitmap(BitmapData(customWidth, 38, Color.Blue));

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
      //width of 20 to 30
      customWidth = 20 + rand.nextInt(10);
      target = Bitmap(BitmapData(customWidth, 38, Color.Crimson));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

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
      //width of 20 to 30
      customWidth = 20 + rand.nextInt(10);
      target = Bitmap(BitmapData(customWidth, 38, Color.Yellow));

      target.pivotX = target.width / 2;
      target.pivotY = target.height / 2;
      target.x = randomX;
      target.y = sliderBackground.y;
      addChild(target);

      moveTarget = stage.juggler.addTween(target, 100, Transition.random);
      moveTarget.animate.x.to(target.x + 12);
    }
  }

  void indicator() {
    if (looping == false) return;

    //Stop moving the indicator
    stage.juggler.clear();
    moveIndicatorBackground = null;
    moveIndicatorForeground = null;

    //Hit detection
    bool indicatorOnTarget = indicatorBackground.hitTestObject(target);

    if (indicatorOnTarget) {
      //Target hit
      hit++;
      hitText.text = ("Hits: " + '$hit');

      streak++;
      streakText.text = ("Streak: " + '$streak');
    } else {
      //Target missed
      miss++;
      missText.text = ("Misses: " + '$miss');

      streak = 0;
      streakText.text = ("Streak: " + '$streak');
      streakText.textColor = Color.White;
      streakText.scaleX = 1;
      streakText.scaleY = 1;
    }

    if (streak > highestStreak) {
      highestStreak++;
    }

    highestStreakText.text = ("Highest: " + '$highestStreak');

    if (streak >= 5 && streak < 10) {
      streakText.textColor = Color.LimeGreen;
      if (streak == 9) {
        surprise();
      }
    } else if (streak >= 10 && streak < 15) {
      streakText.textColor = Color.Cyan;
    } else if (streak >= 15 && streak < 20) {
      streakText.textColor = Color.Gold;
      if (streak == 18) {
        surprise();
      }
    } else if (streak >= 20 && streak < 30) {
      streakText.scaleX = 1.1;
      streakText.scaleY = 1.1;
      if (streak == 26) {
        surprise();
      }
    } else if (streak >= 40) {
      streakText.scaleX = 1.2;
      streakText.scaleY = 1.2;
      if (streak == 41) {
        surprise();
      }
    }

    if (highestStreak >= 5 && highestStreak < 10) {
      highestStreakText.textColor = Color.LimeGreen;
    } else if (highestStreak >= 10 && highestStreak < 15) {
      highestStreakText.textColor = Color.Cyan;
    } else if (highestStreak >= 15 && highestStreak < 20) {
      highestStreakText.textColor = Color.Gold;
    } else if (highestStreak >= 20 && highestStreak < 30) {
      highestStreakText.scaleX = 1.1;
      highestStreakText.scaleY = 1.1;
    } else if (highestStreak >= 40) {
      highestStreakText.scaleX = 1.2;
      highestStreakText.scaleY = 1.2;
    }

    //Wait half a second before refreshing indicator
    Timer(Duration(milliseconds: 500), () {
      //Delete current target and create a new one
      removeChild(target);
      generateRandomTarget();

      //Delete current indicator and create a new one
      removeChild(indicatorBackground);
      removeChild(indicatorForeground);
      generateIndicator();

      moveIndicatorBackground =
          stage.juggler.addTween(indicatorBackground, 1.6, Transition.linear);
      moveIndicatorBackground.animate.x.to(indicatorBackground.x + 384);
      moveIndicatorForeground =
          stage.juggler.addTween(indicatorForeground, 1.6, Transition.linear);
      moveIndicatorForeground.animate.x.to(indicatorForeground.x + 384);
    });
  }

  Future surprise() async {

    int randomImageValue = rand.nextInt(1);

    var resourceManager = ResourceManager();
    if (randomImageValue == 1) {
      resourceManager.addBitmapData("scareImage", "assets/scareImage1.png");
    } else {
      resourceManager.addBitmapData("scareImage", "assets/scareImage2.png");
    }
    resourceManager.addSound("scareSound", "assets/scareSound.wav");
    await resourceManager.load();
    var scareImageData = resourceManager.getBitmapData("scareImage");
    var sound = resourceManager.getSound("scareSound");
    var scareImageSprite = Sprite();
    scareImageSprite.addChild(Bitmap(scareImageData));
    stage.addChild(scareImageSprite);
    scareImageSprite.pivotX = scareImageSprite.width / 2;
    scareImageSprite.pivotY = scareImageSprite.height / 2;
    scareImageSprite.x = stage.width / 2;
    scareImageSprite.y = 450;
    scareImageSprite.scaleX = 2.0;
    scareImageSprite.scaleY = 1.5;

    sound.play();

    Timer(Duration(milliseconds: 820), () {
      stage.removeChild(scareImageSprite);
    });

  }

}
