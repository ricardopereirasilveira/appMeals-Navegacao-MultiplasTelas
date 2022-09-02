/*
  186. Rotas Nomeadas #01

  Quando nós temos muitas rotas (paginas) dentro da nossa aplicação, é interessante que nós
  centralizermos essas rotas

  A primeira coisa que podemos fazer é usar o parametro nomeado "routes" que irá receber como
  chave uma String e como valor um Widget (neste caso, é a classe para onde irá a página, no exemplo
  usamos o CategoriesMealsScreen()), tudo isto dentro de Scaffold

  routes: {
    "/categories-meals": (ctx) => CategoriesMealsScreen(),
  }

  Porém, neste caso em especifico nós precisamos da Category para funcionar (pois estamos usando o title
  e também o ID provisoriamente), nós podemos importar o settings e pegar os argumentos, o que é algo simples
  pois tem uma classe chamada ModalRoute que tem um método estatico "of" que recebe um context
  e tem os parametros settings que tem o arguments, que neste caso, o argumento que enviaremos para esta rota
  será o Category, pois na hora que dermos o PUSH nós enviaremos o nome da rota e o argumento

  final category = ModalRoute.of(context)?.settings.arguments as Category;

  então estamos armazenando a Category dentro desta variavel e fizemos o casting "as" de Category para forçar
  que seja uma Category.

  Agora iremos onde estamos criando o "link" e colocaremos o Navigator passando a função estatica "of"
  e usando a outra função pushNamed, passando o nome da categoria criado em routes, ficando assim:

  Navigator.of(context).pushNamed(
    "/categories-meals",
    arguments: category,
  );

  Em arguments pode ser um objeto, pode ser uma lista, um objeto primitvo, uma string, um int, etc...




*/

import 'package:flutter/material.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
import '../lib/screens/categories_screen.dart';

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
        home: const CategoriesScreens(),
        routes: {
          "/categories-meals": (ctx) => CategoriesMealsScreen(),
        });
  }
}
