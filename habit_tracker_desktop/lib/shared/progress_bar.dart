import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.backgroundColor,
    required this.fillColor,
    required this.fillAmount,
  }) : super(key: key);

  final Color backgroundColor;
  final Color fillColor;
  final double fillAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5), // fully rounded ends
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Container(
                height: 10,
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
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
