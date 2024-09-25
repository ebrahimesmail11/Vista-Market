import 'package:flutter/material.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';

class UserAvtar extends StatelessWidget {
  const UserAvtar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadeInDown(
      duration: 500,
      child:  CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage('https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg'),
      ),
    );
  }
}
