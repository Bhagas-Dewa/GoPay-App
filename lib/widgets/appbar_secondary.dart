import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarSecondary extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final FontWeight titleFontWeight;
  final double elevation;
  final Widget? rightIcon;

  const AppbarSecondary({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.backgroundColor = const Color(0xFFEEEFF3),
    this.iconColor = Colors.black,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.w600,
    this.elevation = 0.01,
    this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 19,
                  fontWeight: titleFontWeight,
                  color: titleColor,
                  letterSpacing: -0.3,
                ),
              ),
              const Spacer(),
              if (rightIcon != null) rightIcon!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
