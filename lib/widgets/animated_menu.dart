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
        _optionMenu(context, "Caparrots", Icons.face, 'heads'),
        _optionMenu(context, "Usuari", Icons.person, 'profile'),
        _optionMenu(context, "Biblioteca", Icons.menu_book_rounded, 'library'),
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

  Bubble _optionMenu(
      BuildContext context, String title, IconData icon, String go) {
    return Bubble(
      title: title,
      iconColor: Palete.white90,
      bubbleColor: Palete.green70,
      icon: icon,
      titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      onPress: () {
        Navigator.pushNamed(context, go);
        _animationController.reverse();
      },
    );
  }
}
