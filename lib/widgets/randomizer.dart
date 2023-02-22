import 'dart:math';

import 'package:flutter/material.dart';

class Randomizer extends StatefulWidget {
  @override
  _RandomizerState createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {
  List<int> _gridValues = List.generate(9, (index) => index + 1);

  void _shuffleValues() {
    setState(() {
      _gridValues.shuffle();
    });
  }

  String _getImageUrl(int number) {
    final random = Random();
    final width = 200;
    final height = 200;
    final url =
        'https://picsum.photos/$width/$height?n=$number&random=${random.nextInt(100)}';
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build Randomizer'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return GridTile(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Image.network(
                  _getImageUrl(_gridValues[index]),
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: _shuffleValues,
          child: Icon(Icons.shuffle),
        ),
      ),
    );
  }
}
