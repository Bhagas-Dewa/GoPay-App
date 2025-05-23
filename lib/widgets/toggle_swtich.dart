import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const ToggleSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor = const Color(0xff088C15),
    this.inactiveColor = const Color(0xFFE2E5EA),
    this.width = 50,
    this.height = 30,
  }) : super(key: key);

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Set initial position based on value
    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final knobSize = widget.height * 0.85;
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height / 2),
              color: _getValue(widget.inactiveColor, widget.activeColor),
            ),
            child: Stack(
              children: [
                // Toggle knob
                Positioned(
                  left: _animation.value * (widget.width - knobSize) * 0.8 + widget.width * 0.05,
                  top: (widget.height - knobSize) / 2,
                  child: Container(
                    width: knobSize,
                    height: knobSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                  ),
                ),
                // Vertical line indicator for ON state
                if (widget.value)
                  Positioned(
                    left: widget.width * 0.26,
                    top: widget.height * 0.3,
                    child: Container(
                      width: 1,
                      height: widget.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                // Circle indicator for OFF state
                if (!widget.value)
                  Positioned(
                    right: widget.width * 0.15,
                    top: widget.height * 0.35,
                    child: Container(
                      width: widget.height * 0.32,
                      height: widget.height * 0.32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Color(0xFFC0C5C9), width: 1),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleTap() {
    if (widget.onChanged != null) {
      widget.onChanged!(!widget.value);
    }
  }

  Color _getValue(Color start, Color end) {
    return Color.lerp(start, end, _animation.value)!;
  }
}
