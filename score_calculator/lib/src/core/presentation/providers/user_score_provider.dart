import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_calculator/src/core/data/user.dart';

final userIncomeProvider = StateProvider.autoDispose<User>(
    (_) => const User(annualIncome: 0, montlyCosts: 0));
