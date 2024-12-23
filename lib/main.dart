import 'package:flutter/material.dart';
import 'package:flutter_aplikasi2/api_sevice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(), // HomeSreen menjadi child dari MaterialApp
    );
  }
}

// ignore: use_key_in_widget_constructors
class WeatherPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ApiService apiService = ApiService();
  String city = '';
  String weatherDescription = '';
  double temperature = 0.0;
  double averageTemperature = 0.0; // Suhu rata-rata
  String iconCode = ''; // Ikon cuaca
  TextEditingController cityController = TextEditingController();

  // Fungsi untuk mengambil data cuaca dan manipulasi data
  Future<void> fetchWeather() async {
    try {
      // Step 1: Dapatkan koordinat berdasarkan nama kota
      final coordinates = await apiService.getCoordinates(city);

      // Step 2: Dapatkan data cuaca berdasarkan koordinat
      final weather =
          await apiService.getWeather(coordinates['lat']!, coordinates['lon']!);

      // Step 3: Manipulasi data - Hitung suhu rata-rata
      averageTemperature = (weather['temp_min'] + weather['temp_max']) / 2;

      // Update state dengan data yang sudah dimanipulasi
      setState(() {
        weatherDescription =
            weather['description'] ?? 'Deskripsi tidak tersedia';
        temperature = weather['temperature'] ?? 0.0;
        iconCode = weather['icon'] ?? '';
        city = city.toUpperCase();
      });
    } catch (e) {
      setState(() {
        weatherDescription = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'Masukkan nama kota',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onSubmitted: (value) {
                  setState(() {
                    city = value; // Perbarui kota berdasarkan input pengguna
                  });
                  fetchWeather();
                },
              ),
              SizedBox(height: 20),
              if (weatherDescription.isNotEmpty)
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          city,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        if (iconCode.isNotEmpty)
                          Image.network(
                            'http://openweathermap.org/img/wn/$iconCode@2x.png',
                            width: 100,
                            height: 100,
                          ),
                        Text(
                          'Deskripsi: $weatherDescription',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Suhu: ${temperature.toStringAsFixed(1)}°C',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Suhu Rata-rata: ${averageTemperature.toStringAsFixed(1)}°C',
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  fetchWeather();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Refresh', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class PhotoSreen extends StatelessWidget {
//   final ApiSevice apiSevice = ApiSevice();

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Api-Data')),
//         body: FutureBuilder<List<dynamic>>(
//           future: apiSevice.fechPhotos(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             } else {
//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Image.network(
//                           snapshot.data![index]['thumbnailUrl'],
//                           fit: BoxFit.cover,
//                           height: 120,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             snapshot.data![index]['title'],
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ));
//   }
// }

// class HomeSreen extends StatelessWidget{

  
//   final ApiSevice apiSevice = ApiSevice();


//   Widget build (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Api-Data')),
//       body: FutureBuilder<List<dynamic>>(future: apiSevice.fechPost(),
//       builder: (context, snapshot){
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError){
//           return Center(child: Text('Error: ${snapshot.error}'),);
//         }else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index){
//               return ListTile(
//                 title: Text(snapshot.data![index]['title']),
//                 subtitle: Text(snapshot.data![index]['body']),
//               );
//             }
//           );
//         }
//       },
//       )
//     );
//   }

// }
