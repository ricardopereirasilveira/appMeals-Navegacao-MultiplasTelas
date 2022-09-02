/*
  190. Compnente Item Refeição #01

  Agora iremos começar a passar as informações e para isto, criamos um novo componente chamado 
  MealItem (meal_item.dart) com isto, nós passamos o Meal através do construtor (meal = classe que
  recebe todas as informações da receita)
  Após isto, fomos em CategorieMealScreen (categories_meals_screen.dart) e então enviamos
  através do construtor MealItem o categoryMeals[index], ficando assim

  MealItem(meal: categoryMeals[index]);

  O que estamos fazendo aqui é passar para a classe MealItem o categoryMeals (qe neste caso, é um
  WHERE que filtra por category.id == meals.categories) e então enviamos exatamente a receita
  completa para dentro da receita pelo ID dela, porque pegamos o ID e passamos o objeto inteiro

  Dentroo do MealItem nós vamos modificar o Card e colocar um atributo nomeado "shape" que irá
  transformar (neste caso) o nosso card em um card circular, definindo o tamanho dele, ficando assim

  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  )

  no Card nós iremos envolver ele com a classe InkWell para ela se tornar clicavel e então
  colocamos o parametro nomeado "onTap" que irá receber uma função que neste caso se chamara
  _selectMeal()

  Agora iremos colocar um elemento sobre o outro (neste caso, um texto sobre uma imagem), para
  isto nós usaremos a classe Stack
  O stack recebe um array e a primeira coisa que iremos colocar é a imagem, porém a imagem é quadrada
  então colocaremos um ClipRRect que irá fazer as bordas da imagem, definindo qual borda queremos
  modificar, neste caso, as superiores

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
      )
    ],
  )

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
