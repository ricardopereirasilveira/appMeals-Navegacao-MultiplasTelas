/*
  199. Adicionando Drawer Personalizado

  Iremos modificar a tela (tabs_screen.dart) que é a tela que "comanda" as duas principais
  telas que são a Categorias e a Favoritos

  Para iniciar, dentro do Scaffold, temos um atributo nomeado chamado "drawer" que por sua
  vez recebe um Drawer que tem o filho que pode receber um Text(), ficando assim:

  drawer: Drawer(
    child: Text("Drawer"),
  )

  E automaticamente irá aparecer o icone para abrir o Drawer.

  Porém nós iremos criar o Drawer através de um novo componente (porque ele não é uma tela)
  para isto criamos o "main_drawer.dart" dentro de "lib/components/" e então criamos um
  Stateless Widget e importamos o Material, após isto, criamos um Drawer e então
  fizemos algumas configurações, ficando assim:

  return Drawer(
    child: Column(
      children: [
        Container(
          child: Text('Vamos Cozinhar'),
        )
      ],
    ),
  );

  Após isto, nós criamos uma função que irá criar os Icones e os textos do Drawer

  Widget _createItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  E para chamar, usamos:
  _createItem(Icons.restaurant, 'Refeições'),


  Em seguida criamos o Drawer sem muito mistério

  return Drawer(
    child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          alignment: Alignment.bottomRight,
          child: Text(
            'Vamos Cozinhar',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20),
        _createItem(Icons.restaurant, 'Refeições'),
        _createItem(Icons.settings, 'Configurações'),
      ],
    ),
  );


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
