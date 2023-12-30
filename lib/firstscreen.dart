import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kharcha/analyis.dart';
import 'package:kharcha/web.dart';


class Firstscreen extends StatelessWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text('হিসেবের খাতা'),
      centerTitle: true,
    ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/d

  ),
  child: Center(
  child: ListView(

  //mainAxisSize: MainAxisSize.min,
  children: [
  SizedBox(
  //Use of SizedBox
  height: 30,ownload.png'),
            fit: BoxFit.fill
          )
              ),
              ElevatedButton(

                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>web()));
                },  child: Text (' নতুন রেকর্ড ',style: TextStyle(fontSize: 25),),

              ),
              SizedBox(
                //Use of SizedBox
                height: 390,
              ),
              ElevatedButton(

                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>analysis()));
                },  child: Text (' হিসেব নিকেশ',style: TextStyle(fontSize: 25),),

              ),
            ],
          )

  ),
      ),
  );
}
