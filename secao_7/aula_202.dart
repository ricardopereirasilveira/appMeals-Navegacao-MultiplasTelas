/*
  202. Fechando a tela & passando dados de volta

  Nós podemos eventualmente querer ir "voltando" alguma informação, ou seja, mandar alguma informação
  para a tela anterior, para isto, nós podemos utilizar o proprio "POP" que ele pode receber como 
  parametro um "result" ou seja, pode enviar alguma informação para a tela anterior.

  Navigator.of(context).pop(meal);
  Navigator.of(context).pop("Testando");

  Neste caso, nós mandamos um objeto inteiro (meal)

  Na tela anterior (que virá ao fecharo o POP) nós podemos usar dentro do Navigator a função
  que sera chamada no FUTURO, ou seja, ao dar um PUSH o Navigator fica aguardando para verificar se
  irá existir alguma coisa na tela futura (neste caso, quando dermos um POP), ficando assim:

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoute.MEAL_DETAIL,
      arguments: meal,
    ).then((result) {
      if (result == null) {
        print("nulo!");
      } else {
        print(result);
      }
    });
  }

  O conceito de FUTURE é como lidamos com asincronismo, ou seja, vamos chamar o SERVIDOR para obter
  dados no BACK-END da aplicação, nós não sabemos quando o dado irá chegar, pode levar 1 segundo ou 10
  segundos, então é como o botão de call-back, nós não sabemos quando ele será chamado (pode ser daqui 1h)
  


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
