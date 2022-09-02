/*
  188. Criando Modelo Refeição

  Foi criada uma nova classe chamada Meal que se refere as todas as informações da comida, com isto
  nós iremos aguardar as informações em um dummy (/lib/data/dummy_data.dart) e então usaremos
  os dados mockados para transimitir para o aplicativo as informações.

  Usamos enum também para definir a complexididade e o valor proposto na receita.

*/

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
import '../lib/screens/categories_screen.dart';
import '../lib/utils/app_route.dart';

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
      routes: {
        AppRoute.HOME: (ctx) => const CategoriesScreens(),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
