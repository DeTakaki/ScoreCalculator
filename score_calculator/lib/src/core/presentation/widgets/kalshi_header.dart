import 'package:flutter/material.dart';
import 'package:score_calculator/src/constants/app_images.dart';

class KalshiHeader extends StatelessWidget {
  const KalshiHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(AppImages.kalshiLogo),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
