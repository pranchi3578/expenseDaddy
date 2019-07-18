import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';
class UserTransactions extends StatefulWidget {
 

  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  
  final List<Transaction>_userTransactions=[
    Transaction(
      id:'t1',
    title: 'new Shoes', 
    amount: 7437, 
    date:DateTime.now()
    ),
      Transaction(
      id:'t2',
    title: 'weekly grosary', 
    amount: 10.46,
    date:DateTime.now()
    ) 
  ]; 
 
  void _addNewTransaction(String title,double amount){
   final NewTx=Transaction(title:title,
   amount: amount,
   date: DateTime.now(),
   id: DateTime.now().toString()
   );
   

   setState((){
_userTransactions.add(NewTx);
   }
   );
 }
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         NewTransaction(_addNewTransaction), 
     TransactionList(_userTransactions)
      ],
    );
  }
}