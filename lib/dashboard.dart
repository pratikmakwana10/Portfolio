import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/component/dynamic_text_widget.dart';
import 'package:port/component/text_animated.dart';
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
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250.w,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border(
                  right: BorderSide(color: Colors.white.withOpacity(0.2))),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                CircleAvatar(
                  radius: 80.r,
                  backgroundImage:
                      const AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Pratik Makwana',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Flutter Developer | UI/UX Enthusiast',
                  style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                _buildContactInfo('mailto:flutterdev.pratik@gmail.com',
                    'flutterdev.pratik@gmail.com'),
                _buildContactInfo('tel:+919978786060', '+91 9978786060'),
                _buildContactInfo('tel:+919979896060', '+91 9979896060'),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(FontAwesomeIcons.linkedin,
                        'https://linkedin.com/in/pratikmakwana10'),
                    _buildSocialIcon(FontAwesomeIcons.github,
                        'https://github.com/pratikmakwana10'),
                    _buildSocialIcon(FontAwesomeIcons.medium,
                        'https://medium.com/@pratikmakwana10'),
                    _buildSocialIcon(FontAwesomeIcons.youtube,
                        'https://youtube.com/@pratikmakwana10'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnimatedText(text: 'My Skills'),
                  SizedBox(height: 20.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 30.w,
                      mainAxisSpacing: 30.h,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: skillList.length,
                    itemBuilder: (context, index) {
                      return AnimatedSkillCard(
                        imagePath: skillList[index].imagePath,
                        skillName: skillList[index].skillName,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String url, String text) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white60,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, color: Colors.white, size: 18.sp),
      onPressed: () => _launchURL(url),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String imagePath;
  final String skillName;

  const SkillCard({
    super.key,
    required this.imagePath,
    required this.skillName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80.w,
            width: 80.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.white54),
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            skillName,
            style: TextStyle(fontSize: 14.sp, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class Skill {
  final String imagePath;
  final String skillName;

  Skill({required this.imagePath, required this.skillName});
}

final List<Skill> skillList = [
  Skill(imagePath: ImageConst.kFlutter, skillName: 'Flutter'),
  Skill(imagePath: ImageConst.kFirebase, skillName: 'Firebase'),
  Skill(imagePath: ImageConst.kAndroid, skillName: 'Android'),
  Skill(imagePath: ImageConst.kIos, skillName: 'iOS'),
  Skill(imagePath: ImageConst.kDart, skillName: 'Dart'),
  Skill(imagePath: ImageConst.kGetX, skillName: 'GetX'),
  Skill(imagePath: ImageConst.kBloc, skillName: 'BLoC'),
  Skill(imagePath: ImageConst.kShorebird, skillName: 'Shorebird'),
  Skill(imagePath: ImageConst.kDart, skillName: 'Provider'),
];
