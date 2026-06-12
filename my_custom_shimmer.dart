import 'package:flutter/material.dart';
import 'package:project/commons/app_dimensions.dart';
import 'package:project/commons/commons.dart';
import 'package:project/constants/colors.dart';

class CommonShimmer extends StatefulWidget {
  const CommonShimmer({
    super.key,
    this.height,
    this.width,
    this.baseColor,
    this.moveColor,
    required this.children,
  });

  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? moveColor;

  final List<Widget> children;

  @override
  State<CommonShimmer> createState() => _RatingShimmerState();
}

class _RatingShimmerState extends State<CommonShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get moveColor => widget.baseColor ?? DarkColors.surfaceO;
  Color get baseColor => widget.moveColor ?? DarkColors.item;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final double animationValue = _controller.value;
            return LinearGradient(
              begin: Alignment(-1.5 + animationValue * 3.0, -0.3),
              end: Alignment(-0.5 + animationValue * 3.0, 0.3),
              colors: [
                moveColor.withOpacity(0.65),
                moveColor.withOpacity(0.1),
                moveColor.withOpacity(0.65),
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: Container(
        width: widget.width ?? context.screenWidth * 0.3,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: DarkColors.border.withOpacity(0.1),
            width: 1.5,
          ),
          color: baseColor.withOpacity(0.3),
          borderRadius: borderRadius(16.0),
        ),
        padding: padding(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.children,
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.height,
    this.isChip = false,
    this.isCircle = false,
    this.width,
  });

  final double? height;
  final double? width;
  final bool isCircle;
  final bool isChip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isChip ? 24.0 : height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: isCircle ? null : borderRadius(isChip ? 16.0 : 10.0),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        color: DarkColors.item,
      ),
    );
  }
}
