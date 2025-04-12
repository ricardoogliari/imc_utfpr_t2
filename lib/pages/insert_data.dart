import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:provider/provider.dart';

class InsertData extends StatelessWidget {
  InsertData({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],

                validator: (value) {
                  return Provider.of<BMIController>(
                    context,
                    listen: false,
                  ).validateWeight(value);
                },
                decoration: const InputDecoration(
                  labelText: "Weight",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                validator: (value) {
                  return Provider.of<BMIController>(
                    context,
                    listen: false,
                  ).validateHeight(value);
                },
                decoration: const InputDecoration(
                  labelText: "Height",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<BMIController>(
                      context,
                      listen: false,
                    ).calculateBMI(
                      weight: double.parse(_weightController.text),
                      height: double.parse(_heightController.text),
                    );

                    Navigator.pushNamed(context, '/result');
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Cor do texto
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ), // Padding maior
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Bordas arredondadas
                  ),
                  elevation: 5, // Sombra
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ), // Tamanho e peso do texto
                ),
                child: const Text("Calculate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
