/*
  193. onGenerateRoute & onUnkownRoute

  onGenerateRoute: Serve para, quando não encontrar uma rota dentro de "routes" ele irá
  acessar o onGenerateRoute e tentar achar a rota "/alguma-coisa" e acessar através do
  MaterialpageRoute(). Caso ele consiga acessar pelo "routes" ele nunca irá entrar
  no onGenerateRoute

  onGenerateRoute (settings) {
    if (settings.name == '/alguma-coisa') {
      return null;
    } else if (settings.name == '/outra-coisa') {
      return null;
    } else {
      return MaterialPageRoute (
        builder: (_) {
          return CategoriesScreen()
        }
      )
    }
  }

  Esta é uma maneira de criar rotas dinamicas baseado em nome de rotas ou algo do tipo

  onUnknownRoute: É o último método que será chamado, pois se ele entrar em 'routes' e depois em
  'onGenerateRoute' e não encontrar uma rota, ele irá para o 'onUnkownRoute', que funciona como
  página 404 na WEB. Nós podemos não usar o onGenerateRoute e ir direto para o onUnkownRoute
  para mostrar direto a página de não existente

  onUnknwnRoute: (settings) {
    return MaterialPageRoute(
      builder: (_) {
        return CategoriesScreen();
      }
    )
  }

*/

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
import '../lib/screens/categories_screen.dart';
import '../lib/screens/meal_detail_screen.dart';
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
        AppRoute.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
