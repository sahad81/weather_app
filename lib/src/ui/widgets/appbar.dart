import 'package:flutter/material.dart';

class Appbarwidget extends StatelessWidget {
  const Appbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu)),
                        );
  }
}