import 'dart:math';

import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) {
              return const LocationConponent();
            },
            controller: pageController,
            itemCount: 10,
          ),
        ),
        Container(
          height: 100,
          color: Colors.red,
        )
      ],
    );
  }
}

class LocationConponent extends StatefulWidget {
  const LocationConponent({
    super.key,
  });

  @override
  State<LocationConponent> createState() => _LocationConponentState();
}

class _LocationConponentState extends State<LocationConponent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          bottom: isExpanded ? 40 : 100,
          duration: const Duration(milliseconds: 500),
          width: isExpanded ? size.width * 0.85 : size.width * 0.7,
          height: isExpanded ? size.height * 0.57 : size.height * 0.45,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visit Sri Lanka, Beautiful Places...",
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          "See more..",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Text("THis is new collection"),
                      ],
                    ),
                  )
                ]),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 140 : 100,
          child: GestureDetector(
            onPanUpdate: onPanUpdate,
            child: const ImageComponent(),
          ),
        ),
      ],
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 400,
      width: size.width * 0.78,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              "https://picsum.photos/id/1041/800/600",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(color: Color.fromARGB(59, 0, 0, 0)),
            )
          ],
        ),
      ),
    );
  }
}

int randomValue() {
  return Random().nextInt(255);
}
