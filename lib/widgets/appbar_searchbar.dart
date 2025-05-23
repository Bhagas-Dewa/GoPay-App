import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String searchText;
  final VoidCallback? onBackPressed;
  final VoidCallback? onHelpPressed;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final FontWeight titleFontWeight;
  final double elevation;

  const AppBarSearchBar({
    Key? key,
    required this.title,
    required this.searchText,
    this.onBackPressed,
    this.onHelpPressed,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.iconColor = Colors.black,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.w600,
    this.elevation = 0.01,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
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
                      fontSize: 17,
                      fontWeight: titleFontWeight,
                      color: titleColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  if (onHelpPressed != null)
                    GestureDetector(
                      onTap: onHelpPressed,
                      child: Icon(
                        Icons.help_rounded,
                        color: iconColor,
                        size: 24,
                      ),
                    ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE6E7E9), Color(0xFFF1F2F4)],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded, size: 26, color: Colors.black),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: searchText,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w300,
                      ),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 70);
}
