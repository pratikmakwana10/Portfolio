import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/utility/constants.dart';

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
