import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.backgroundColor,
    required this.fillColor,
    required this.fillAmount,
    this.height = 8,
    this.fontSize = 18,
  }) : super(key: key);

  final Color backgroundColor;
  final Color fillColor;
  final double fillAmount;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5), // fully rounded ends
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Container(
                height: height,
                width: constraints.maxWidth * fillAmount,
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(5), // fully rounded ends
                ),
              ),
            ),
          ],
        ),
        Text(
          '${(fillAmount * 100).round().toString()}% achieved',
          style: TextStyle(
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
