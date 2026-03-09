import 'package:flutter/material.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // centro vertical
        crossAxisAlignment: CrossAxisAlignment.center, // centro horizontal
        children: [
          Image.asset("assets/images/empty_cart.png", width: 150, height: 150),
        ],
      ),
    );
  }
}
