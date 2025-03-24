import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSkillCard extends StatefulWidget {
  final String imagePath;
  final String skillName;

  const AnimatedSkillCard({
    super.key,
    required this.imagePath,
    required this.skillName,
  });

  @override
  _AnimatedSkillCardState createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<AnimatedSkillCard> {
  late double _leftPosition;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    _leftPosition = 0;
    _textColor = Colors.white54;

    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _leftPosition = _leftPosition == 0 ? 10.w : 0;
        _textColor = _textColor == Colors.white54
            ? Colors.blue.shade800
            : Colors.white54;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      padding: EdgeInsets.only(left: _leftPosition),
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
              widget.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.white54),
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: TextStyle(fontSize: 18.sp, color: _textColor),
            child: Text(widget.skillName),
          ),
        ],
      ),
    );
  }
}
