/*
  203. Tela de Configurações

  **OBS: Modificamos o estado para Statefull Widget
  Iremos fazer os fitros na tela de configurações agora
  A primeira coisa que fizemos foi criar uma classe contendo todas as informações do filtro:

  Em seguida, dentro de settings_screen.dart nós criamos uma função que irá fazer as vezes do
  switch 

  *OBS: Cuidado para não colocar dentro do build pois não irá funcionar

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  Em seguida criamos um Expend -> ListView e dentro do children colocamos

  children: [
    _createSwitch(
      "Sem Glutten",
      "Só Exibe Refeições sem glutten",
      settings.isGlutenFree!,
      (value) => setState(() => settings.isGlutenFree = value),
    )
  ]



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
