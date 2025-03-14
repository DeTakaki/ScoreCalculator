import 'package:flutter/material.dart';
import 'package:score_calculator/src/constants/app_sizes.dart';
import 'package:score_calculator/src/core/presentation/widgets/calculator_text_field.dart';

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
              CalculatorTextField(
                title: 'Annual income',
                textController: _annualIncomeController,
              ),
              CalculatorTextField(
                title: 'Monthly costs',
                textController: _monthlyCostsController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
