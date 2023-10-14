import "package:expenses_tracker/components/expense_tile.dart";
import "package:expenses_tracker/components/expenses_summary.dart";
import "package:expenses_tracker/data/expense_data.dart";
import "package:expenses_tracker/datetime/datetime_helper.dart";
import "package:expenses_tracker/models/expense_item.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controllers
    final newExpenseNameController = TextEditingController();
    final newExpenseAmountController = TextEditingController();
    final ExpenseData expenseData = new ExpenseData();
        // save
    void save(){
      ExpenseItem newExpense = ExpenseItem(name: newExpenseNameController.text, amount: newExpenseAmountController.text, date: DateTime.now());
      Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
      Navigator.pop(context);
    }
    // cancel
    void cancel(){
      Navigator.pop(context);
    }
    void addNewExpense(){
      showDialog(context: context, 
      builder: (context) => AlertDialog(
        title: Text("Add new expense"),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
            ),
            TextField(
              controller: newExpenseAmountController,
            )
          ],
          ),
        actions: [
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
        ],
      )
      );
    }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: Icon(Icons.add
          ),
          backgroundColor: Colors.black,
          ),
          body: ListView(  
            children: [
              SizedBox(height: 40),
              ExpensesSummary(startOfWeek: value.startOfWeek()),
              SizedBox(height: 20),
              ListView.builder(  
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getExpenses().length,
                itemBuilder: (context,index) => ExpenseTile(name: value.getExpenses()[index].name, date: value.getExpenses()[index].date, amount: value.getExpenses()[index].amount)
              )
            ]
          ),
    ),
    );
  }
}