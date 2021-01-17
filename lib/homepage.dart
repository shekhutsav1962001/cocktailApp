import 'dart:convert';

import 'package:cocktail/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var mytext = "Depp here";
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    // print(res.body);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.orange,
    //   child: Center(child: Text('Utsav')),
    // );
    return Scaffold(
        // backgroundColor: Colors.orange,
        appBar: AppBar(title: Text("Hello utsav")),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(drink['strDrinkThumb']),
                        ),
                      ),
                      title: Text(
                        "${drink['strDrink']} ",
                        style: TextStyle(fontSize: 22, color: Colors.orange),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DrinkDetail(drink: drink),
                              fullscreenDialog: true,
                            ));
                      },
                    );
                  })
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ));
  }
}
