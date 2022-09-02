/*
  189. Selecionando Refeições por Categoria

  Após a criação do DUMMY contendo as informações das comidas, colocamos para cada comida
  aparecer em sua propria categoria, através do código:

  final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

  Basicamente, faz um .WHERE buscando dentro da categoria de cada comida, se a comida indicada
  corresponde pelo category.id (meals.categories == category.id) então se retornar TRUE, ele coloca
  dentro da lista categoryMeals

  Em Seguida criamos um ListView com o método estático builder passando o itemCount = categoryMeals
  e em seguida passando o itemBuilder o ctx e o index (posições) de cada elemento da lista

  body: ListView.builder(
    itemCount: categoryMeals.length,
    itemBuilder: (ctx, index) {
      return Text(categoryMeals[index].title);
    },
  ),


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
