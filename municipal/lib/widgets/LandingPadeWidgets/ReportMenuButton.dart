import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class ReportMenuButton extends StatefulWidget {
  final double size;
  final VoidCallback? onPressed;

  const ReportMenuButton({super.key, this.size = 82, this.onPressed});

  @override
  State<ReportMenuButton> createState() => _ReportMenuButtonState();
}

class _ReportMenuButtonState extends State<ReportMenuButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  bool _isRotated = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize AnimationController with a duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Smooth animation duration
    );

    // Define rotation animation: Tween from 0 to 45 degrees
    _rotationAnimation = Tween<double>(begin: 0, end: 45).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _onTap() {
    setState(() {
      // Toggle the rotation state
      _isRotated = !_isRotated;
    });

    if (_isRotated) {
      _controller.forward();  // Rotate the icon
    } else {
      _controller.reverse();  // Reset the rotation
    }

    // Call external onPressed if available
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  void dispose() {
    // Dispose the controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap, // Trigger the rotation animation
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: accentColor.withOpacity(0.8), // Button color
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller, // Listen to the controller
            builder: (context, child) {
              // Apply rotation using the animation's value in radians
              return Transform.rotate(

                angle: _rotationAnimation.value * (-3.14159 / 180), 
                child: child,
              );
            },
            child: Icon(
              Icons.add,
              size: widget.size * 0.75, // Icon size
              color: backgroundColor, // Icon color
            ),
          ),
        ),
      ),
    );
  }
}
