import 'package:flutter/material.dart';

class MenuFetur extends StatelessWidget {
  final String icon;
  final String title;
  const MenuFetur({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: 150,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 4, 1, 212).withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage(icon),
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ]),
        ));
  }
}
