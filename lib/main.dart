import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(PredictionApp());
}

class PredictionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La polla ganadora ',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final predictionController = TextEditingController();
  final predictionControllr = TextEditingController();
  final predictionControlle = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? winningPrediction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: predictionController,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: predictionControllr,
              decoration: InputDecoration(
                labelText: '¿Como crees que queda el partido?',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: predictionControlle,
              decoration: InputDecoration(
                labelText: 'Apuesta',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  winningPrediction = (predictionController.text+" "+predictionControllr.text+" "+predictionControlle.text);
                            });
                            },
                  child: Text('Enviar Predicción'),
                          ),
            
            SizedBox(height: 20),
            final FirebaseFirestore firestore = FirebaseFirestore.instance;

            Text('Dato Ganador: $winningPrediction'),

          ],
        ),
      ),
    );
  }
}
