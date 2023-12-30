import 'package:flutter/material.dart';
class Feedbackform{

  String name;
  String qty;


  Feedbackform(this.name, this.qty);
  // , this.oth, this.food, this.obj, this.ele,
  //     this.gas, this.convi, this.total);



  factory Feedbackform.fromJson(dynamic json){
    return Feedbackform("${json['name']}","${json['qty']}");
  }

   Map toJson() =>{
   'name':name,
   'qty':qty
};


}