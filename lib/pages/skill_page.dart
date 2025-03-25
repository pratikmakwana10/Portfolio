import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/component/dynamic_text_widget.dart';
import 'package:port/component/text_animated.dart';
import 'package:port/utility/constants.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});
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

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 1,
        ),
        itemCount: skillList.length,
        itemBuilder: (context, index) {
          return SkillCard(skill: skillList[index]);
        },
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(skill.imagePath, height: 60.w, width: 60.w),
          SizedBox(height: 10.h),
          Text(
            skill.skillName,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
