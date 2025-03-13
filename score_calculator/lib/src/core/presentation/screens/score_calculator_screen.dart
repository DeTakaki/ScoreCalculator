import 'package:flutter/material.dart';
import 'package:score_calculator/src/constants/app_images.dart';
import 'package:score_calculator/src/core/presentation/widgets/base_layout.dart';

class ScoreCalculatorScreen extends StatefulWidget {
  const ScoreCalculatorScreen({super.key});

  @override
  State<ScoreCalculatorScreen> createState() => _ScoreCalculatorScreenState();
}

class _ScoreCalculatorScreenState extends State<ScoreCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        children: [Image(image: AssetImage(AppImages.kalshiLogo))],
      ),
    );
  }
}
