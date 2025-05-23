import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarPrimary extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leftIcon;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final FontWeight titleFontWeight;
  final double elevation;
  final List<Widget>? actions;

  const AppbarPrimary({
    Key? key,
    required this.title,
    this.leftIcon,
    this.onBackPressed,
    this.backgroundColor = const Color(0xFFEEEFF3),
    this.iconColor = Colors.black,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.w600,
    this.elevation = 0.01,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onBackPressed ?? () => Get.back(),
                // child: Icon(
                //   leftIcon != null ? Icons.arrow_back_rounded : Icons.close_rounded,
                //   color: iconColor,
                //   size: 24,
                // ),
                child:
                    leftIcon ??
                    Icon(Icons.arrow_back_rounded, color: iconColor, size: 24),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: titleFontWeight, //normal w600
                  color: titleColor,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
