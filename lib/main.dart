import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title:'Flutter App',
     home:MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget {

  // String titleInput;
  // String amountInput;
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title:Text('Flutter App')
      ),
      body:
      SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Container(
         width: double.infinity,
         height: 30,
         
        child:
        Card(
          
          color: Colors.lightBlue,
          child:Text('card'))),
          UserTransactions()
     
        
        ],
        ),
      ),
      
    );
  }
}