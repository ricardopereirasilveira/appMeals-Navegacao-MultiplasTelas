/*
  187. Rotas Nomeadas #02

  Nós podemos setar a rota inicial, colocando dentro do map apenas uma "/" e então definindo a 
  classe que corresponde a tela "inicial", e então não precisamos chamar através do atributo
  nomeado "home:". O map ficará assim:

  routes: {
    "/": (ctx) => const CategoriesScreens(),
    "/categories-meals": (ctx) => CategoriesMealsScreen(),
  },
  
  Outra coisa que podemos usar também é o parametro nomeado "initialRoute" e colocar a página
  inicial da aplicação

  Agora, nós podemos colocar tudo dentro de um arquivo/classe apenas, para isto, criamos uma pasta
  chamada "utils" e dentro dela criamos um arquivo chamado "app_routes.dart" e criamos a classe
  contendo cada rota como método estática, passando cada rota

  -- utils/app_route.dart
  class AppRoute {
    static const HOME = "/";
    static const CATEGORIES_MEALS = "/categories-meals";
  }

  Assim nós temos métodos estáticos que recebem os nomes das categorias, e então alteramos apenas em um
  lugar e podemos ficar transitando com os nomes das rotas sem ter medo de errar algo, ao chamar, ficara 
  assim o map, acessando através do metodo estático
  routes: {
    AppRoute.HOME: (ctx) => const CategoriesScreens(),
    AppRoute.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
  },

  Com isto, nós podemos procurar pela string "/categories-meals" dentro do código (no VSCode nós podemos 
  clicar na LUPA ao lado esquerdo e procurar pela string e verificar que apenas um local é chamado, dentro
  do método estático)



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
