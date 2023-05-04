import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CropPage extends StatefulWidget {
  const CropPage({super.key});

  @override
  State<CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  final _formKey = GlobalKey<FormState>();
  String crop = '';

  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _rainfallController = TextEditingController();

  Future<void> _getPrediction(Map<String, String> formData) async {
    var url = Uri.parse('http://127.0.0.1:5000//recommend');
    var response = await http.post(url, body: formData);
    if (response.statusCode == 200) {
      setState(() {
        crop = json.decode(response.body)['prediction'][0];
      });
    } else {
      throw Exception('Failed to get prediction');
    }
  }

  // Define the text controllers for the form fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Crop Recommendation'),
        toolbarHeight: 70,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Add form fields for each input variable
              TextFormField(
                controller: _nController,
                decoration: InputDecoration(
                  labelText: 'N',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pController,
                decoration: InputDecoration(
                  labelText: 'P',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kController,
                decoration: InputDecoration(
                  labelText: 'K',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _temperatureController,
                decoration: InputDecoration(
                  labelText: 'Temperature',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _humidityController,
                decoration: InputDecoration(
                  labelText: 'Humidity',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phController,
                decoration: InputDecoration(
                  labelText: 'pH',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rainfallController,
                decoration: InputDecoration(
                  labelText: 'Rainfall',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Validate the form inputs
                  if (_formKey.currentState!.validate()) {
                    // Create a map of the form values to send to the API
                    Map<String, dynamic> formData = {
                      'N': double.parse(_nController.text),
                      'P': double.parse(_pController.text),
                      'K': double.parse(_kController.text),
                      'temperature': double.parse(_temperatureController.text),
                      'humidity': double.parse(_humidityController.text),
                      'ph': double.parse(_phController.text),
                      'rainfall': double.parse(_rainfallController.text),
                    };

                    // Call the API endpoint to get a prediction
                    _getPrediction({
                      'N': _nController.text,
                      'P': _pController.text,
                      'K': _kController.text,
                      'temperature': _temperatureController.text,
                      'humidity': _humidityController.text,
                      'ph': _phController.text,
                      'rainfall': _rainfallController.text,
                    });
                  }
                },
                child: Text("Get Prediction"),
              ),
              if(crop.isNotEmpty)
                Text("Recommended Crop : $crop")
              
            ],
          ),
        ),
      ),
    );
  }
}
