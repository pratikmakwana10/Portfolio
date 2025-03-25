
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border(right: BorderSide(color: Colors.white.withOpacity(0.2))),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(height: 20.h),
          Text(
            'Pratik Makwana',
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
              SizedBox(width: 15.w),
              _buildSocialIcon(FontAwesomeIcons.github,
                  'https://github.com/pratikmakwana10'),
              SizedBox(width: 15.w),
              _buildSocialIcon(FontAwesomeIcons.medium,
                  'https://medium.com/@pratikmakwana10'),
              SizedBox(width: 15.w),
              _buildSocialIcon(FontAwesomeIcons.youtube,
                  'https://youtube.com/@pratikmakwana10'),
            ],
          ),
        ],
      ),
    );
 
  }
    // 📌 Contact Info
  Widget _buildContactInfo(String url, String text) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.white60,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Flexible(
      child: IconButton(
        icon: FaIcon(icon, color: Colors.white, size: 18.sp),
        onPressed: () => _launchURL(url),
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