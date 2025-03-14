import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';

class CalculatorTextField extends StatelessWidget {
  const CalculatorTextField({
    super.key,
    required this.title,
    required this.textController,
    required this.validator,
  });

  final String title;
  final FormFieldValidator<String>? validator;
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
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          // initialValue: '0,00',
          decoration: const InputDecoration(
            hintText: '0,00',
            hintStyle: TextStyle(color: AppColors.lighterTextColor),
            errorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: Sizes.p8,
              vertical: Sizes.p8,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: null,
            prefixIcon: Icon(
              Icons.attach_money_outlined,
              color: AppColors.currencyColor,
            ),
          ),
          inputFormatters: [
            CurrencyTextInputFormatter.currency(
              symbol: '',
              enableNegative: false,
            ),
          ],
          style: GoogleFonts.rubik(
              color: AppColors.textColor, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
