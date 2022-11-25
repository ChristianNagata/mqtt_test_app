import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final int crossAxisCount;
  final int mainAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<Widget> children;

  const CustomGridView({
    Key? key,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
    required this.children,
    required this.crossAxisCount,
    required this.mainAxisCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingLR = crossAxisSpacing != 0 ? crossAxisSpacing / 2 : 0;
    double paddingBT = mainAxisSpacing != 0 ? mainAxisSpacing / 2 : 0;

    return Row(
      children: [
        for (int c = 0; c < crossAxisCount; c++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: paddingLR, right: paddingLR),
              child: Column(
                children: [
                  for (int r = 1; r <= mainAxisCount; r++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: paddingBT,
                          bottom: paddingBT,
                        ),
                        child: children[r + (mainAxisCount * c) - 1],
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}