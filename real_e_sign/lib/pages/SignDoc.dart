import 'package:flutter/material.dart';


class DocumentSigner extends StatefulWidget {
  const DocumentSigner({super.key});
  @override
  _DocumentSignerState createState() => _DocumentSignerState();
}

class _DocumentSignerState extends State<DocumentSigner> {
  TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Signer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Text(
                  'Selected Date: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 10.0),
                _selectedDate == null
                    ? Text(
                        'No Date Selected',
                        style: TextStyle(fontSize: 16.0),
                      )
                    : Text(
                        '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality for selecting a document to sign
              },
              child: Text('Select a Document to Sign'),
            ),
          ],
        ),
      ),
    );
  }
}