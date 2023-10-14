import "package:expenses_tracker/bar_graph/bar_graph.dart";
import "package:expenses_tracker/data/expense_data.dart";
import "package:expenses_tracker/datetime/datetime_helper.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
class ExpensesSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpensesSummary({
    super.key,
    required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    String sunday = DateTimeToString(startOfWeek.add(const Duration(days:0)));
    String monday = DateTimeToString(startOfWeek.add(const Duration(days:1)));
    String tuesday = DateTimeToString(startOfWeek.add(const Duration(days:2)));
    String wednesday = DateTimeToString(startOfWeek.add(const Duration(days:3)));
    String thursday = DateTimeToString(startOfWeek.add(const Duration(days:4)));
    String friday = DateTimeToString(startOfWeek.add(const Duration(days:5)));
    String saturday = DateTimeToString(startOfWeek.add(const Duration(days:6)));
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: BarGraph(
          maxY: 100,
          sunAmount: value.getDailyExpenseSummary()[sunday] ?? 0,
          monAmount: value.getDailyExpenseSummary()[monday] ?? 0,
          tueAmount: value.getDailyExpenseSummary()[tuesday] ?? 0,
          wedAmount: value.getDailyExpenseSummary()[wednesday] ?? 0,
          thuAmount: value.getDailyExpenseSummary()[thursday] ?? 0,
          friAmount: value.getDailyExpenseSummary()[friday] ?? 0,
          satAmount: value.getDailyExpenseSummary()[saturday] ?? 0,
        )
      )
    );
  }
}