import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: const Offset(1.1, 0),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF3B6D83),
        body: Center(
          child: MouseRegion(
            onEnter: (event) => _controller.forward(),
            onExit: (event) => _controller.reverse(),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                height: 420,
                width: 320,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                          image: AssetImage("assets/isfahan.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _animation,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                SelectableText(
                                  "Isfahan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                                SelectableText(
                                  "Where History and Beauty Unite",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 25),
                                SelectableText(
                                  "Isfahan, Iran's cultural gem, boasts stunning architecture, like the Imam Mosque and Naqsh-e Jahan Square. Rich history and vibrant culture await visitors.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        child: const Text(
                                            "Discover the Jewel of Iran"),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      child: SizedBox(
                        width: 320,
                        height: 420,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 6),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
