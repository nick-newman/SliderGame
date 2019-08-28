import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';
import 'package:fishclicker/slider.dart';
import 'package:fishclicker/player.dart';

Future<Null> main() async {
  StageOptions options = StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = Stage(canvas, width: 800, height: 800, options: options);
  //var stage = new Stage(canvas);

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  var player = new Player();
  player.x = 100;
  player.y = 100;
  stage.addChild(player);

  var slider = new Slider();
  slider.x = 40;
  slider.y = 40;
  stage.addChild(slider);

/*
  var resourceManager = ResourceManager();
  resourceManager.addBitmapData("player0", "images/player0@1x.png");
  resourceManager.addBitmapData("player1", "images/player1@1x.png");
  resourceManager.addBitmapData("sliderBackground", "images/sliderBackground@1x.png");
  resourceManager.addBitmapData("slider0", "images/slider0@1x.png");
  resourceManager.addBitmapData("slider1", "images/slider1@1x.png");
  resourceManager.addBitmapData("reel0", "images/reel0@1x.png");
  resourceManager.addBitmapData("reel1", "images/reel1@1x.png");
  resourceManager.addBitmapData("cast0", "images/cast0@1x.png");
  resourceManager.addBitmapData("cast1", "images/cast1@1x.png");
  resourceManager.addBitmapData("sliderTarget0", "images/sliderTarget0@1x.png");
  resourceManager.addBitmapData("sliderTarget1", "images/sliderTarget1@1x.png");
  resourceManager.addBitmapData("sliderTarget2", "images/sliderTarget2@1x.png");

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

  var actionData = resourceManager.getBitmapData("cast0");
  var action = Sprite();
  action.addChild(Bitmap(actionData));

  var sliderTargetData = resourceManager.getBitmapData("sliderTarget0");
  var sliderTarget = Sprite();
  sliderTarget.addChild(Bitmap(sliderTargetData));

  player.pivotX = playerData.width / 2;
  player.pivotY = playerData.height / 2;
  sliderBackground.pivotX = sliderBackground.width / 2;
  sliderBackground.pivotY = sliderBackground.height / 2;
  slider.pivotX = slider.width / 2;
  slider.pivotY = slider.height / 2;
  action.pivotX = action.width / 2;
  action.pivotY = action.height / 2;
  sliderTarget.pivotX = sliderTarget.width / 2;
  sliderTarget.pivotY = sliderTarget.height / 2;

  player.scaleX = 1;
  player.scaleY = 1;
  sliderBackground.scaleX = 1;
  sliderBackground.scaleY = 1;
  slider.scaleX = 1;
  slider.scaleY = 1;
  action.scaleX = 1;
  action.scaleY = 1;
  sliderTarget.scaleX = 1;
  sliderTarget.scaleY = 1;

  player.x = 100;
  player.y = 100;
  sliderBackground.x = 400;
  sliderBackground.y = 500;
  action.x = 400;
  action.y = 620;

  stage.addChild(player);
  stage.addChild(sliderBackground);
  stage.addChild(action);

  Tween sliderToRight;

  action.onMouseClick.listen((MouseEvent e) {

    if (sliderToRight != null) return;

    sliderTarget.x = 400;
    sliderTarget.y = 500;
    stage.addChild(sliderTarget);

    slider.x = sliderBackground.x - 144 + Random.nextInt(80);
    slider.y = 500;
    stage.addChild(slider);

    sliderToRight = stage.juggler.addTween(slider, 1.6, Transition.linear);
    sliderToRight.animate.x.to(slider.x+369);
    sliderToRight.onComplete = () => sliderToRight = null;
  });
  action.mouseCursor = MouseCursor.POINTER;

  */

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
