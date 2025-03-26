import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/component/text_animated.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatePage extends StatelessWidget {
  CertificatePage({super.key});

  final List<Map<String, String>> certificates = [
    {
      "title": "THE ULTIMATE DART & FLUTTER COURSE",
      "url":
          "https://drive.google.com/file/d/1GCOm-w17oxBrp_DfuxYZaeL3QhZPtnSY/view?usp=sharing",
      "image": "assets/images/ultimate-dart-flutter.jpg"
    },
    {
      "title": "FLUTTER & DART- THE COMPLETE GUIDE",
      "url":
          "https://drive.google.com/file/d/1TByXhVwdQP3wpNiMbQIhatYRFFy8HxRc/view?usp=sharing",
      "image": "assets/images/flutter-dart-complete-guide.jpg"
    },
    {
      "title": "THE GIT & GITHUB BOOTCAMP",
      "url":
          "https://drive.google.com/file/d/1sLU9mlNH56mu04u4Xlu0aux2cot3nxp6/view?usp=sharing",
      "image": "assets/images/git-and-github.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Adjust column count based on screen width
    int crossAxisCount = MediaQuery.of(context).size.width < 600 ? 1 : 3;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 20.w),
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.all(16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.85,
          ),
          itemCount: certificates.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _launchURL(certificates[index]["url"]!),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      child: Image.asset(
                        certificates[index]["image"]!,
                        fit: BoxFit.cover,
                        height: 140.h,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Center(
                        child: AnimatedText(
                          text: certificates[index]["title"]!,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
