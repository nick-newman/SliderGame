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

  var player = BitmapData(16, 16, Color.Blue);
  var playerBitmap = Bitmap(player);
  addChild(playerBitmap);

  playerBitmap.pivotX = playerBitmap.width / 2;
  playerBitmap.pivotY = playerBitmap.height / 2;
  playerBitmap.x = 200;
  playerBitmap.y = 200;

  Tween playerMoveUp;
  Tween playerMoveDown;
  Tween playerMoveLeft;
  Tween playerMoveRight;

  html.window.onKeyPress.listen((e) {
    
    if (e.key == 'w') {
      playerMoveUp = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMoveUp.animate.y.to(playerBitmap.y - 5);
    } else if (e.key == 's') {
      playerMoveDown = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMoveDown.animate.y.to(playerBitmap.y + 5);
    } else if (e.key == "a") {
      playerMoveLeft = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMoveLeft.animate.x.to(playerBitmap.x - 5);
    } else if (e.key == "d") {
      playerMoveRight = stage.juggler.addTween(playerBitmap, 0.01, Transition.linear);
      playerMoveRight.animate.x.to(playerBitmap.x + 5);
    } 

  });
}

}