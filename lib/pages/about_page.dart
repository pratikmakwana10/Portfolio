import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/component/text_animated.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade800,
            Colors.blueGrey.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          width: 500.w,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.r,
                spreadRadius: 3.r,
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(height: 20.h),
              AnimatedText(
                text: 'Pratik Makwana', fontSize: 28.sp,
                // style: TextStyle(
                //   fontSize: 28.sp,
                //   fontWeight: FontWeight.bold,
                //   color: Colors.white,
                // ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Flutter Developer | UI/UX Enthusiast',
                style: TextStyle(
                  fontSize: 16.sp,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(FontAwesomeIcons.linkedin,
                      'https://linkedin.com/in/pratikmakwana10'),
                  SizedBox(width: 20.w),
                  _buildSocialIcon(FontAwesomeIcons.github,
                      'https://github.com/pratikmakwana10'),
                  SizedBox(width: 20.w),
                  _buildSocialIcon(FontAwesomeIcons.medium,
                      'https://medium.com/@pratikmakwana10'),
                  SizedBox(width: 20.w),
                  _buildSocialIcon(FontAwesomeIcons.youtube,
                      'https://youtube.com/@pratikmakwana10'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(String url, String text) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white70,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon,
          color: const Color.fromARGB(255, 204, 173, 18), size: 24.sp),
      onPressed: () => _launchURL(url),
      hoverColor: Colors.blueAccent.withOpacity(0.2),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
