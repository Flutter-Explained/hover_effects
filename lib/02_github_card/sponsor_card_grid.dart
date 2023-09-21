import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:hover_effect/02_github_card/sponsor_card.dart';

class SponsorCardGrid extends StatelessWidget {
  const SponsorCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-50.0, -60.0)
        ..rotateZ(-math.pi / 12.0),
      child: const Column(
        children: [
          Row(
            children: [
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
              SizedBox(width: 16),
              SponsorCard(),
            ],
          ),
        ],
      ),
    );
  }
}
