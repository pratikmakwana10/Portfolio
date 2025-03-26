import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/component/social_icons.dart';
import 'package:port/component/text_animated.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: isMobile ? 60.r : 80.r,
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: 20.h),
            AnimatedText(
              text: 'Pratik Makwana',
              fontSize: isMobile ? 22.sp : 28.sp,
            ),
            SizedBox(height: 10.h),
            Text(
              'Flutter Developer | UI/UX Enthusiast',
              style: TextStyle(
                fontSize: isMobile ? 14.sp : 16.sp,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            _buildContactInfo('mailto:flutterdev.pratik@gmail.com',
                'flutterdev.pratik@gmail.com'),
            _buildContactInfo('tel:+919978786060', '+91 9978786060'),
            _buildContactInfo('tel:+919979896060', '+91 9979896060'),
            SizedBox(height: 20.h),
            const Divider(color: Colors.white24, thickness: 1.5),
            SizedBox(height: 20.h),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.w,
              runSpacing: 20.h,
              children: const [
                SocialIconButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://linkedin.com/in/pratikmakwana10'),
                SocialIconButton(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/pratikmakwana10'),
                SocialIconButton(
                    icon: FontAwesomeIcons.medium,
                    url: 'https://medium.com/@pratikmakwana10'),
                SocialIconButton(
                    icon: FontAwesomeIcons.youtube, url: 'https://youtube.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String url, String text) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.red,
        focusColor: Colors.black,
        hoverColor: const Color.fromARGB(255, 67, 103, 232),
        onTap: () => _launchURL(url),
        borderRadius: BorderRadius.circular(30.r),
        splashColor: Colors.white24,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white24,
                  width: 1.5,
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
                decorationColor: Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
