import 'package:flutter/material.dart';
import 'package:hover_effect/02_github_card/link_button.dart';
import 'package:hover_effect/02_github_card/sponsor_card_grid.dart';

class CardContent extends StatelessWidget {
  final bool isSmallScreen;
  const CardContent({super.key, this.isSmallScreen = false});

  @override
  Widget build(BuildContext context) {
    return isSmallScreen
        ? Column(
            children: generateWidgets(context),
          )
        : Row(children: generateWidgets(context));
  }

  List<Widget> generateWidgets(context) => [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 128,
              top: 64,
              bottom: 64,
              left: 64,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 345,
                  child: Text.rich(
                    TextSpan(
                      text: "GitHub Sponsors",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontFamily: "MonaSans",
                            fontSize: isSmallScreen ? 20 : 24,
                            fontWeight: FontWeight.w500,
                          ),
                      children: [
                        TextSpan(
                          text:
                              " lets you support your favorite open source maintainers and projects.",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: const Color.fromARGB(139, 235, 245, 255),
                                fontFamily: "MonaSans",
                                fontSize: isSmallScreen ? 20 : 24,
                                fontWeight: FontWeight.w500,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                const LinkButton(),
              ],
            ),
          ),
        ),
        const Flexible(child: SponsorCardGrid())
      ];
}
