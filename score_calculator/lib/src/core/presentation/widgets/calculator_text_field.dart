import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';

class CalculatorTextField extends StatelessWidget {
  const CalculatorTextField({
    super.key,
    required this.title,
    required this.textController,
  });

  final String title;
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: GoogleFonts.workSans(
            fontSize: Sizes.p12,
          ),
        ),
        gapH2,
        TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Only numbers',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGray)),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Sizes.p8,
              vertical: Sizes.p8,
            ),
            prefixIcon: Icon(
              Icons.attach_money_outlined,
            ),
          ),
          style: GoogleFonts.rubik(
              color: AppColors.textColor, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
