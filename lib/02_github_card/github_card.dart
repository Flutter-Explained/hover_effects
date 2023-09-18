import 'package:flutter/material.dart';
import 'package:hover_effect/02_github_card/card_content.dart';
import 'package:hover_effect/02_github_card/constants.dart';
import 'dart:math' as math;

class GitHubCard extends StatefulWidget {
  const GitHubCard({super.key});

  static void navigate(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GitHubCard(),
      ),
    );
  }

  @override
  State<GitHubCard> createState() => _GitHubCardState();
}

class _GitHubCardState extends State<GitHubCard>
    with SingleTickerProviderStateMixin {
  double rotationValueX = 0.5;
  double rotationValueY = 0.5;
  bool isHovered = false;
  Offset mouseLocation = Offset.zero;
  Animation<Offset>? cardBackToBeginning;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    _controller.addListener(() {
      if (cardBackToBeginning == null) return;
      setState(() {
        rotationValueY = cardBackToBeginning!.value.dy;
        rotationValueX = cardBackToBeginning!.value.dx;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0d1117),
      appBar: AppBar(title: const Text("GitHub Card Hover Effect")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(36.0),
            child: Center(
              child: SizedBox(
                height: 456,
                child: MouseRegion(
                  onEnter: (event) => setState(() {
                    _controller.reset();
                    isHovered = true;
                  }),
                  onExit: (event) => setState(() {
                    isHovered = false;

                    cardBackToBeginning = Tween<Offset>(
                      begin: Offset(rotationValueX, rotationValueY),
                      end: Offset.zero,
                    ).animate(_controller);

                    _controller.forward();
                  }),
                  onHover: (event) {
                    var cardWidth = constraints.maxWidth;
                    var cardHeight = constraints.maxHeight;
                    var mouseCourserXDelta = cardWidth - event.localPosition.dx;
                    var mouseCourserYDelta =
                        cardHeight - event.localPosition.dy;
                    setState(
                      () {
                        rotationValueX =
                            (100 * mouseCourserXDelta) / cardWidth / 100 - 0.5;
                        rotationValueY =
                            (100 * mouseCourserYDelta) / cardHeight / 100 - 0.5;
                        mouseLocation = event.localPosition;
                      },
                    );
                  },
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotationValueX * -3 * math.pi / 180)
                      ..rotateX(rotationValueY * 2 * math.pi / 180),
                    child: Container(
                      decoration: BoxDecoration(
                        color: GitHubColors.backgroundColor,
                        border: Border.all(color: GitHubColors.borderColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: mouseLocation.dx - constraints.maxWidth * 2,
                            top: mouseLocation.dy / 100 * 70 -
                                constraints.maxHeight * 2,
                            width: constraints.maxWidth * 4,
                            height: constraints.maxHeight * 4,
                            child: IgnorePointer(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                  colors: [
                                    isHovered
                                        ? const Color.fromARGB(33, 255, 86, 34)
                                        : Colors.transparent,
                                    Colors.transparent
                                  ],
                                  stops: const [0, 1],
                                )),
                              ),
                            ),
                          ),
                          const CardContent(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SponsorCardClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      height: 430,
      width: size.width,
    );
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
