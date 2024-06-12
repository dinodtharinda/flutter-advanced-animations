import 'package:flutter/material.dart';
import 'package:flutter_advanced_animations/widget/location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 228, 246),
      appBar: AppBar(title: const Text("Location Screen")),
      body:const LocationWidget(),
    );
  }
}
