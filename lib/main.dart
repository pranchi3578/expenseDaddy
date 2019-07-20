import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title:'ExpenseDaddy',
     theme: ThemeData(
        textTheme:ThemeData.light().textTheme.copyWith(
           title:TextStyle(
             fontFamily:'OpenSans',
             fontSize:18,
             fontWeight: FontWeight.bold),),
       primarySwatch: Colors.purple,
       accentColor: Colors.lime,
       fontFamily:'Quicksand',
       appBarTheme: AppBarTheme(
         textTheme:ThemeData.light().textTheme.copyWith(
           title:TextStyle(
             fontFamily:'OpenSans',
             fontSize: 20,
             fontWeight: FontWeight.bold),
         ), )
     ),
     home:MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Transaction>_userTransactions=[
  //   Transaction(
  //     id:'t1',
  //   title: 'new Shoes', 
  //   amount: 7437, 
  //   date:DateTime.now()
  //   ),
  //     Transaction(
  //     id:'t2',
  //   title: 'weekly grosary', 
  //   amount: 10.46,
  //   date:DateTime.now()
  //   ) 
   ]; 
   List<Transaction>get _recentTransactions{
     return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days:7),
        ),
      );
     }).toList();
   }
 
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


    void _startAddNewTransaction(BuildContext ctx){
      showModalBottomSheet(context:ctx,builder:(bCtx){
          return NewTransaction(_addNewTransaction);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(       
        onPressed: ()=>_startAddNewTransaction(context),
        child:Icon(Icons.add)
        ),
      appBar: 
      AppBar(
        title:Text('\$ Daddy',
        ),
        
        actions: <Widget>[
          IconButton(icon:Icon(Icons.add),
          onPressed: ()=>_startAddNewTransaction(context))
        ],
      ),
      body:
      SingleChildScrollView(
              child: Column(
                
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Chart(_recentTransactions), 
          TransactionList(_userTransactions),
     
        
        ],
        ),
      ),
      
    );
  }
}