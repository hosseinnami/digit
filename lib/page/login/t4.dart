import 'package:flutter/material.dart';

class CheckBoxExample extends StatefulWidget {
  @override
  _CheckBoxExampleState createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  void _checkConditions() {
    if (isChecked1 && isChecked2) {
      // دستورات مورد نظر زمانی که هر دو چک باکس تیک خورده‌اند
      print("Both checkboxes are checked!");
    } else {
      // پیغام هشدار
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You must accept both checkboxes")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text("Check this box"),
              value: isChecked1,
              activeColor: Colors.black,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Check this box too"),
              value: isChecked2,
              activeColor: Colors.black,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkConditions,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CheckBoxExample(),
  ));
}
