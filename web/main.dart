import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:math';

Future<Null> main() async {
  StageOptions options = StageOptions()
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = ResourceManager();
  resourceManager.addBitmapData("player0", "images/player0.png");
  resourceManager.addBitmapData("player1", "images/player1.png");

  await resourceManager.load();

  var playerData = resourceManager.getBitmapData("player0");
  var player = Sprite();
  player.addChild(Bitmap(playerData));

  player.pivotX = playerData.width / 2;
  player.pivotY = playerData.height / 2;

  player.x = 1280 / 2;
  player.y = 0;

  stage.addChild(player);



}
