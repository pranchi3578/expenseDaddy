import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
   final titleController=TextEditingController();
  final amountController=TextEditingController();
  final Function transactionHandler;
  NewTransaction(this.transactionHandler);

  void submitData(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTitle.isEmpty||enteredAmount.isNegative){
      return;
    }
    
    transactionHandler(
      enteredTitle,
    enteredAmount);
     }
  
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
                onSubmitted:(_)=>submitData(), 

                controller:titleController,
                // onChanged: (val){
                //   titleInput=val;
                // },
                decoration:
                 InputDecoration(hasFloatingPlaceholder: true,labelText: 'Title'),
                  ),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted:(_)=>submitData(), 
                // onChanged:(val){ 
                //   amountInput=val;
                // },
                decoration: InputDecoration(hasFloatingPlaceholder: true,labelText: 'Amount'),),
              FlatButton(
                child: Text('Add Transaction',),
                onPressed:submitData,
                textColor: Colors.purple,)
            ],
            ),
          ),
        );
  }
}