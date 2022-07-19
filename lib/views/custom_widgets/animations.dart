import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
          width: 200.0,
          height: 200.0,
          color: Theme.of(context).colorScheme.primary),
    );
  }
}

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  State<Animations> createState() => _AnimationsState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  late final AnimationController _curvedController;
  late final Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _curvedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    final _curvedAnimation = CurvedAnimation(
      parent: _curvedController,
      curve: Curves.fastOutSlowIn,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 100.0).animate(_curvedAnimation);
    _animation.addListener(() {
      // print(_animation.value);
      setState(() {});
    });

    _curvedController.repeat(reverse: true);
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
            child: GestureDetector(
          onTap: () => setState(() {
            _opacity = _opacity == 0.5 ? 1 : 0.5;
          }),
          child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
              opacity: _opacity,
              child: SpinningContainer(controller: _controller)),
        )),
        const SizedBox(
          height: 70,
        ),
        Transform.translate(
          offset: Offset(40, _animation.value),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key, required this.controller})
      : super(key: key);

  final ScrollController controller;

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  get offset => widget.controller.hasClients ? widget.controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return OverflowBox(
              maxWidth: double.infinity,
              alignment: const Alignment(4, 3),
              child: Transform.rotate(
                  angle: ((math.pi * offset) / -1024),
                  child: const Icon(Icons.settings,
                      size: 512, color: Colors.black)));
        });
  }
}
