import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/utility/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sidebarWidth = screenWidth * 0.22;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Container(
                width: sidebarWidth,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border(
                      right: BorderSide(color: Colors.white.withOpacity(0.2))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: constraints.maxWidth * 0.05,
                      backgroundImage:
                          const AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Pratik Makwana',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.02,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter Developer | UI/UX Enthusiast',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.015,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    _buildContactInfo('mailto:flutterdev.pratik@gmail.com',
                        'flutterdev.pratik@gmail.com', constraints),
                    _buildContactInfo(
                        'tel:+919978786060', '+91 9978786060', constraints),
                    _buildContactInfo(
                        'tel:+919979896060', '+91 9979896060', constraints),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(FontAwesomeIcons.linkedin, kLinkedIn),
                        _buildSocialIcon(FontAwesomeIcons.github, kGithub),
                        _buildSocialIcon(FontAwesomeIcons.medium, kMedium),
                        _buildSocialIcon(FontAwesomeIcons.youtube, kYoutube),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Skills",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenWidth < 600 ? 3 : 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          return SkillCard(
                            imagePath: skills[index].imagePath,
                            skillName: skills[index].skillName,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContactInfo(
      String url, String text, BoxConstraints constraints) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Text(
        text,
        style: TextStyle(
          fontSize: constraints.maxWidth * 0.012, // Reduced font size
          color: Colors.white60,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: IconButton(
        icon: FaIcon(icon, color: Colors.white, size: 18),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}

class Skill {
  final String imagePath;
  final String skillName;

  Skill({required this.imagePath, required this.skillName});
}

final List<Skill> skills = [
  Skill(imagePath: 'assets/images/f3.png', skillName: 'Flutter'),
  Skill(imagePath: 'assets/images/firebase.png', skillName: 'Firebase'),
  Skill(imagePath: 'assets/images/android4.png', skillName: 'Android'),
  Skill(imagePath: 'assets/images/ios.png', skillName: 'iOS'),
  Skill(imagePath: 'assets/images/dart.png', skillName: 'Dart'),
  Skill(imagePath: 'assets/images/getx.png', skillName: 'GetX'),
  Skill(imagePath: 'assets/images/bloc.png', skillName: 'BLoC'),
  Skill(imagePath: 'assets/images/shorebird.jpeg', skillName: 'Shorebird'),
  Skill(imagePath: 'assets/images/dart.png', skillName: 'Provider'),
];

class SkillCard extends StatefulWidget {
  final String imagePath;
  final String skillName;

  const SkillCard(
      {super.key, required this.imagePath, required this.skillName});

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered
              ? Colors.white.withOpacity(0.3) // Hover effect
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(widget.imagePath, width: screenWidth * 0.02),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.skillName,
              style: TextStyle(
                fontSize: screenWidth * 0.015,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
