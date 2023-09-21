import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hover_effect/01_glass_hover/glass_hover_effect.dart';
import 'package:hover_effect/02_github_card/github_card.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class EffectDemo {
  String title;
  void Function(BuildContext context) navigation;
  EffectDemo({required this.title, required this.navigation});
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  List<SocialMediaIcon> socials = [
    SocialMediaIcon(
      unparsedUrl: "https://youtube.com/@flutterexplained",
      iconData: FeatherIcons.youtube,
      tooltip: "Flutter Explained YouTube Channel",
    ),
    SocialMediaIcon(
      unparsedUrl: "https://flutter-explained.dev",
      iconData: FeatherIcons.home,
      tooltip: "Flutter Explained Website",
    ),
    SocialMediaIcon(
      unparsedUrl: "https://github.com/md-weber",
      iconData: FeatherIcons.github,
      tooltip: "GitHub",
    ),
    SocialMediaIcon(
      unparsedUrl: "https://www.linkedin.com/in/flutterexp",
      iconData: FeatherIcons.linkedin,
      tooltip: "GitHub",
    )
  ];

  List<EffectDemo> demos = [
    EffectDemo(
      title: "Glass Hover Effect",
      navigation: GlassHoverEffect.navigate,
    ),
    EffectDemo(
      title: "GitHub Card Hover Effect",
      navigation: GitHubCard.navigate,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Hover Effects")),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(demos[index].title),
                    onTap: () => demos[index].navigation(context),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 1);
                },
                itemCount: demos.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Follow me:"),
                  for (var social in socials)
                    IconButton(
                      onPressed: () => openURL(social.unparsedUrl),
                      icon: Icon(social.iconData),
                      tooltip: social.tooltip,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openURL(String unparsedURL) async {
    var url = Uri.parse(unparsedURL);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class SocialMediaIcon {
  String unparsedUrl;
  String? tooltip;
  IconData iconData;

  SocialMediaIcon({
    required this.unparsedUrl,
    required this.iconData,
    this.tooltip,
  });
}
