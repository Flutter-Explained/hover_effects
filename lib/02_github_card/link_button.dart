import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class LinkButton extends StatefulWidget {
  final bool isSmallScreen;
  const LinkButton({super.key, this.isSmallScreen = false});

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton>
    with SingleTickerProviderStateMixin {
  var isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invest with GitHub Sponsors",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontFamily: "MonaSans",
                          fontSize: widget.isSmallScreen ? 16 : 20),
                    ),
                    const SizedBox(height: 3),
                    AnimatedContainer(
                      width: isHovered ? 260 : 0,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Stack(children: [
                  // const Icon(OctIcons.arrow_right_24, color: Colors.white),
                  AnimatedOpacity(
                    opacity: isHovered ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      OctIcons.arrow_right_24,
                      color: Colors.white,
                    ),
                  ),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 200),
                    offset: isHovered ? const Offset(0.2, 0) : Offset.zero,
                    child: const Icon(
                      OctIcons.chevron_right_24,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
