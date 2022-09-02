/*
  196. Adicionando TabBar na Appbar

  Agora iremos navegar com TABs, para que caso o usuário adicione uma comida como favorita
  essa comida irá para uma outra tela que tem apenas as comidas favoritas

  Nesta primeira estrategia nó usaremos duas telas, que ao clicar na segunda aba, seremos
  direcionando para a segunda tela

  Foi criada uma nova tela inicial, que nessa irá conter as tabs na parte superior, para isto
  foi criado a (tabs-screen.dart)

  Para usar esta tab superior, precisamos chamar a classe "DefaultTabController" e o primeiro
  parametro que precisamos passar são as quantidades de abas que teremos, neste caso, definimos
  como 2

  DefaultTabController(
    length: 2,
  )

  Depois disto, nós podemos colocar o child, e nele colocaremos o Scaffold, e criaremos uma
  tela "convencional", com appBar, etc.

  Em seguida colocaremos o atributo "bottom" onde passaremos o TabBar que irá contar o parametro
  nomeado "tabs" que por sua vez, recebe todas as tabs (a quantidade de tabs do lenght)
  sendo que podemos passar text, icon, etc. Nesta parte podemos editar.

  bottom: const TabBar(
    tabs: [
      Tab(
        icon: Icon(Icons.category),
        text: "Categorias",
      ),
      Tab(
        icon: Icon(Icons.star),
        text: "Favoritos",
      ),
    ],
  ),

  por ultimo iremos utilizar o body para passar as informações que serão as telas das duas
  abas, o body irá recber um TabBarView que nos children passaremos, em ordem, as Screens
  correspondente a cada aba

  body: const TabBarView(
    children: [
      CategoriesScreens(),
      FavoriteScreen(),
    ],
  ),

  E no final, o código ficará assim:

  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Vamos Cozinhar"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categorias",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favoritos",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreens(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }

  Então dentro da CategoriesScreens() nós não precisamos do Scaffold mais, porque ele já
  está fazendo esse papel

*/

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
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
      },
    );
  }
}
