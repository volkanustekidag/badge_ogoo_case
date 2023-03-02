import 'dart:convert';
import 'package:flutter/services.dart';

class LocalService {
  //Local de bulunan json dosyalarını okuyor.
  Future readLocalJson(path) async {
    final String response = await rootBundle.loadString(path);
    return await json.decode(response);
  }
}
