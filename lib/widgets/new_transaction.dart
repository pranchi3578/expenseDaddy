import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
   final titleController=TextEditingController();
  final amountController=TextEditingController();
  final Function transactionHandler;
  NewTransaction(this.transactionHandler);
  
  @override
  Widget build(BuildContext context) {
    return Card(
         elevation:5,
          child: Container(
            padding:EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:
               <Widget>[
              TextField(
                controller:titleController,
                // onChanged: (val){
                //   titleInput=val;
                // },
                decoration:
                 InputDecoration(hasFloatingPlaceholder: true,labelText: 'Title'),
                  ),
              TextField(
                controller: amountController,
                // onChanged:(val){ 
                //   amountInput=val;
                // },
                decoration: InputDecoration(hasFloatingPlaceholder: true,labelText: 'Amount'),),
              FlatButton(
                child: Text('Add Transaction',),
                onPressed:((){
                 transactionHandler(titleController.text,double.parse(amountController.text));
                }),
                textColor: Colors.purple,)
            ],
            ),
          ),
        );
  }
}