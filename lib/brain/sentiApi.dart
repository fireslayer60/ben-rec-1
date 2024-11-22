import 'package:hack/brain/networking.dart';

class SentiApi {
  Future<dynamic> getSenti(String customText) async {
    var url = 'http://10.0.2.2:5000/predict'; // Adjust URL as needed
    NetworkHelper networkHelper = NetworkHelper(url);
    
    // Create a JSON object with the custom text
    Map<String, String> requestBody = {'custom_text': customText};
    
    // Make a POST request to the Flask API
    var data = await networkHelper.postData(requestBody);
    
    return data;
  }
}
