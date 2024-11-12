import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class ReportMenuButton extends StatefulWidget {
  final double size; 
  final VoidCallback? onPressed;

  const ReportMenuButton({super.key, this.size = 82, this.onPressed});

  @override
  State<ReportMenuButton> createState() => _ReportMenuButtonState();
}

class _ReportMenuButtonState extends State<ReportMenuButton> {
  double _angleOfRotation = 0;

  void _onTap() {
    setState(() {
      _angleOfRotation += 45;
      _angleOfRotation %= 360;
    });
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: accentColor, 
        ),
        child: Center(
          child: Transform.rotate(
            angle: _angleOfRotation * (3.14159 / 180), //Radian is a bitch
            child: Icon(
              Icons.add, 
              size: widget.size * 0.75, 
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
