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
  stage.pixelRatio = 1;
  stage.scaleMode = StageScaleMode.NO_SCALE;

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  var player = Player();
  player.x = stage.width / 2;
  player.y = 200;
  stage.addChild(player);

  var slider = Slider();
  slider.x = stage.width / 2;
  slider.y = 400;
  stage.addChild(slider);

}
