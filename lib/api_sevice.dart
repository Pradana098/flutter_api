import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
 final String apiKey = 'eeb19091734723fda78fb288a084582e'; // Ganti dengan API Key Anda

  // Fungsi untuk mendapatkan koordinat berdasarkan nama kota
  Future<Map<String, double>> getCoordinates(String city) async {
    final geoUrl =
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$apiKey';

    final response = await http.get(Uri.parse(geoUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        double lat = data[0]['lat'];
        double lon = data[0]['lon'];
        return {'lat': lat, 'lon': lon};
      } else {
        throw Exception('Kota tidak ditemukan');
      }
    } else {
      throw Exception('Gagal mengambil koordinat');
    }
  }

  // Fungsi untuk mendapatkan data cuaca berdasarkan koordinat
   Future<Map<String, dynamic>> getWeather(double lat, double lon) async {
    final weatherUrl =
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

    final response = await http.get(Uri.parse(weatherUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'description': data['weather'][0]['description'],
        'temperature': data['main']['temp'],
        'temp_min': data['main']['temp_min'], // Suhu minimum
        'temp_max': data['main']['temp_max']  // Suhu maksimum
      };
    } else {
      throw Exception('Gagal mengambil data cuaca');
    }
  }





  
  // Future<List<dynamic>> fechPhotos() async {
  //   SharedPreferences prefr = await SharedPreferences.getInstance();
  //   String? cacheData = prefr.getString('photos');

  //   if(cacheData != null){
  //     return json.decode(cacheData);
  //   }else{
  //      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //   if (response.statusCode == 200){
  //     prefr.setString('photos', response.body);
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Gagal');
  //   }
  //   }
  // }

  // Future<List<dynamic>> fechPost() async{
  //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   if (response.statusCode == 200){
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Gagal');
  //   }
  // }
}
