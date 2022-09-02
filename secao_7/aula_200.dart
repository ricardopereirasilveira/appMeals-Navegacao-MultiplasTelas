/*
  200. Adicionando Links no Drawer

  Para navegar para as telas, é bem simples, primeiramente dentro de _createItem nós 
  iremos receber mais um parametro que é uma 'Function() onTap' e então passamos dentro
  do componente

  onTap: onTap,

  E então, dentro do _createItem que chama a função, passamos o onTap
  () => Navigator.of(context).pushNamed(AppRoute.HOME)

  ficando assim:

  _createItem(
    Icons.settings,
    'Configurações',
    () => Navigator.of(context).pushNamed(AppRoute.HOME),
  ),

  Então, registrando uma nova rota, criamos o Settings e registramos no main e no app_routes.dart

*/

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
import 'package:refeicoes/screens/settings_screen.dart';
import '../lib/screens/categories_screen.dart';
import '../lib/screens/meal_detail_screen.dart';
import '../lib/utils/app_route.dart';
import '../lib/screens/tabs_screen.dart';

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
        AppRoute.HOME: (ctx) => const TabScreen(),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoute.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoute.SETTINGS: (ctx) => const SettingsScreen(),
      },
    );
  }
}
