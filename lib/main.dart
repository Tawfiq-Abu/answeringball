import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      home: MagicHome(),
    ),
  );
}

class MagicHome extends StatelessWidget {
  const MagicHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        title: Text(
          'Ask me anything',
        ),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int numberball = 1;
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  void changeNumbers(){
    setState(() {
      numberball = Random().nextInt(4)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextButton(
              onPressed: (){
                changeNumbers();
                print(numberball);
              },
              child:Container(
                child: Center(
                    child: Image.asset('images/ball$numberball.png')
                ),
              )
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number in here',
                // hintText: 'enter an even or odd number',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: (){
                  int nums = int.parse(myController.text);
                  print(nums);
                  setState(() {
                    if(nums % 2 ==0){
                      numberball = 1;
                    }else{
                      numberball = 2;
                    }
                  });
                },
                child: Text('submit'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}





