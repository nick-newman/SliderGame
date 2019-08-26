import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:math';

Future<Null> main() async {
  StageOptions options = StageOptions()
    ..backgroundColor = Color.White
    ..renderEngine = RenderEngine.WebGL;

  var canvas = html.querySelector('#stage');
  var stage = Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = ResourceManager();
  resourceManager.addBitmapData("player0", "images/player0.png");

  await resourceManager.load();

  var playerData = resourceManager.getBitmapData("dart");
  var player = Sprite();
  player.addChild(Bitmap(playerData));

  player.pivotX = playerData.width / 2;
  player.pivotY = playerData.height / 2;

  /*

  // Place it at top center.
  player.x = 1280 / 2;
  player.y = 0;

  stage.addChild(player);

  // And let it fall.
  var tween = stage.juggler.addTween(player, 3, Transition.easeOutBounce);
  tween.animate.y.to(800 / 2);

  // Add some interaction on mouse click.
  Tween rotation;
  player.onMouseClick.listen((MouseEvent e) {
    // Don't run more rotations at the same time.
    if (rotation != null) return;
    rotation = stage.juggler.addTween(player, 0.5, Transition.easeInOutCubic);
    rotation.animate.rotation.by(2 * pi);
    rotation.onComplete = () => rotation = null;
  });
  player.mouseCursor = MouseCursor.POINTER;

  */

  // See more examples:
  // https://github.com/bp74/StageXL_Samples
}
