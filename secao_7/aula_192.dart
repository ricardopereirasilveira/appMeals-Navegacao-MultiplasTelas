/*
  192. Navegando para tela de Detalhes

  Neste passo, criamos uma nova tela (meal_detail_screen.dart) e então, dentro desta tela
  nós colocamos um Scaffold para criação da nova tela, definimos a appBar e também um body
  bem básico apenas para termos informações

  return Scaffold(
    appBar: AppBar(
      title: const Text("Detalhes da Refeição"),
    ),
    body: const Center(
      child: Text("Detalhes da Refeição"),
    ),
  );

  Então em "utils/app_route.dart" nós cadastramos a nova rota para ficar registrado apenas em
  um lugar

  static const MEAL_DETAIL = "/meal_detail";

  e em seguida, no main.dart nós terminamos de registrar colocando no parametro nomeado 
  "routes:"
  AppRoute.MEAL_DETAIL: (ctx) => const MealDetailScreen(),

  Em seguida vamos receber os argumentos na meal_detail_screen.dart, e para isto, registramos
  uma variavel recebendo do ModalRoute os argumentos e fazemos o cast para uma classe do tipo
  Meal

  final meal = ModalRoute.of(context)?.settings.arguments as Meal;

  então, dentro do MealItem (meal_item.dart) nós criamos um método que irá fazer o Navigator
  para jogar para a próxima tela, fizemos isto através pelo método:

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoute.MEAL_DETAIL,
      arguments: meal,
    );
  }

  Nele usamos o nome que está em AppRoute.MEAL_DETAIL para que pudesse transferir para a tela
  correta, e então enviamos os parametros através do arguments, que enviou o meal

  e então, o onTap fara o papel de ao clicar enviar para frente

  onTap: () => _selectMeal(context),

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
