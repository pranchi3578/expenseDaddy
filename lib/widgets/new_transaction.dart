 
import 'package:flutter/material.dart';
class NewTransaction extends StatefulWidget {
  final Function transactionHandler;
  NewTransaction(this.transactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
   final titleController=TextEditingController();

  final amountController=TextEditingController();

  void submitData(){
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTitle.isEmpty||enteredAmount.isNegative){
      return;
    }
    
    widget.transactionHandler(
      enteredTitle,
    enteredAmount);
    Navigator.of(context).pop();
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