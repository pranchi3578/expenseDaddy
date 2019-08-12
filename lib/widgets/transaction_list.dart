import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
final List<Transaction> _transactions;
final Function deleteTx;
TransactionList(this._transactions,this.deleteTx);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:450,
      child: _transactions.isEmpty? Column(children: <Widget>[
        Text('no transactions added yet!', style:Theme.of(context).textTheme.title),
        SizedBox(height: 30,),
     Container(
       height: 200,
       child: 
       Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
      ],) 
      : 
      ListView.builder(
        itemBuilder:(ctx,index){
            return Card(
              elevation: 5,
              margin:EdgeInsets.symmetric(vertical: 8,
              horizontal: 5,),
                          child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                child:Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox
                  (child: Text('\$${_transactions[index].amount}')),
                )),
                title: Text(
                  _transactions[index].title,style: Theme.of(context).textTheme.title,),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_transactions[index].date)
                  ),
                  trailing: IconButton(ico n:Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed:()=> deleteTx(_transactions[index].id.toString()),
                  ),
                  
                ),
            );
        } ,
        itemCount: _transactions.length,
         
            
         
        ),
    );
  }
}