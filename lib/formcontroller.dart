
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'feedbackform.dart';
class Formcontrol
{

  static const String URL ="https://script.google.com/macros/s/AKfycbxqso5_hhJ-9lkHeE7cxhw_DB8ZMOWPvhOfacBn3tloPWiAmbvXkp9Zgi-eOCNpbAyLtg/exec";
  static const STATUS_SUCCESS = "SUCCESS";

  // void submitForm(
  //     Feedbackform feedbackForm, void Function(String) callback) async {
  //   try {
  //     await http.post(URL, body: feedbackForm.toJson()).then((response) async {
  //       if (response.statusCode == 302) {
  //         var url = response.headers['location'];
  //         await http.get(url).then((response) {
  //           callback(convert.jsonDecode(response.body)['status']);
  //         });
  //       } else {
  //         callback(convert.jsonDecode(response.body)['status']);
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<List<Feedbackform>> getFeedbackList(String arg) async {
    String gs=URL+arg;
    print("Url :"+gs);
    return await http.get(gs).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => Feedbackform.fromJson(json)).toList();
    });
  }
}