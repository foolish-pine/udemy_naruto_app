import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:udemy_naruto_app/modules/characters/character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _apiUrl = 'https://narutodb.xyz/api/character';

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    final response = await Dio().get(_apiUrl);
    final List<dynamic> data = response.data['characters'];
    final characters = data.map((data) => Character.fromJson(data)).toList();
    print(characters);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Naruto図鑑'),
          backgroundColor: const Color(0xFFBCE2E8),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage('assets/dummy.png'),
                        ),
                      ),
                      Text('テストキャラクター',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          )),
                      Text(
                        'なし',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
