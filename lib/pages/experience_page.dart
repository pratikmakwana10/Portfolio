import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/utility/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final List<Map<String, dynamic>> projects = [
    {
      'name': 'XBridge Live',
      'images': [
        ImageConst.xDashboard,
        ImageConst.xTaskDetail,
        ImageConst.xSCR,
        ImageConst.xTasks,
        ImageConst.xCalender,
        ImageConst.xSCR2,
        ImageConst.xVideoTask,
        ImageConst.xSetting,
      ],
      'link': 'https://apps.apple.com/in/app/xbridge-live/id6502498887'
    },
    {
      'name': 'Jain Sangh',
      'images': [
        'assets/jainsangh1.png',
        'assets/jainsangh2.png',
        'assets/jainsangh3.png'
      ],
      'link': 'https://jainsangh.com'
    },
    {
      'name': 'Reward Ranger',
      'images': [
        'assets/rewardranger1.png',
        'assets/rewardranger2.png',
        'assets/rewardranger3.png'
      ],
      'link': 'https://rewardranger.com'
    },
    {
      'name': 'Inventory Management',
      'images': [
        'assets/inventory1.png',
        'assets/inventory2.png',
        'assets/inventory3.png'
      ],
      'link': 'https://inventoryapp.com'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Projects',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    projectName: projects[index]['name']!,
                    projectImages: List<String>.from(
                        projects[index]['images'].map((e) => e.toString())),
                    projectLink: projects[index]['link']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projectName;
  final List<String> projectImages;
  final String projectLink;

  const ProjectCard({
    super.key,
    required this.projectName,
    required this.projectImages,
    required this.projectLink,
  });

  void _showProjectDetails(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.grey[900],
        child: Container(
          width: isMobile ? 0.9.sw : 600.w,
          height: isMobile ? 0.9.sh : 700.h,
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                projectName,
                style: TextStyle(
                    color: Colors.white, fontSize: isMobile ? 20.sp : 24.sp),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: PageView.builder(
                  itemCount: projectImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      projectImages[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text('Image not available',
                              style: TextStyle(color: Colors.white)),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () => _launchURL(context),
                child: const Text('Visit App'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(projectLink);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch the URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProjectDetails(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.white24),
          gradient: const LinearGradient(
            colors: [Colors.white12, Colors.white10],
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.phone_android, color: Colors.white70, size: 32.sp),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                projectName,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
