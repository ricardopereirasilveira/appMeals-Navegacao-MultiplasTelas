/*
  185. Passando dados via Construtor

  Para isto, dentro do parametro onde iremos receber a informação (neste caso o CategoriesMealsScreen)
  nós colocamos para receber o parametro

  final Category category;
  const CategoriesMealsScreen({this.category})

  Então, onde chamamos o render da tela (CategoryItem) nós enviamos as informações por construtor

  return CategoriesMealsScreen(
    category: category,
  );



*/

import 'package:flutter/material.dart';
import '../lib/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: const CategoriesScreens(),
    );
  }
}
