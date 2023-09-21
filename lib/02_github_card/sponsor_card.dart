import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:hover_effect/02_github_card/constants.dart';

class SponsorCard extends StatelessWidget {
  const SponsorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 225,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF171b22),
        border: Border.all(color: GitHubColors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage("assets/avatar.jpg"),
          ),
          const SizedBox(height: 8),
          Text(
            "Eleanor Horton",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: GitHubColors.lightGray),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                OctIcons.heart_16,
                color: GitHubColors.buttonFontColor,
                size: 16,
              ),
              label: Text(
                "Sponsor",
                style: TextStyle(color: GitHubColors.buttonFontColor),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  GitHubColors.buttonBackgroundColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: GitHubColors.borderColor),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
