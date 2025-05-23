import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonHapusRiwayattransaksi extends StatefulWidget {
  final bool isActive;
  final VoidCallback? onTap;
  
  const ButtonHapusRiwayattransaksi({
    super.key,
    this.isActive = false,
    this.onTap,
  });

  @override
  State<ButtonHapusRiwayattransaksi> createState() =>
      _ButtonHapusRiwayattransaksiState();
}

class _ButtonHapusRiwayattransaksiState
    extends State<ButtonHapusRiwayattransaksi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isActive ? widget.onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: widget.isActive ? Colors.red : Color(0XFFC0C5C9), 
            width: 1
          ),
          color:Colors.transparent,
        ),
        child: Text(
          'Hapus',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: widget.isActive ? Colors.red : Color(0XFFC0C5C9),
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}