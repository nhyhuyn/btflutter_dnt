import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';


class Exercise10 extends StatefulWidget {
  const Exercise10({super.key});

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<Exercise10> {
  final TextEditingController _controller = TextEditingController();
  String cityName = 'Hanoi';
  String country = '';
  double temperature = 0;
  double feelsLike = 0;
  int humidity = 0;
  double windSpeed = 0;
  String description = '';
  bool isLoading = false;

  final String apiKey = 'da427f0a880f74dd31b936542d9ff4bf'; 

  Future<void> fetchWeatherByCity(String city) async {
    setState(() {
      isLoading = true;
    });

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=vi';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          cityName = data['name'];
          country = data['sys']['country'];
          temperature = data['main']['temp'];
          feelsLike = data['main']['feels_like'];
          humidity = data['main']['humidity'];
          windSpeed = data['wind']['speed'];
          description = data['weather'][0]['description'];
        });
      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không tìm thấy thành phố')),
        );
      } else {
        throw Exception('Lỗi không xác định');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi: ${e.toString()}')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchWeatherByLocation() async {
    setState(() {
      isLoading = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dịch vụ định vị đang tắt')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Từ chối quyền truy cập vị trí')),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Quyền vị trí bị từ chối vĩnh viễn')),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric&lang=vi';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          cityName = data['name'];
          country = data['sys']['country'];
          temperature = data['main']['temp'];
          feelsLike = data['main']['feels_like'];
          humidity = data['main']['humidity'];
          windSpeed = data['wind']['speed'];
          description = data['weather'][0]['description'];
        });
      } else {
        throw Exception('Không lấy được dữ liệu thời tiết');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi: ${e.toString()}')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherByCity(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng Thời Tiết'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: fetchWeatherByLocation,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nhập tên thành phố',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  fetchWeatherByCity(value);
                }
              },
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                  child: ListView(
                    children: [
                      Text(
                        'Thành phố: $cityName, $country',
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '🌡️ Nhiệt độ: ${temperature.toStringAsFixed(1)} °C',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '🤗 Cảm giác thực tế: ${feelsLike.toStringAsFixed(1)} °C',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '💧 Độ ẩm: $humidity%',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '💨 Gió: ${windSpeed.toStringAsFixed(1)} m/s',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '📜 Thời tiết: $description',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
