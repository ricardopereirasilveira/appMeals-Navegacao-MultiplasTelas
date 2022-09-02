/*
  181. Tela das Categorias

  Em categories_screen.dart nós basicamente pegamos a DUMMY_CATEGORIES (do dammy_data.dart) e então
  fizemos um map, retornando o CategoryItem individualmente (pois estamos dentro de um .map)

  categories_screen.dart
  children: DUMMY_CATEGORIES.map((cat) {
    return CategoryItem(category: cat);
  }).toList()

  dentro do CategoryItem nós fizemos um Container() que então coloca o text (title) no Category
  ficando assim:

  O CategoryItem retorna pro CategoriesScreen que por sua vez retorna na APP

  Container(
    child: Text(category.title),
  )

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
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreens(),
    );
  }
}
