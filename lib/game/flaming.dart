import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flaming/game/game.dart';
import 'package:flaming/l10n/l10n.dart';
import 'package:flutter/painting.dart';

class Flaming extends FlameGame {
  Flaming({
    required this.l10n,
    required this.effectPlayer,
    required this.textStyle,
  }) {
    images.prefix = '';
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  final TextStyle textStyle;

  int counter = 0;

  @override
  Color backgroundColor() => const Color(0xFF2A48DF);

  @override
  Future<void> onLoad() async {
    final world = World(
      children: [
        Unicorn(position: size / 2),
        CounterComponent(
          position: (size / 2)
            ..sub(
              Vector2(0, 16),
            ),
        ),
      ],
    );

    final camera = CameraComponent(world: world);
    await addAll([world, camera]);

    camera.viewfinder.position = size / 2;
    camera.viewfinder.zoom = 4;
  }
}
