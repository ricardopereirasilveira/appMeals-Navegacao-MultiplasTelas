/*
  191. Compnente Item Refeição #02

  A Stack, basicamente, ficou assim, recebendo a imagem atrás e um texto por cima:

  Stack(
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Image.network(
          meal.imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Text(
        meal.title,
      ),
    ],
  )

  nós temos um componente que so funciona em termos de Stack que é o Positioned(), ele basicamente 
  movimenta o que foi passado para ele, através do componente inteiro, então ele consegue ficar na
  distancia que for desejado, neste caso, deixamos 20px do bottom e 10px do lado direito, ele irá
  movimentar o Container que está inserido a informação do Text() que contem o title

  Positioned(
    bottom: 20,
    right: 10,
    child: Container(
      width: 300,
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Text(
        meal.title,
        style: const TextStyle(
          fontSize: 26,
          color: Colors.white,
        ),
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    ),
  ),

  Relembrando: O Positioned só funciona no conceito de Stack(), não da para ser usado em outros elementos
  pois ele é filho da Stack

  Dentro de Meal (meal.dart) nós criamos um getter para transformar a complexibilidade da receita em
  uma String, assim, não precisamos ficar fazendo nada no componente, pois a informação já irá vir
  do getter

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Normal';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  Dentro do Meal (meal.dart) nós também criamos um getter para "traduzir" o custo da receita, tendo a 
  mesma logica da complexibilidade

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Barato';
      case Cost.fair:
        return 'Justo';
      case Cost.expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

  Agora iremos criar (lado a lado) as 3 informações necessárias para conseguir colocar o tempo, dificuldade
  e também o custo, fizemos tudo com um componente pai Padding e ir modificando dentro dele.

  Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule),
            const SizedBox(width: 6),
            Text("${meal.duration} min")
          ],
        ),
        Row(
          children: [
            const Icon(Icons.work),
            const SizedBox(width: 6),
            Text(meal.complexityText)
          ],
        ),
        Row(
          children: [
            const Icon(Icons.attach_money),
            const SizedBox(width: 6),
            Text(meal.costText)
          ],
        ),
      ],
    ),
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
