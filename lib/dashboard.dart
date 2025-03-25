import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/pages/about_page.dart';
import 'package:port/pages/skill_page.dart';

enum PageIndex { home, about, skills, certificates, contact }

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  PageIndex _currentPage = PageIndex.home;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() => _currentPage = PageIndex.values[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      } else if (details.primaryVelocity! > 0) {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: _onPageChanged,
                      children: PageIndex.values
                          .map((page) => _buildScreen(page))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Container(
        child: const Text("D"),
      ),
    );
  }

  // 📌 Header with Text Buttons
  Widget _buildHeader() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Portfolio',
              style: TextStyle(fontSize: 24.sp, color: Colors.white)),
          Row(
            children: PageIndex.values.map((page) {
              return TextButton(
                onPressed: () {
                  setState(() => _currentPage = page);
                  _pageController.animateToPage(
                    page.index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  page.name.toUpperCase(),
                  style: TextStyle(
                    color: _currentPage == page
                        ? const Color.fromARGB(255, 11, 55, 130)
                        : Colors.white60,
                    fontSize: 16.sp,
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // 📌 Main Content Section
  Widget _buildScreen(PageIndex page) {
    switch (page) {
      case PageIndex.home:
        return Center(
            child: Text('Welcome to my Portfolio',
                style: TextStyle(color: Colors.white, fontSize: 24.sp)));
      case PageIndex.about:
        return const AboutMe();
      case PageIndex.skills:
        return const SkillPage();
      case PageIndex.certificates:
        return Center(
            child: Text('Certificates',
                style: TextStyle(color: Colors.white, fontSize: 24.sp)));
      case PageIndex.contact:
        return Center(
            child: Text('Contact Me',
                style: TextStyle(color: Colors.white, fontSize: 24.sp)));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
