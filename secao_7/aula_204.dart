/*
  204. Filtrando os Dados #01

  final categoryMeals = meals.where((meal) {
    return meal.categories.contains(category.id);
  }).toList();

  Por enquanto os dados mockados, estão em categorias (mostrar as categorias) e o outro CategoriasMealsScreen
  que essa tela acessa diretamente as refeições. Nós iremos filtrar antecipadamente os dados antes de enviar
  para a categoria, para não precisar fazer essa verificação posteriormente.

  Nós iremos ser notificados através da main.dart e então enviar para as outras telas 

  a variavel _availableMeals (dentro de categories_meals_screen.dart) foi criada para pegar todas as 
  comidas (DUMMY_MEALS) e então ir modificando conforme vamos precisando ou setando filtros. Ainda dentro do
  categories_meals_screen.dart nós criamos um construtor que irá receber a lista de comidas (meals) por parametro
  o meals que foi recebido no construtor está fazendo o papel do DUMMY_MEALS (que na verdade será passado
  via construtor, porém filtrado já). Nós iremos passar no CategoriesMealsScreen o _availableMeals que só
  esta (momentaneamente) recebendo o DUMMY_MEALS. Esta alteração por enquanto não irá modificar nada, pois
  só tiramos a chamada do DUMMY_MEALS de local (agora ela está no main.dart)

  estrategia usada:
  Iremos passar uma função para a tela de configurações (settings_screen.dart) onde podemos exibir ou ocultar
  as configurações de gluten, etc. Sempre que houver uma modificação (true > false ou false > true) essa função
  será chamada notificando o componente MyApp (especificamente dentro de _MyAppState)

  dentro de SettingsScreen foi criada uma função:
    final Function(Settings) onSettingsChanged;
    const SettingsScreen(this.onSettingsChanged);
  ou seja, toda vez for modificada as configurações, essa função será chamada



*/

import 'package:flutter/material.dart';
import 'package:refeicoes/models/settings.dart';
import 'package:refeicoes/screens/categories_meals.screen.dart';
import 'package:refeicoes/screens/settings_screen.dart';
import '../lib/screens/meal_detail_screen.dart';
import '../lib/utils/app_route.dart';
import '../lib/screens/tabs_screen.dart';
import '../lib/models/meal.dart';
import '../lib/data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree;
        final filterVegan = settings.isVegan! && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

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
        AppRoute.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoute.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoute.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
