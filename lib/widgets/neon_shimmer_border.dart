import 'package:flutter/material.dart';

class NeonShimmerBorder extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const NeonShimmerBorder({
    super.key,
    required this.child,
    this.borderRadius = 22,
    this.padding = const EdgeInsets.all(1),
  });

  @override
  State<NeonShimmerBorder> createState() => _NeonShimmerBorderState();
}

class _NeonShimmerBorderState extends State<NeonShimmerBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final shimmerPosition = _controller.value;

        return Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: SweepGradient(
              transform: GradientRotation(
                shimmerPosition * 6.283185307,
              ),
              colors: const [
                Color(0x3300E5FF),
                Color(0xFF00E5FF),
                Color(0xFF2979FF),
                Color(0x337C4DFF),
                Color(0x3300E5FF),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x5500E5FF),
                blurRadius: 16,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Color(0x332979FF),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xE6050B12),
              borderRadius: BorderRadius.circular(
                widget.borderRadius - 1,
              ),
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
