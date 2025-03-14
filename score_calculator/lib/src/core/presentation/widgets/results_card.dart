import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:score_calculator/src/constants/app_colors.dart';
import 'package:score_calculator/src/constants/app_images.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';

class ResultsCard extends StatefulWidget {
  const ResultsCard({super.key, required this.results});

  final ({String title, String health, double score}) results;

  @override
  State<ResultsCard> createState() => _ResultsCardsState();
}

class _ResultsCardsState extends State<ResultsCard>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1300),
        upperBound: widget.results.score)
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Row(
          children: [
            Expanded(
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
                  LinearProgressIndicator(
                    value: animationController.value,
                    minHeight: 15,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Sizes.p20)),
                    backgroundColor: AppColors.progressbarBackgroundColor,
                    color: switch (widget.results.score) {
                      0.33 => Colors.red,
                      0.66 => Colors.yellow,
                      1 => Colors.green,
                      _ => Colors.yellow,
                    },
                  ),
                  gapH16,
                  Text(
                    widget.results.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: Sizes.p20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  gapH2,
                  Text(
                    'Your financial wellness score is',
                    style: GoogleFonts.workSans(),
                  ),
                  Text(
                    widget.results.health,
                    style: GoogleFonts.workSans(fontWeight: FontWeight.w600),
                  ),
                  gapH16,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                side: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2,
                                )),
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('Return'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapH16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
