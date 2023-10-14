import "package:flutter/material.dart";



class ExpenseTile extends StatelessWidget {
  final String name;
  final DateTime date;
  final String amount;
  ExpenseTile({required this.name, required this.date, required this.amount});
  @override
  Widget build(BuildContext context) {
    return ListTile(
            title: Text(name),
            subtitle: Text(date.year.toString() +"/"+ date.month.toString() +"/" +  date.day.toString()),
            trailing: Text('\$'+amount)
      );
  }
}