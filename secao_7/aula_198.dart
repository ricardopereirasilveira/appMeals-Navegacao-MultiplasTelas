/*
  198. Adicionar TabBar inferior

  title: Text(
    _screens[_selectedScreenIndex]['title'] as String,
  ),
  body: _screens[_selectedScreenIndex]['screen'] as Widget


  BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: 'Categorias',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: 'Favoritos',
  ),

  OBS: A screen (tabs_screen.dart) é a que controla a Categorias e a Favoritos

  Agora colocamos a tab na parte inferior, para isto, iniciamos colocando o parametro nomeado
  (dentro do Scaffold) chamado "bottomNavigationBar", que por sua vez recebe a classe
  "BottomNavigationBar"

  Scaffold(
  bottomNavigationBar: BottomNavigationBar()
  )

  o BottomNavigationBar recebe alguns parametros nomeados para conseguir montar a bottomTabBar

  - onTap: _selectScreen,
  Este parametro, é o parametro que irá fazer com que seja trocado entre as tabs
  ao clicar nas diferentes tabs, este parametro recebe uma função como parametro, neste
  caso criamos a "_selectScreen" que recebe um inteiro (que neste caso, irá fazer a troca de
  tabs), dentro dele colocamos um setState, porque ele será necessário para atualizar a tela
  quando for trocado de tab e renderizar a nova tela.

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  - backgroundColor: Theme.of(context).primaryColor
  Este defini a cor de background do bottom bar, neste caso estamos passando a cor padrão
  definida no ThemeData dentro do main.dart

  - unselectedItemColor: Colors.white,
  Esta é a cor definida para quando o item não esta selecionado, neste caso passamos a cor branca

  - selectedItemColor: Theme.of(context).accentColor,
  Esta é a cor para para quando o bottom bar estiver selecionado, neste caso pegamos a cor
  secundaria do ThemeData

  - currentIndex: _selectedScreenIndex,
  Corresponde ao index da tab que atualmente esta selecionada, isto é usado para conseguir
  modificar as cores da tab atual

  - items: const [
    BottomNavigationBarItem(
      // backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(Icons.category),
      label: "Categorias",
    ),
    BottomNavigationBarItem(
      // backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(Icons.star),
      label: "Favoritos",
    ),
  ]
  Este corresponde a cada aba do bottom bar, foi inserido individualmente cada bar (categorias
  e favoritos), foi inserida um icone individual para cada um também.

  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Categorias', 'screen': CategoriesScreens()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()},
  ];
  Essa função é a que corresponde a cada tela da bottom bar, foi adicionado o title para seja
  usado no title da página

  body: _screens[_selectedScreenIndex]['screen'] as Widget
  aqui é onde é inserido a tela, correspondente ao INDEX

  appBar: AppBar(
    title: Text(_screens[_selectedScreenIndex]['title'] as String),
  ),
  aqui é para adicionar um titulo para cada tela da tab, foi usado desta maneira.


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
