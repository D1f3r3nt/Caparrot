import 'package:caparrot/utils/utils.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class AnimatedMenu extends StatelessWidget {
  const AnimatedMenu({
    Key? key,
    required Animation<double> animation,
    required AnimationController animationController,
  })  : _animation = animation,
        _animationController = animationController,
        super(key: key);

  final Animation<double> _animation;
  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      animation: _animation,
      backGroundColor: Palete.green70,
      iconColor: Palete.white90,
      iconData: Icons.menu,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      items: [
        Bubble(
          title: "Caparrots",
          iconColor: Palete.white90,
          bubbleColor: Palete.green70,
          icon: Icons.face,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.pushNamed(context, 'heads');
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Usuari",
          iconColor: Palete.white90,
          bubbleColor: Palete.green70,
          icon: Icons.person,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.pushNamed(context, 'profile');
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Biblioteca",
          iconColor: Palete.white90,
          bubbleColor: Palete.green70,
          icon: Icons.menu_book_rounded,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            Navigator.pushNamed(context, 'library');
            _animationController.reverse();
          },
        ),
        Bubble(
          title: "Credits",
          iconColor: Palete.white90,
          bubbleColor: Palete.green70,
          icon: Icons.info,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            popUpCredits(context);
            _animationController.reverse();
          },
        ),
      ],
    );
  }
}
