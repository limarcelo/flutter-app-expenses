import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_datepiker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              right: 10.0,
              left: 10.0,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                AdaptativeTextField(
                  label: 'Titulo',
                  controller: _titleController,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeTextField(
                  label: 'Valor (R\$)',
                  controller: _valueController,
                  keyBoardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate){
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(
                      label: 'Nova Transação',
                      onPressed: _submitForm(),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
