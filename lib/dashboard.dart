import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:port/component/text_animated.dart';
import 'package:port/pages/about_page.dart';
import 'package:port/pages/certi_page.dart';
import 'package:port/pages/experience_page.dart';
import 'package:port/pages/skill_page.dart';

enum PageIndex { home, skills, experience, about, certificates, contact }

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
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isMobile
          ? AppBar(
              title: const Text('Portfolio',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              child: ListView(
                children: PageIndex.values.map((page) {
                  return ListTile(
                    title: Text(capitalizeFirstLetter(page.name)),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => _currentPage = page);
                      _pageController.animateToPage(
                        page.index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  );
                }).toList(),
              ),
            )
          : null,
      body: Column(
        children: [
          if (!isMobile) _buildHeader(),
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
                children:
                    PageIndex.values.map((page) => _buildScreen(page)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AnimatedText(
            text: 'Pratik Makwana',
            fontSize: 25,
            duration: Duration(seconds: 3),
          ),
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
                  capitalizeFirstLetter(page.name),
                  style: TextStyle(
                    color: _currentPage == page
                        ? const Color(0xFF12D6FF)
                        : Colors.white54,
                    fontWeight: FontWeight.bold,
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

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _buildScreen(PageIndex page) {
    switch (page) {
      case PageIndex.home:
        return const AboutMe();
      case PageIndex.about:
        return const AboutMe();
      case PageIndex.skills:
        return SkillPage();
      case PageIndex.certificates:
        return CertificatePage();
      case PageIndex.experience:
        return const ExperiencePage();
      case PageIndex.contact:
        return Center(
          child: Text(
            'Contact Me',
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
