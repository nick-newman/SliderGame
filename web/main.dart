import 'dart:async';
import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'dart:math';
import 'package:fishclicker/slider.dart';

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

  var slider = Slider();
  slider.x = (stage.width / 2) + 180;
  slider.y = 300;
  stage.addChild(slider);

}
