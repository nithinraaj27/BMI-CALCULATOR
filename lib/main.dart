import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(
 MaterialApp(
   home: MyApp(),
   debugShowCheckedModeBanner: false,
 )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'Select Data';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height*0.40,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
                decoration: new BoxDecoration(color: Color(0xff8237C9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BMI",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("Calculator",style: TextStyle(fontSize: 40,color: Colors.white),),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text('$_bmi',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,),
                      ),
                    ),
                    RichText(text: TextSpan(
                      text:"Condition : ",
                      style: TextStyle(color: Colors.white,fontSize: 25.0,),
                      children:[
                        TextSpan(
                          text:"$_condition",
                          style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),
                        )
                      ]
                    ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text("choose Data",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff8237C9),fontSize: 29),),
                    SizedBox(height: 25.0,),
                    RichText(text: TextSpan(
                    text:"Height : ",
                    style: TextStyle(color: Color(0xff8237C9),fontSize: 25.0,),
                    children:[
                      TextSpan(
                        text:"$_height",
                        style: TextStyle(color: Color(0xff8237C9),fontSize: 25.0,fontWeight: FontWeight.bold),
                      )
                    ]
                ),),
                    SizedBox(height: 25.0,),
                    Slider(value: _height,
                        min: 0,
                        max: 250,
                        onChanged: (height)
                    {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                      activeColor: Color(0xffF002F0),
                      inactiveColor: Color(0xff3B233B),
                    ),
                    SizedBox(height: 25.0,),
                    RichText(text: TextSpan(
                        text:"Weight : ",
                        style: TextStyle(color: Color(0xff8237C9),fontSize: 25.0,),
                        children:[
                          TextSpan(
                            text:"$_weight",
                            style: TextStyle(color: Color(0xff8237C9),fontSize: 25.0,fontWeight: FontWeight.bold),
                          )
                        ]
                    ),),
                    Slider(value: _weight,
                      min: 0,
                      max: 300,
                      onChanged: (weight)
                      {
                        setState(() {
                          _weight = weight;
                        });
                      },
                      divisions: 250,
                      label: "$_weight",
                      activeColor: Color(0xffF002F0),
                      inactiveColor: Color(0xff3B233B),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      width: size.width*0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            _bmi = (_weight/((_height/100) * (_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=25) {_condition = "Normal";}
                            else if(_bmi>25 && _bmi<=25) {_condition = "Over Wight";}
                            else if(_bmi>30) {_condition = "obesity";}
                            else {_condition = "UnderWeight";}
                            },
                          child: Text("calculate",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                          color: Color(0xff8237C9),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
