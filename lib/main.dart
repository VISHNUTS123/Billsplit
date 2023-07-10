import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String totalAmount = '';
  String taxPercentage = '';
  int numFriends = 1;
  int tipPercentage = 0;

  void enteredTotalAmount(String value) {
    setState(() {
      totalAmount += value;
    });
  }

  void clearEnteredValue(String value) {
    setState(() {
      totalAmount = '';
    });
  }

  void incrementTip() {
    setState(() {
      if (tipPercentage < 100) {
        tipPercentage++;
      }
    });
  }

  void decrementTip() {
    setState(() {
      if (tipPercentage > 0) {
        tipPercentage--;
      }
    });
  }

  void updateNumberOfFriends(double value) {
    setState(() {
      numFriends = value.toInt();
    });
  }

  void updateTaxPercentage(String value) {
    setState(() {
      taxPercentage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Split'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Amount:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Text(
                totalAmount,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Number',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Friends',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tax',
                            ),
                            Text(
                              'Tip',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Text 1',
                            ),
                            Text(
                              'Text 2',
                            ),
                            Text(
                              'Text 3',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'How Many friends?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Slider(
              value: numFriends.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: updateNumberOfFriends,
            ),
            Text(
              numFriends.toString(),
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'TIP',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: incrementTip,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 20.0),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                ' $tipPercentage',
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: decrementTip,
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TAX IN %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter tax percentage',
                          ),
                          onChanged: updateTaxPercentage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 3.0,
                shrinkWrap: true,
                children: [
                  dialpadButton('1', enteredTotalAmount),
                  dialpadButton('2', enteredTotalAmount),
                  dialpadButton('3', enteredTotalAmount),
                  dialpadButton('4', enteredTotalAmount),
                  dialpadButton('5', enteredTotalAmount),
                  dialpadButton('6', enteredTotalAmount),
                  dialpadButton('7', enteredTotalAmount),
                  dialpadButton('8', enteredTotalAmount),
                  dialpadButton('9', enteredTotalAmount),
                  dialpadButton('.', enteredTotalAmount),
                  dialpadButton('0', enteredTotalAmount),
                  dialpadButton('C', clearEnteredValue),
                ],
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                // Handle Calculate Now button press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Calculate(

                    ),
                  ),
                );
              },
              child: Text('CALCULATE NOW', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget dialpadButton(String value, Function(String) addToEnteredValue) {
    return ElevatedButton(
      onPressed: () {
        addToEnteredValue(value);
      },
      child: Text(value),
    );
  }
}
