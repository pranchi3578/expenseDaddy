import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';
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
  final List<Transaction> transaction=[
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title:Text('Flutter App')
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      Container(
       width: double.infinity,
      child:
      Card(
        color: Colors.black45,
        child:Text('card'))),
       Card(
         elevation:5,
          child: Container(
            padding:EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:
               <Widget>[
              TextField(decoration: InputDecoration(hasFloatingPlaceholder: true,labelText: 'Title'), ),
              TextField(decoration: InputDecoration(hasFloatingPlaceholder: true,labelText: 'Amount'),),
              FlatButton(child: Text('Add Transaction',),onPressed:((){}),textColor: Colors.purple,)
            ],
            ),
          ),
        ),
      Column(
        children: transaction.map((tx){
          return Card(
          child:
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin:EdgeInsets.symmetric(
                    vertical: 10,
                  horizontal: 15),
                  decoration:
                   BoxDecoration(
                     border: 
                     Border.all(
                       color:
                       Colors.purple,
                       width:2)
                       ),
              child:
              Text(
                '\$ ${tx.amount}',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.purple,
              ),)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children:
               <Widget>[
                Text(tx.title,
                style:
                 TextStyle(
                   fontSize: 16,
                fontWeight: FontWeight.bold),),
                 Text(
                   DateFormat().format(tx.date),
                   style: TextStyle(color:Colors.grey),
                   ),
              ],
              )
          ],),);
        }).toList(),
          
       
      )
      
      ],
      ),
      
    );
  }
}