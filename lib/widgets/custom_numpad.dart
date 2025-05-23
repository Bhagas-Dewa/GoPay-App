import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomNumpad extends StatelessWidget {
  final Function(String)? onNumberPressed;
  final Function()? onBackspacePressed;

  const CustomNumpad({
    super.key,
    this.onNumberPressed,
    this.onBackspacePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildButton("1"),
        _buildButton("2"),
        _buildButton("3"),
        _buildButton("÷"),
        _buildButton("4"),
        _buildButton("5"),
        _buildButton("6"),
        _buildButton("×"),
        _buildButton("7"),
        _buildButton("8"),
        _buildButton("9"),
        _buildButton("-"),
        _buildButton("0"),
        _buildButton("000"),
        _buildButton("⌫"),
        _buildButton("+"),
      ],
    );
  }

  Widget _buildButton(String label) {
    bool isOperator = ["÷", "×", "-", "+"].contains(label);
    bool isBackspace = label == "⌫";

    return GestureDetector(
      onTap: () {
        if (isBackspace) {
          onBackspacePressed?.call();
        } else {
          onNumberPressed?.call(label);
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOperator ? Colors.white.withOpacity(0.5) : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
