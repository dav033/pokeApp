// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:poke/home.dart';

import 'images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

Widget _swiper() {
  return Swiper(
    itemBuilder: (BuildContext context, int index) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage(images[index]),
            fit: BoxFit.scaleDown,
          ));
    },
    itemCount: 3,
    pagination: const SwiperPagination(),
    control: const SwiperControl(),
  );
}
