 
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function transactionHandler;
  NewTransaction(this.transactionHandler);
  

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
   final _titleController=TextEditingController();

  final _amountController=TextEditingController();
  DateTime _selectedDate;

  void submitData(){
    if(_amountController.text.isEmpty)
    {
      return;
    }
    final enteredTitle=_titleController.text;
    final enteredAmount=double.parse(_amountController.text);
    
    if(enteredTitle.isEmpty||enteredAmount.isNegative||_selectedDate==null){
      return;
    }
   widget.transactionHandler(
      enteredTitle,
    enteredAmount,
    _selectedDate
    );
    Navigator.of(context).pop();
     }


     void _presentDatePicker(){
      showDatePicker(
        context:context,
      initialDate: DateTime.now(),
      firstDate:DateTime(2019),
      lastDate: DateTime.now()
      ).then((pickedDate){
        if (pickedDate==null){
          return;
        }
        setState(() {
          _selectedDate=pickedDate;
        });
        
      });
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

                controller:_titleController,
                // onChanged: (val){
                //   titleInput=val;
                // },
                decoration:
                 InputDecoration(hasFloatingPlaceholder: true,labelText: 'Title'),
                  ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                onSubmitted:(_)=>submitData(), 
                // onChanged:(val){ 
                //   amountInput=val;
                // },
                decoration: InputDecoration(hasFloatingPlaceholder: true,labelText: 'Amount'),),
              Container(
                height: 70,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate==null?'no date choosen'
                    :
                    'picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',
                    style:TextStyle(
                      fontWeight: FontWeight.bold)
                    ),
                    onPressed:_presentDatePicker,)
                ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,           
                child: Text('Add Transaction',),
                onPressed:submitData,
                textColor:Theme.of(context).textTheme.button.color,)
            ],
            ),
          ),
        );
  }
}