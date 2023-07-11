import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  EnteredValues createState() => EnteredValues();
}

class EnteredValues extends State<HomePage> {
  String totalAmount = '';
  String taxPercentage = '';
  int numFriends = 1;
  int tip = 0;

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
      if (tip < 100) {
        tip++;
      }
    });
  }

  void decrementTip() {
    setState(() {
      if (tip > 0) {
        tip--;
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
                              '${numFriends}',
                            ),
                            Text(
                              '${taxPercentage} %',
                            ),
                            Text(
                              '${tip}',
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
                              backgroundColor: Colors.deepOrangeAccent,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 20.0),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                ' $tip',
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: decrementTip,
                              backgroundColor: Colors.deepOrangeAccent,
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
                childAspectRatio: 1.5,
                padding: EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculateNow(
                      totalAmount: totalAmount,
                      taxPercentage: taxPercentage,
                      numFriends: numFriends,
                      tip: tip,
                    ),
                  ),
                );
              },
              child: Text('CALCULATE NOW'),
            ),
          ],
        ),
      ),
    );
  }

  Widget dialpadButton(String value, Function(String) addToEnteredValue) {
    return RawMaterialButton(
      onPressed: () {
        addToEnteredValue(value);
      },
      shape: CircleBorder(),
      fillColor: Colors.lightGreenAccent,
      padding: EdgeInsets.all(9.0),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class CalculateNow extends StatelessWidget {
  final String totalAmount;
  final String taxPercentage;
  final int numFriends;
  final int tip;

  const CalculateNow({
    Key? key,
    required this.totalAmount,
    required this.taxPercentage,
    required this.numFriends,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double finalResult = calculateFinalResult();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Split Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Center(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Total Amount: $totalAmount',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tip: $tip',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tax Percentage: $taxPercentage',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Number of Friends: $numFriends',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'The Money Each Should Pay: $finalResult',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.red),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>HomePage()));
                    }, child: Text('CALCULATE AGAIN',style: TextStyle(fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double calculateFinalResult() {
    double total = double.tryParse(totalAmount) ?? 0;
    double tax = double.tryParse(taxPercentage) ?? 0;
    double result = (((total * tax) / 100) + tip + total) / numFriends;

    return result;
  }
}
