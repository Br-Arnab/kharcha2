

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'feedbackform.dart';
import 'formcontroller.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';



class analysis extends StatefulWidget {
  const analysis({Key? key}) : super(key: key);


  @override
  State<analysis> createState() => _analysisState();
}

class _analysisState extends State<analysis> {


  List<Feedbackform> feedbackItems = [];
  List<Feedbackform> feedbackdetails = [];
  late ProgressDialog pr;
  List<String> it = [];

  final now = DateTime.now();
  DateTime dateTime =DateTime.now();
  DateTime dateTime2 =DateTime.now();
 int k=-1;


  @override
  Widget build(BuildContext context) {

    if(feedbackItems.isNotEmpty && k<0 )
      {
        k=1;
        for(int i=0;i<feedbackItems.length;i++)
          {
            if(feedbackItems[i].name!='Total')
              it.add(feedbackItems[i].name);
          }
      }

    pr =ProgressDialog(context,type: ProgressDialogType.Normal);
    pr.style(
        message: 'একটু অপেক্ষা করুন...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,

        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w600)
    );




    DateTime ? datestart, dateend;

    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow,
              Colors.lightGreen
            ]
          )
          //   image: DecorationImage(
          //       image: AssetImage('image/bluesky.png'),
          //       fit: BoxFit.contain
          //   )



        ),

          child:
              ListView(
                   //shrinkWrap: true,
                  //mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      SizedBox(
                        //Use of SizedBox
                        height: 10,
                      ),

                      Container(
                          width:double.infinity,
                          color: Colors.red ,



                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('হিসেবের জন্য',style: TextStyle(fontSize: 25)),
                        )),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                          ),
                          borderRadius: BorderRadius.circular(2),

                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              //Use of SizedBox
                              width: 10,
                            ),
                            ElevatedButton(onPressed: () async{
                              datestart= await showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2100)) ;
                              setState(() {
                                dateTime=datestart!;
                              });


                            },
                                child: Text('শুরুর তারিখ',style: TextStyle(fontSize: 25))),
                                SizedBox(
                                  //Use of SizedBox
                                  width: 40,
                                ),
                            Text('${dateTime.day}/${dateTime.month}/${dateTime.year}',style: TextStyle(fontSize: 18)),

                          ],
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () async{
                            dateend= await showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2100)) ;
                            setState(() {
                              dateTime2=dateend!;
                            });

                          },
                              child: Text('শেষের তারিখ ',style: TextStyle(fontSize: 25))),
                          SizedBox(
                            //Use of SizedBox
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${dateTime2.day}/${dateTime2.month}/${dateTime2.year}',style: TextStyle(fontSize: 18),),
                          ),

                        ],
                      ),
                      ElevatedButton(onPressed: () async{
                        pr.show();
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        String arg= "?start="+formatter.format(dateTime).toString()+"&end="+formatter.format(dateTime2).toString();
                        Formcontrol().getFeedbackList(arg).then((feedbackItems) {
                          setState(() {
                            pr.hide();
                            this.feedbackItems = feedbackItems ;
                          });
                        });



                      },
                          child: Text('হিসেব করুন ',style: TextStyle(fontSize: 25))),

                      // if(feedbackItems.length>0)
                      //   Text("Farm:"+"${feedbackItems[0].farm}")

                      //,
                      Divider(
                        color: Colors.red,
                        thickness: 20,
                      ),
                      if(feedbackItems.length>0)
                      SfCartesianChart(
                        backgroundColor: Colors.cyanAccent,
                        series: <ChartSeries>
                        [BarSeries<Feedbackform,String>(dataSource: feedbackItems, xValueMapper: (Feedbackform name,_)=> name.name ,
                              yValueMapper: (Feedbackform name,_)=> double.parse(name.qty),
                            dataLabelSettings: DataLabelSettings(isVisible: true)
                          )

                        ],
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),


                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 20,
                      ),

                      SizedBox(
                        //Use of SizedBox

                        width: 10,
                      ),

                      if(feedbackItems.length>0)
                      Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("বিবরণের জন্য  ..",style: TextStyle(fontSize: 25)),
                          ),
                          DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down),
                          items: it.map((String items){
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(), onChanged: (String? value) async {
                            pr.show();
                            var en=utf8.encode(value.toString());
                            final DateFormat formatter = DateFormat('yyyy-MM-dd');
                            String arg= "?start="+formatter.format(dateTime).toString()+"&end="+formatter.format(dateTime2).toString()
                                +"&type="+value.toString();
                            Formcontrol().getFeedbackList(arg).then((feedbackdetails) {
                              setState(() {
                                pr.hide();
                                this.feedbackdetails = feedbackdetails ;

                                showModalBottomSheet(context: context,
                                    backgroundColor: Colors.lightGreenAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)
                                      )
                                    ),
                                    builder: (context) => ListView.builder(itemCount:feedbackdetails.length,
                                        itemBuilder: ((context, index) {

                                          return ListTile(

                                            title: Row(
                                                children: <Widget>[
                                                  Icon(Icons.add_alert_rounded),
                                                  //   Expanded(child:
                                                  //   Text("${feedbackdetails[index].name}"))
                                                  // ],
                                                  Text("${feedbackdetails[index].name}")
                                                ]
                                            ),
                                            subtitle: Row(
                                              children: <Widget>[
                                                Icon(Icons.alternate_email),
                                                //       Expanded(child:
                                                //       Text("${feedbackdetails[index].qty}")
                                                // )
                                                Text("${feedbackdetails[index].qty}")

                                              ],
                                            ),
                                          );

                                        })),
                                );


                              });
                            });

                          },
                          ),






                        ],
                      )


                    ]


              ),
              // if(feedbackdetails.isNotEmpty)
              //   Expanded(
              //
              //       child: ListView.builder(itemCount:feedbackdetails.length,
              //           itemBuilder: ((context, index) {
              //
              //             return ListTile(
              //
              //               title: Row(
              //                 children: <Widget>[
              //                   Icon(Icons.add_alert_rounded),
              //                 //   Expanded(child:
              //                 //   Text("${feedbackdetails[index].name}"))
              //                 // ],
              //                 Text("${feedbackdetails[index].name}")
              //                     ]
              //               ),
              //               subtitle: Row(
              //                 children: <Widget>[
              //                   Icon(Icons.alternate_email),
              //             //       Expanded(child:
              //             //       Text("${feedbackdetails[index].qty}")
              //             // )
              //             Text("${feedbackdetails[index].qty}")
              //
              //                 ],
              //               ),
              //             );
              //
              //           })))









      ),



    );
  }
}
