import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';

class Player extends DisplayObjectContainer {

Player() {
  //var resourceManager = ResourceManager();
  //resourceManager.addBitmapData("player0", "images/player0@1x.png");
  //resourceManager.addBitmapData("player1", "images/player1@1x.png");

  var player = BitmapData(20, 20, Color.Blue);
  var playerBitmap = Bitmap(player);
  addChild(playerBitmap);

  playerBitmap.pivotX = playerBitmap.width / 2;
  playerBitmap.pivotY = playerBitmap.height / 2;
  playerBitmap.x = 200;
  playerBitmap.y = 200;

  Tween playerMove;

  html.window.onKeyPress.listen((e) {
    if (e.key == 'w') {
      playerMove = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMove.animate.y.to(playerBitmap.y - 1);
    } else if (e.key == 's') {
      playerMove = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMove.animate.y.to(playerBitmap.y + 1);
    } else if (e.key == "a") {
      playerMove = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMove.animate.x.to(playerBitmap.x - 1);
    } else if (e.key == "d") {
      playerMove = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMove.animate.x.to(playerBitmap.x + 1);
    } 

  });
}

}