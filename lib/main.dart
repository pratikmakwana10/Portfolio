import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
      ), // Optional: Dark theme
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/matrix_background.mp4')
          ..initialize().then((_) {
            debugPrint('✅ Video Initialized Successfully');
            setState(() {});
            _controller.setLooping(true);
            _controller.play();
          }).catchError((error) {
            debugPrint('❌ Video Initialization Error: $error');
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Video
        Positioned.fill(
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : const Center(child: CircularProgressIndicator()),
        ),

        // Glassmorphic Container (Portfolio Content)
        Positioned.fill(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
