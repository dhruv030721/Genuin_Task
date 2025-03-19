import 'package:flutter/material.dart';
import 'package:genuin_task/presentation/widgets/reel_player.dart';
import 'package:genuin_task/data/models/reel_mode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ReelModel> reels = [
  ReelModel(videoUrl:  'https://media.qa.begenuin.com/temp_video/34356c52-8e8b-4095-b889-0d187b011ea8_1719570480532.mp4'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical, // Scroll vertically
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return ReelPlayer(videoUrl: reels[index].videoUrl);
        },
      ),
    );
  }
}
