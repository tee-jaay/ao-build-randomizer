import 'dart:math';

import 'package:flutter/material.dart';

class Randomizer extends StatefulWidget {
  const Randomizer({super.key});

  @override
  RandomizerState createState() => RandomizerState();
}

class RandomizerState extends State<Randomizer> {
  final Map<String, String> _playerItems = {
    'bag': '',
    'helmet': '',
    'shoe': '',
    'armor': '',
    'cape': '',
    'mainHand': '',
    'offHand': '',
    'potion': '',
    'food': '',
  };

  void _shuffleValues() {
    setState(() {
      _playerItems.forEach((key, value) {
        _playerItems[key] = _getImageUrl(key);
      });
    });
  }

  String _getImageUrl(String item) {
    final random = Random();
    const width = 200;
    const height = 200;
    final url =
        'https://picsum.photos/$width/$height?item=$item&random=${random.nextInt(100)}';
    print(url);
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _playerItems.keys.toList().map((key) {
          return GridTile(
            child: Container(
              margin: const EdgeInsets.all(8),
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
                  _getImageUrl(key),
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: _shuffleValues,
          child: const Icon(Icons.shuffle),
        ),
      ),
    );
  }
}
