import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:port/component/skill.dart';
import 'package:port/component/text_animated.dart';
import 'package:port/utility/constants.dart';

class SkillPage extends StatelessWidget {
  SkillPage({super.key});
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedText(
            key: ValueKey(_currentIndex),
            text: _currentIndex == 0
                ? 'My Skills'
                : _currentIndex == 1
                    ? 'Projects'
                    : 'Certificates',
          ),
          SizedBox(height: 20.h),
          _currentIndex == 0
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 100.w,
                    mainAxisSpacing: 70.h,
                    childAspectRatio: 2,
                  ),
                  itemCount: skillList.length,
                  itemBuilder: (context, index) {
                    return SkillCard(
                      imagePath: skillList[index].imagePath,
                      skillName: skillList[index].skillName,
                    );
                  },
                )
              : Center(
                  child: AnimatedText(
                    key: ValueKey('text-$_currentIndex'),
                    text: _currentIndex == 1 ? 'Projects' : 'Certificates',
                  ),
                ),
        ],
      ),
    );
  }

  final List<Skill> skillList = [
    Skill(imagePath: ImageConst.kFlutter, skillName: 'Flutter'),
    Skill(imagePath: ImageConst.kDart, skillName: 'Dart'),
    Skill(imagePath: ImageConst.kFirebase, skillName: 'Firebase'),
    Skill(imagePath: ImageConst.kAndroid, skillName: 'Android'),
    Skill(imagePath: ImageConst.kIos, skillName: 'iOS'),
    Skill(imagePath: ImageConst.kGetX, skillName: 'GetX'),
    Skill(imagePath: ImageConst.kBloc, skillName: 'BLoC'),
    Skill(imagePath: ImageConst.kDart, skillName: 'Provider'),
    Skill(imagePath: ImageConst.kPostGres, skillName: 'PostGreSQL'),
    Skill(imagePath: ImageConst.kFigma, skillName: 'Figma'),
    Skill(imagePath: ImageConst.kShorebird, skillName: 'Shorebird'),
  ];
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
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(90.r),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            stops: const [0.3, 1.0],
            colors: [Colors.grey.shade900, Colors.grey.shade600],
            begin: Alignment.center,
            transform: const GradientRotation(50),
            end: Alignment.topRight,
          ),
          width: 2.r,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 70.w),
            SizedBox(height: 20.h),
            AnimatedText(
              text: skillName,
            ),
          ],
        ),
      ),
    );
  }
}
