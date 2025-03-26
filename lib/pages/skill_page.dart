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
    // Responsive column count
    int crossAxisCount = MediaQuery.of(context).size.width < 600 ? 2 : 4;

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedText(
            key: ValueKey(_currentIndex),
            text: _currentIndex == 0 ? 'My Skills' : 'Projects',
            fontSize: 24.sp,
          ),
          SizedBox(height: 20.h),
          _currentIndex == 0
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 20.h,
                    childAspectRatio: 1.5,
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
                    fontSize: 24.sp,
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
    Skill(imagePath: ImageConst.kCodemagic, skillName: 'Codemagic'),
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
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade900,
              const Color(0xFF12D6FF),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
          width: 2.r,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath,
                height: ScreenUtil().screenWidth < 600 ? 40.w : 60.w),
            SizedBox(height: 10.h),
            AnimatedText(
              text: skillName,
              fontSize: ScreenUtil().screenWidth < 600 ? 7.sp : 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
