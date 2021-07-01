import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  String? url;
  NetworkHelper(String url){
    this.url = url;
  }
  Future getData() async{
    print("Getting");
    http.Response r = await http.get(Uri.parse(url!));
    print("Got");

    if (r.statusCode == 200){
      print(r.body);
      var decodedData = jsonDecode(r.body);
      return decodedData;

    }
    else{
      print(r.statusCode);
      return r.statusCode;
    }
  }
}