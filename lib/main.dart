import 'package:flutter/material.dart';
import 'package:hover_effect/01_glass_hover/glass_hover_effect.dart';

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
  List<EffectDemo> demos = [
    EffectDemo(
      title: "Glass Hover Effect",
      navigation: GlassHoverEffect.navigate,
    ),
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
        body: ListView.separated(
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
    );
  }
}
