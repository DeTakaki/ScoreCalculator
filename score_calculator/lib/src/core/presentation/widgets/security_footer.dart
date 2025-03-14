import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';

class SecurityFooterWidget extends StatelessWidget {
  const SecurityFooterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.lock_outline,
          size: Sizes.p24,
          color: Colors.grey,
        ),
        gapH8,
        Text(
          "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
          style: GoogleFonts.workSans(color: AppColors.lightGray),
        ),
      ],
    );
  }
}
