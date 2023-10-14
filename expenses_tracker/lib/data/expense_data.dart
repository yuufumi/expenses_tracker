import 'package:expenses_tracker/datetime/datetime_helper.dart';
import 'package:expenses_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier{
  // list of all expenses
  List<ExpenseItem> allItems = [];
  //get expenses list
  List<ExpenseItem> getExpenses(){
    return allItems;
  }

  //add new expense
  void addNewExpense(ExpenseItem newExpense){
    allItems.add(newExpense);
  
    notifyListeners();
  }


  //delete expense
  void deleteExpense(ExpenseItem selectedExpense){
    allItems.remove(selectedExpense);
    notifyListeners();
  }
  // get weekday (mon,tue,wed ) from a datetime object 
  String getDayName(DateTime date){
    switch (date.weekday){
      case 1: return "Mon";
      case 2: return "Tue";
      case 3: return "Wed";
      case 4: return "Thu";
      case 5: return "Fri";
      case 6: return "Sat";
      case 7: return "Sun";
      default:
      return "";
    }
  } 
  // get the date for the start of the week (sunday)
  DateTime startOfWeek(){
    DateTime? startOfWeek;

    // get todays date
    DateTime today = DateTime.now();
    for (int i=0;i<7;i++){
      if(getDayName(today.subtract(Duration(days: i))) == "Sun"){
        startOfWeek = today.subtract(Duration(days: i));
      }
    } 
    return startOfWeek!;
  }
  /*
  convert overall list of expenses to a daily expense summary

  e.g

  overAllExpenseList = 
  [
    [food,01/01/2023,10],
    [shirt,01/01/2023,20],
    [transport,02/01/2023,5],
    [subscription,02/01/2023,10],
  ]
  ->
  dailyExpenseSummary = [
    [01/01/2023, 30],
    [02/01/2023,15]
  ]

  */ 
  Map<String, double> getDailyExpenseSummary(){
    Map<String,double> dailyExpensesSummary = {
      // yyyymmdd: amount
    };
    for (var expense in allItems){
      String date = DateTimeToString(expense.date);
      double amount = double.parse(expense.amount);
      if(dailyExpensesSummary.containsKey(date)){
        double currentDailyExpense = dailyExpensesSummary[date]!; 
        currentDailyExpense+=amount; 
        dailyExpensesSummary[date] = currentDailyExpense;
      }else{
        dailyExpensesSummary.addAll({date:amount});
      }
    }
    return dailyExpensesSummary;
  }
}