import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _dio = Dio();
  
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('Запрос'),
            onPressed: () async {
              try {
                final response = await _dio.get('http://195.80.51.201:8080/test');
                print(response.data);
              } on DioError catch (e) {
                print(e.error);
                print(e.message);
                print(e.response);
                print(e.type);
                rethrow;
              }
            },
          )
        )
      ),
    );
  }
}
