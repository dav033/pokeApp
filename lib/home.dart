import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

import 'images.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pokemons = [];
  final List<Widget> _painters = <Widget>[];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PokeApi'),
        ),
        body: Container(
          child: _swiper(),
        ));
  }

  Widget _swiper() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        print(pokemons[index]['sprites']['other']['dream_world']
            ['front_default']);
        print(pokemons.length);
        return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                SvgPicture.network(pokemons[index]['sprites']['other']
                    ['dream_world']['front_default'])
              ],
            ));
      },
      itemCount: pokemons.length,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    );
  }

  void fetchPokemonData() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=3');
    var owo = await http.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = jsonDecode(value.body);
        //  print(data['results']);

        // pokemons = data['results'];

        // setState(() {});

        return data['results'];
      }
    }).catchError((e) {
      print(e);
    });

    print(owo);

    List prueba = [];

    for (var item in owo) {
      var url = Uri.parse(item['url']);
      http.get(url).then((value) {
        var data = jsonDecode(value.body);
        pokemons.add(data);
        setState(() {});
      });
    }

    print(pokemons.length);
  }
}
