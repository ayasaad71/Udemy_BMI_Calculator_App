import 'package:flutter/material.dart';
import 'home_page.dart';

class Result extends StatelessWidget {

  final int result ;
  final int age ;
  final bool isMale ;

  Result({
    required this.result,
    required this.isMale,
    required this.age,
});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Result',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('$result',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('Gender : ${isMale ? 'Male' : 'Female'}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('Age : $age',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),

            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }, child: Text('Go Back',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white),),),
              color: Colors.pink,
            ),

          ],
        ),
      ),


    );
  }
}
