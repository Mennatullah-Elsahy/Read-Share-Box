import 'package:flutter/material.dart';

import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const NetworkImage("https://picsum.photos/200"),
            onBackgroundImageError: (exception, stackTrace) => print("Error"),
          ),
          IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => CustomNavigator.push(Routes.notifications),
                      child: Icon(Icons.notifications, size: 22, color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
