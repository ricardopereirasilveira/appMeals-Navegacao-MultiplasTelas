/*
  201 Substituindo telas.

  A ideia é sempre ir substituindo as telas, ao invés de ir acrescentando (pop)
  Temos que ter sempre cuidado em relação a pilha de telas que estamos colocando na aplicação, pois
  uma hora ou outra vamos precisar dar um POP nela, se temos a operação que vai entrando tela sobre
  tela, a ideia não é usar o Pushed, e sim vermos outra solução

  A ideia é usarmos o pushReplacementNamed que irá, não somente fazer o push da nova tela, ele irá
  fazer o POP da tela antiga também, então ele irá remover a tela anterior e irá abrir a nova

  _createItem(Icons.restaurant, 'Refeições',
    () => Navigator.of(context).pushReplacementNamed(AppRoute.HOME)
  ),

  Quando fazemos isto, o botão de voltar (canto superior esquerdo) irá desaparecer ao entrar na nova
  tela, pois nós substituimos a tela e não simplismente fizemos um PUSH

  E a ideia ao não ter o BACK na appBar, é adicionar o DRAWER na nova tela (se necessário)

  Nós fizemos isto, adicionando no settings_screen.dart
  drawer: MainDrawer(),

  Nós temos que saber em qual tela podemos dar um PUSH e em qual tela nos podemos dar um PUSHREPLACEMENT
  isto porque, por exemplo, na tela de categoria das refeições, ao verificar todas as refeições, nós podemos
  dar um PUSH porque em seguida temos que voltar para categorias (POP) e isto não acontece no DRAWER, porque
  ele simplismente irá excluir a tela anterior (categorias) e irá adicionar a nova tela (Configurações)


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
