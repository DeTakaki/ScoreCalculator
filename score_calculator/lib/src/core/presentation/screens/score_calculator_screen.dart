import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';
import 'package:score_calculator/src/core/presentation/widgets/base_layout.dart';
import 'package:score_calculator/src/core/presentation/widgets/calculator_card.dart';
import 'package:score_calculator/src/core/presentation/widgets/kalshi_header.dart';
import 'package:score_calculator/src/core/presentation/widgets/security_footer.dart';

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
        children: [
          const KalshiHeader(),
          gapH48,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p44),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EasyRichText(
                  "Let's find out your financial wellness score.",
                  minLines: 2,
                  textAlign: TextAlign.center,
                  defaultStyle: GoogleFonts.workSans(
                    fontSize: Sizes.p18,
                    color: AppColors.primary,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'financial wellness score.',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                gapH24,
                const CalculatorCard(),
                gapH32,
                const SecurityFooterWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
