import 'package:http/http.dart' as http;
import 'dart:convert';
import 'BMImodel.dart';

class BMIservice {
  static Future<BMImodel> calculateBMI(double weight, double height) async {
    var parameters = 'weight=$weight&height=$height';
    var api = 'https:pirun.ku.ac.th/~faaspsu/edu/mobile/calculatebmi.php';
    var url = Uri.parse('$api?$parameters');
    var response = await http.get(url);

    Map<String, dynamic> jsondata = json.decode(response.body);
    
    BMImodel result = BMImodel.fromJson(jsondata);

    return result;
  }
}
