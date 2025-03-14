import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_images.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';
import 'package:score_calculator/src/core/presentation/widgets/calculator_text_field.dart';
import 'package:score_calculator/src/routing/routes_strings.dart';

class CalculatorCard extends StatefulWidget {
  const CalculatorCard({super.key});

  @override
  State<CalculatorCard> createState() => _CalculatorCardState();
}

class _CalculatorCardState extends State<CalculatorCard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _annualIncomeController = TextEditingController();
  final TextEditingController _monthlyCostsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Image(
                height: Sizes.p48,
                width: Sizes.p48,
                image: AssetImage(
                  AppImages.calculatorLogo,
                ),
              ),
              gapH16,
              Text(
                'Financial wellness test',
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500, fontSize: Sizes.p20),
              ),
              Text(
                'Enter your financial information below',
                style: GoogleFonts.workSans(
                  color: AppColors.lighterTextColor,
                  fontSize: Sizes.p14,
                ),
              ),
              gapH16,
              CalculatorTextField(
                title: 'Annual income',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field';
                  }
                  return null;
                },
                textController: _annualIncomeController,
              ),
              CalculatorTextField(
                title: 'Monthly costs',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field';
                  }
                  return null;
                },
                textController: _monthlyCostsController,
              ),
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.goNamed(RoutesStrings.results);
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
