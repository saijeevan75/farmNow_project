import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../reusable_widgets/reusable.dart';

class CropPage extends StatefulWidget {
  const CropPage({super.key});

  @override
  State<CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  final _formKey = GlobalKey<FormState>();
  String crop = '';
  String result = '';

  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _rainfallController = TextEditingController();

  Future<void> _getPrediction(Map<String, String> formData) async {
    var url = Uri.parse('https://farmnow-385616.el.r.appspot.com/recommend');
    /*var body = {
      "N": double.parse(_nController.text).toString(),
      "P": double.parse(_pController.text).toString(),
      "K": double.parse(_kController.text).toString(),
      "temperature": double.parse(_temperatureController.text).toString(),
      "humidity": double.parse(_humidityController.text).toString(),
      "ph": double.parse(_phController.text).toString(),
      "rainfall": double.parse(_rainfallController.text).toString(),
    };*/

    var requestBody = '{"N":"${double.parse(_nController.text)}",'
        '"P":"${double.parse(_pController.text)}",'
        '"K":"${double.parse(_kController.text)}",'
        '"temperature":"${double.parse(_temperatureController.text)}",'
        '"humidity":"${double.parse(_humidityController.text)}",'
        '"ph":"${double.parse(_phController.text)}",'
        '"rainfall":"${double.parse(_rainfallController.text)}"}';

    //var realbody = {jsonEncode(body)};
    var response = await http.post(url, body: requestBody);
    print(requestBody);
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      setState(() {
        crop = json.decode(response.body)['prediction'][0];
        result =
            "After evaluating your soil and environmental factors, we recommend the following crop for optimal growth and yield: ";
        print(crop);
      });
    } else {
      print(response.statusCode);
      crop = "FAILED TO GET PREDICTION";
      throw Exception('Failed to get prediction');
    }
  }

  // Define the text controllers for the form fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Crop Recommendation'),
        toolbarHeight: 70,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Please fill the form to get the crop recommendation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  // Add form fields for each input variable
                  TextFormField(
                    controller: _nController,
                    decoration: const InputDecoration(
                      labelText: 'Nitrogen (N)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pController,
                    decoration: const InputDecoration(
                      labelText: 'Phosphorus (P)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _kController,
                    decoration: const InputDecoration(
                      labelText: 'Potassium (K)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _temperatureController,
                    decoration: const InputDecoration(
                      labelText: 'Temperature (in °C)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _humidityController,
                    decoration: const InputDecoration(
                      labelText: 'Humidity',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phController,
                    decoration: const InputDecoration(
                      labelText: 'pH',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _rainfallController,
                    decoration: const InputDecoration(
                      labelText: 'Rainfall (in cm)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the form inputs
                      if (_formKey.currentState!.validate()) {
                        // Create a map of the form values to send to the API
                        Map<String, String> formData = {
                          "N": double.parse(_nController.text).toString(),
                          "P": double.parse(_pController.text).toString(),
                          "K": double.parse(_kController.text).toString(),
                          "temperature":
                              double.parse(_temperatureController.text)
                                  .toString(),
                          "humidity":
                              double.parse(_humidityController.text).toString(),
                          "ph": double.parse(_phController.text).toString(),
                          "rainfall":
                              double.parse(_rainfallController.text).toString(),
                        };

                        // print(formData);

                        // Call the API endpoint to get a prediction
                        _getPrediction(formData);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.green[800]),
                    ),
                    child: Text(
                      "Get Prediction",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    crop,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
