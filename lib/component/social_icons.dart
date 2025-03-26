import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIconButton({super.key, required this.icon, required this.url});

  @override
  _SocialIconButtonState createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  // Define original colors based on the platform
  Color _getOriginalColor() {
    if (widget.url.contains('youtube')) {
      return const Color(0xFFFF0000);
    } else if (widget.url.contains('github')) {
      return Colors.white;
    } else if (widget.url.contains('medium')) {
      return Colors.white;
    } else if (widget.url.contains('linkedin')) {
      return const Color(0xFF0077B5); // LinkedIn blue
    } else if (widget.url.contains('facebook')) {
      return const Color(0xFF1877F2); // Facebook blue
    }
    return Colors.grey[500]!;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IconButton(
        icon: FaIcon(
          widget.icon,
          color: _isHovered ? _getOriginalColor() : Colors.grey[500],
          size: 24.sp,
        ),
        onPressed: () => _launchURL(widget.url),
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
