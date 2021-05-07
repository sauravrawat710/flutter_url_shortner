import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortner/modals/url_shortner_response_modal.dart';

class UrlShortnerState extends ChangeNotifier {
  final urlController = TextEditingController();

  String shortUrlMessage = 'Give some long URL to convert';

  void handleGetLinkButton() async {
    final longUrl = urlController.text;

    final String shortUrl = await getShortUrl(longUrl);

    shortUrlMessage = shortUrl;
    notifyListeners();
  }

  Future<String> getShortUrl(String longUrl) async {
    final result = await http.post(
        Uri.parse('https://cleanuri.com/api/v1/shorten'),
        body: {'url': longUrl});

    if (result.statusCode == 200) {
      final response = urlShortnerResponseFromJson(result.body);
      return response.resultUrl;
    } else {
      print('error in api');
      print(result.body);
      return 'There is some error in shortning in URL.';
    }
  }
}
