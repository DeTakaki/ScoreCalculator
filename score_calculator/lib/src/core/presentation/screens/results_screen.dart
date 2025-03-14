import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';
import 'package:score_calculator/src/core/presentation/providers/user_score_provider.dart';
import 'package:score_calculator/src/core/presentation/widgets/base_layout.dart';
import 'package:score_calculator/src/core/presentation/widgets/kalshi_header.dart';
import 'package:score_calculator/src/core/presentation/widgets/results_card.dart';
import 'package:score_calculator/src/core/presentation/widgets/security_footer.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userIncomeProvider);
    return BaseLayout(
      child: Column(
        children: [
          const KalshiHeader(),
          gapH48,
          Expanded(
            child: ColoredBox(
              color: AppColors.resultsBackgroundScreen,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p44, vertical: Sizes.p10),
                child: Column(
                  children: [
                    EasyRichText(
                      "Here's your financial wellness score.",
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
                    ResultsCard(results: user.healthStatus()),
                    gapH32,
                    const SecurityFooterWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
