import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String operatorValue = '';
  double firstValue = 0;
  double secondValue = 0;
  String screenValue = '0';
  bool done = false;

  void compute(){
    switch(operatorValue){
      case '/':
        firstValue = firstValue / secondValue;
        break;
      case '*':
        firstValue = firstValue * secondValue;
        break;
      case '-':
        firstValue = firstValue - secondValue;
        break;
      case '+':
        firstValue = firstValue + secondValue;
        break;
      case '%':
        firstValue = firstValue % secondValue;
        break;
    }
    screenValue = (firstValue==0?0:firstValue).toString();
  }

  void pressHandler(String value){
    if(screenValue=='Infinity') screenValue = '0';
    setState(() {
      switch(value){
        case '/':
          done = true;
          if(firstValue!=0){
            secondValue = double.parse(screenValue);
            compute();
          } else {
            firstValue = double.parse(screenValue);
          }
          operatorValue = value;
          break;
        case '*':
          done = true;
          if(firstValue!=0){
            secondValue = double.parse(screenValue);
            compute();
          } else {
            firstValue = double.parse(screenValue);
          }
          operatorValue = value;
          break;
        case '-':
          done = true;
          if(firstValue!=0){
            secondValue = double.parse(screenValue);
            compute();
          } else {
            firstValue = double.parse(screenValue);
          }
          operatorValue = value;
          break;
        case '+':
          done = true;
          if(firstValue!=0){
            secondValue = double.parse(screenValue);
            compute();
          } else {
            firstValue = double.parse(screenValue);
          }
          operatorValue = value;
          break;
        case '%':
          done = true;
          if(firstValue!=0){
            secondValue = double.parse(screenValue);
            compute();
          } else {
            firstValue = double.parse(screenValue);
          }
          operatorValue = value;
          break;
        case 'CLEAR':
          operatorValue = '';
          firstValue = secondValue = 0;
          screenValue = '0';
          break;
        case '.':
          if(done){
            done = false;
            screenValue = '0';
          }
          if(!screenValue.contains('.')){
            screenValue+=value;
          }
          break;
        case '=':
          if(operatorValue!=''){
            if(!done) secondValue = double.parse(screenValue);
            compute();
            done = true;
          }
          break;
        default:
          if(done){
            done = false;
            screenValue = '0';
          }
          screenValue = screenValue=='0'?value:screenValue+value;
          break;
      }
      print(firstValue.toString()+'  '+secondValue.toString());
    });
  }


  Widget genButton(String text){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30),
        onPressed: () => pressHandler(text),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.grey[800]
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context){
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            height: double.infinity,
            child: Center(
              child: Text(operatorValue),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: double.infinity,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  screenValue,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]
                  ),
                ),
              ],
          ),
          )
        ),
        Flexible(
          flex: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  genButton('7'),
                  genButton('8'),
                  genButton('9'),
                  genButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  genButton('4'),
                  genButton('5'),
                  genButton('6'),
                  genButton('*'),
                ],
              ),
              Row(
                children: <Widget>[
                  genButton('1'),
                  genButton('2'),
                  genButton('3'),
                  genButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  genButton('0'),
                  genButton('.'),
                  genButton('%'),
                  genButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  genButton('CLEAR'),
                  genButton('='),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}