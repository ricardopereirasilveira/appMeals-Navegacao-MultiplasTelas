/*
  208. Marcar como Favoritos

  Estamos passando informações de duas maneiras atualmente, através do construtor e através do paramentro
  arguments quando inserimos um link, por exemplo.

  Agora no main.dart iremos criar uma outra lista de comida, que se inicia como vazia
  List<Meal> _favoriteMeals = [];
  Esta lista precisa ser passada ate chegar a lista de favoritos

  Nós temos a tela de TabsScreen e nesta tela que nós mudamos para a tela de favorito, nós não temos a tela
  especifica de favoritos criada FavoriteScreens e isto será feito através do Construtor, em um proximo momento
  faremos isto por gerenciamento de estado

  AppRoute.HOME: (ctx) => TabScreen(_favoriteMeals)
  e criamos no construtor dentro de tabs_screen.dart
  List<Meal> _favoritesMeals;
  TabScreen(this._favoritesMeals);

  Após estarmos em TabScreen, nós não podemos passar a informação para frente pois a tela é renderizada na
  classe _TabScreenState e nós recebemos (via construtor) a informação por TabScreen.
  Não poderemos usar também o "widget.favoriteMeals" (o "widget." é responsavél por acessar as informações do
  pai, nesse caso o TabScreen). Então o que podemos fazer é um initState que iremos receber ao começar
  a renderização da tela

  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Categorias', 'screen': CategoriesScreens()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  E então poderemos passar via construtor chamando o widget.favoriteMeals

  A tela responsavél por poder marcar uma comida como favorita é a:
  AppRoute.MEAL_DETAIL: (ctx) => const MealDetailScreen(),

  Então teremos que nela, criar uma função para quando o usuário clicar no favorito, uma função ser chamada
  e notificar o main.dart, fazemos istro através de uma função, que neste caso chama-se _toggleFavorite

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  Caso a comida seja favorita e o usuário clique no floatingButton, irá tirar como favorito, senão, irá 
  adicionar dentro do _favoriteMeals e assim ele irá indo alternando entre adicionando e removendo

  Então iremos passar essa função como parametro para o MealDetailScreen, ficando assim:
  AppRoute.MEAL_DETAIL: (ctx) =>  MealDetailScreen(_toggleFavorite),

  em meal_details_screen.dart nós vamos receber a informação anterior via construtor, ficando assim:
  final Function(Meal) onToggleFavorite;
  MealDetailScreen(this.onToggleFavorite);

  e passaremos essa função para o floatingActionButton, retornando o meal para ele subir ate o main.dart
  e então adicionar ou remove através da função _toggleFavorite
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      onToggleFavorite(meal);
    },
    child: const Icon(Icons.star),
  ),

  Outra coisa que iremos fazer é, dentro do main.dart um outro método para dizer se a comida é favorita ou
  não, para ajudar a renderizar a tela de favoritos de uma maneira diferente

  Então criamos a tela do favorite_screen.dart

  if (favoriteMeals.isEmpty) {
    return const Center(
      child: Text("Nenhuma refeição foi marcada como favorita!"),
    );
  } else {
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealItem(meal: favoriteMeals[index]);
      },
    );
  }

  RECAPITULANDO O FLUXO:
  - Na nossa aplicação principal (main.dart) nós criamos no appState mais uma lista de Meal chamada
    _favoriteMeals que inicia vazia, esta _favoriteMeals precisa ser passada de fato para o componente
    que irá renderizar ela, que no caso é a favorite_screen.dart, so que primeiro ela vai ser passada
    pro componente de tabScreen para depois ser passada pro FavoriteScreen
  - Pegamos a lista, passamos pro componente TabsScreen via construtor (porém pegamos ela via initState)
  - No FavoriteScreen recebemos via construtor essa informação e então renderizamos ela, porém fazendo
    uma verificação primeiro, se estiver vazia renderiza um texto, senão irá renderizar a lista que foi
    enviada através da variavel _favoriteMeals
  - Outra coisa que fizemos no main.dart é criar um méotodo (_toggleFavorite) que irá selecionar entre
    se uma comida foi selecionada como favorita ou não, então passamos esse método para o componente de
    MealDetailsScreen, pois é exatamente a estrela que irá marcar a comida como favorita ou não

    
  -- Modificando a "star" quando uma comida é favorita ou não.
  A primeira coisa que faremos é enviar uma função para dentro de MealDetailScreen informando se a comida
  é ou não favorita, a função criada foi essa:

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  Ou seja, ele irá retornar para dentro do MealDetailScreen se a comida está como favorita ou não
  então dentro do MealDetailsScreen, recebemos a informação via Construtor
  final bool Function(Meal) isFavorite;
  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  e então, dentro do child do floatingActionButton, nós fazemos a verificação:
  child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),

  


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
  List<Meal> _favoriteMeals = [];

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

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
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
        AppRoute.HOME: (ctx) => TabScreen(_favoriteMeals),
        AppRoute.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoute.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoute.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
