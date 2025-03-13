import 'package:flutter/material.dart';
import 'package:score_calculator/src/constants/app_images.dart';
import 'package:score_calculator/src/core/presentation/widgets/base_layout.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Expanded(
        child: Column(
          children: [Image.asset(AppImages.kalshiLogo)],
        ),
      ),
    );
  }
}
