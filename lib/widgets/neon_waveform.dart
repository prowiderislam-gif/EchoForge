import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class NeonWaveform extends StatefulWidget {
  final double height;
  final int barCount;
  final bool animate;

  const NeonWaveform({
    super.key,
    this.height = 70,
    this.barCount = 32,
    this.animate = true,
  });

  @override
  State<NeonWaveform> createState() => _NeonWaveformState();
}

class _NeonWaveformState extends State<NeonWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    if (widget.animate) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant NeonWaveform oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animate && !oldWidget.animate) {
      _controller.repeat();
    } else if (!widget.animate && oldWidget.animate) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _barHeight(int index, double animationValue) {
    final wave = math.sin(
      (index * 0.75) + (animationValue * math.pi * 2),
    );

    final secondaryWave = math.sin(
      (index * 0.32) - (animationValue * math.pi * 4),
    );

    final normalized = ((wave + secondaryWave) + 2) / 4;

    return 12 + (normalized * (widget.height - 24));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              widget.barCount,
              (index) {
                final barHeight = widget.animate
                    ? _barHeight(index, _controller.value)
                    : _barHeight(index, 0);

                return Expanded(
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 80),
                      width: 3,
                      height: barHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppTheme.electricBlue,
                            AppTheme.cyan,
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x9900E5FF),
                            blurRadius: 7,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0x662979FF),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
