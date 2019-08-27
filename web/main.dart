import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';
import 'package:fishclicker/keyboard.dart';

Future<Null> main() async {
  StageOptions options = StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = Stage(canvas, width: 800, height: 800, options: options);

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = ResourceManager();
  resourceManager.addBitmapData("player0", "images/player0.png");
  resourceManager.addBitmapData("sliderBackground", "images/sliderBackground.png");
  resourceManager.addBitmapData("slider0", "images/slider0.png");

  var keyboard = new Keyboard();

  await resourceManager.load();

  var playerData = resourceManager.getBitmapData("player0");
  var player = Sprite();
  player.addChild(Bitmap(playerData));

  var sliderBackgroundData = resourceManager.getBitmapData("sliderBackground");
  var sliderBackground = Sprite();
  sliderBackground.addChild(Bitmap(sliderBackgroundData));

  var sliderData = resourceManager.getBitmapData("slider0");
  var slider = Sprite();
  slider.addChild(Bitmap(sliderData));

  player.pivotX = playerData.width / 2;
  player.pivotY = playerData.height / 2;

  player.x = 100;
  player.y = 100;

  stage.addChild(player);

  sliderBackground.pivotX = sliderBackground.width / 2;
  sliderBackground.pivotY = sliderBackground.width / 2;

  sliderBackground.x = 400;
  sliderBackground.y = 600;

  stage.addChild(sliderBackground);

  slider.pivotX = slider.width / 2;
  slider.pivotY = slider.height / 2;

  slider.x = 216;
  slider.y = 425;

  stage.addChild(slider);

  stage.onMouseClick.listen((e) {
    var sliderToRight =
    stage.juggler.addTween(slider, 1.5, Transition.linear);
    sliderToRight.animate.x.to(slider.x+368);
  });

  stage.onMouseRightClick.listen((e) {
    var sliderStop;
    stage.juggler.addTween(slider, 0.1, Transition.linear);
    sliderStop.animate.x.to(slider.x);
  });

/*
    update(e) {
    if (keyboard.isPressed(KeyCode.W)) {
      var playerUp =
      stage.juggler.addTween(player, 0.1, Transition.linear);
      playerUp.animate.y.to(player.y-5);
    } else if (keyboard.isPressed(KeyCode.S)) {
      var playerDown =
      stage.juggler.addTween(player, 0.1, Transition.linear);
      playerDown.animate.y.to(player.y+5);
    } else if (keyboard.isPressed(KeyCode.A)) {
      var playerLeft =
      stage.juggler.addTween(player, 0.1, Transition.linear);
      playerLeft.animate.y.to(player.x-5);
    } else if (keyboard.isPressed(KeyCode.D)) {
      var playerRight =
      stage.juggler.addTween(player, 0.1, Transition.linear);
      playerRight.animate.y.to(player.x+5);
    } else {

      }
    }
    */

}
