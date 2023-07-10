import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Equally Divided',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Friends',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Tax',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Tip',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'AMOUNT ONE SHOULD PAY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Text 1',
                  ),
                ),
                Expanded(
                  child: Text(
                    'Text 2',
                  ),
                ),
                Expanded(
                  child: Text(
                    'Text 3',
                  ),
                ),
                Expanded(
                  child: Text(
                    'Text 4',
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                // Handle Calculate Again button press
              },
              child: Text('Calculate Again'),
            ),
          ],
        ),
      ),
    );
  }
}
