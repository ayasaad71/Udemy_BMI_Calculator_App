import 'dart:math';
import 'package:flutter/material.dart';
import 'bmi_result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  double height = 180;
  double weight = 60 ;
  int age = 25 ;
  bool isMale = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true ;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(15),
                            color: isMale ? Colors.pink : Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 70,

                              ),
                              SizedBox(height: 20,),
                              Text('Male',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isMale ? Colors.grey : Colors.pink,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 70,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                  'Female',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),
                            ],
                          ),

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(width: 5,),
                        Text('cm',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                    Slider(value: height, min: 0 ,max: 250,activeColor: Colors.pink,inactiveColor: Colors.black26 ,onChanged: (double newValue){
                      setState(() {
                        height = newValue ;
                      });
                    }
                    ),
                  ],
                ),
          ),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text('${weight.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                  setState(() {
                                    weight-- ;
                                  });
                                },
                                  backgroundColor: Colors.pink,
                                  child: Icon(Icons.remove),mini: true,),


                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++ ;
                                  });
                                },
                                  backgroundColor: Colors.pink,
                                  child: Icon(Icons.add),mini: true,),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Age',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text('${age.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age-- ;
                                  });
                                },
                                  backgroundColor: Colors.pink,
                                  child: Icon(Icons.remove),mini: true,),

                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++ ;
                                  });
                                },
                                  backgroundColor: Colors.pink,
                                  child: Icon(Icons.add),mini: true,),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                double result  = weight / pow(height/100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result(
                    result: result.round(),
                    isMale: isMale,
                    age: age,
                  ),
                  ),
                );
            }, child: Text('Calculate',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
