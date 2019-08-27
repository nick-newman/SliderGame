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
  resourceManager.addBitmapData("player1", "images/player1.png");

  var keyboard = new Keyboard();

  await resourceManager.load();

  var playerData = resourceManager.getBitmapData("player0");
  var player = Sprite();
  player.addChild(Bitmap(playerData));

  player.pivotX = playerData.width / 2;
  player.pivotY = playerData.height / 2;

  player.x = 800 / 2;
  player.y = 800 / 2;

  stage.addChild(player);

  stage.onKeyDown.listen((e) {
      var playerUp = stage.juggler.addTween(player, 0.1, Transition.linear);
      playerUp.animate.y.to(player.y-5);
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
