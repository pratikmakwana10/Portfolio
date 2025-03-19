import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

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
            setState(() {});
            _controller.setLooping(true);
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sidebarWidth = screenWidth * 0.25;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : const Center(child: CircularProgressIndicator()),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Row(
            children: [
              Container(
                width: sidebarWidth,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border(
                      right: BorderSide(color: Colors.white.withOpacity(0.2))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Pratik Makwana',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Flutter Developer | UI/UX Enthusiast',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin,
                              color: Colors.white),
                          onPressed: () => _launchURL(
                              'https://linkedin.com/in/pratikmakwana10/'),
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github,
                              color: Colors.white),
                          onPressed: () =>
                              _launchURL('https://github.com/pratikmakwana10'),
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.medium,
                              color: Colors.white),
                          onPressed: () =>
                              _launchURL('https://medium.com/@pratikmakwana10'),
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.youtube,
                              color: Colors.white),
                          onPressed: () =>
                              _launchURL('https://youtube.com/c/pratik'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Skills",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SkillCard(
                              imagePath: 'assets/images/f3.png',
                              skillName: 'Flutter'),
                          SkillCard(
                              imagePath: 'assets/images/android.png',
                              skillName: 'Android'),
                          SkillCard(
                              imagePath: 'assets/images/dart.png',
                              skillName: 'Dart'),
                          SkillCard(
                              imagePath: 'assets/images/getx.png',
                              skillName: 'GetX'),
                          SkillCard(
                              imagePath: 'assets/images/bloc.png',
                              skillName: 'BLoC'),
                          SkillCard(
                              imagePath: 'assets/images/shorebird.jpeg',
                              skillName: 'Shorebird'),
                          SkillCard(
                              imagePath: 'assets/images/dart.png',
                              skillName: 'Provider'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final String imagePath;
  final String skillName;

  const SkillCard(
      {super.key, required this.imagePath, required this.skillName});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isHovered ? Colors.blueAccent : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.imagePath, width: 60, height: 60),
            const SizedBox(height: 10),
            Text(
              widget.skillName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
