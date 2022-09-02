/*
  183. Tema & Estilo

  Primeiramente, vamos colocar a cor primaria e secundaria dentro do ThemeData no main.dart
  para isto, dentro do ThemeData usamos os atributos nomeados chamados "primarySwatch" e
  também o "accentColor", ficando assim:

  MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
    )
  )

  Na sequencia, criamos o atributo nomeado chamado "fontFamily" para isto baixamos fontes externas
  e colocamos ela dentro do "assets/fonts" e em seguida cadastramos ela dentro do pubspec.yaml
  então definimos a fonte padrão do aplicativo através do atributo nomeado, ficando assim

  MaterialApp(
    theme: ThemeData(
      fontFamily: 'Raleway',
    )
  )

  E no pubspec.yaml
  fonts:
    - family: Raleway
      fonts:
        - asset: assets/fonts/Raleway-Black.ttf
          weight: 900
        - asset: assets/fonts/Raleway-Bold.ttf
          weight: 700
        - asset: assets/fonts/Raleway-Regular.ttf
    - family: RobotoCondensed
      fonts:
        - asset: assets/fonts/RobotoCondensed-Bold.ttf
          weight: 700
        - asset: assets/fonts/RobotoCondensed-Italic.ttf
          style: italic
          weight: 700
        - asset: assets/fonts/RobotoCondensed-Light.ttf
          weight: 300
        - asset: assets/fonts/RobotoCondensed-Regular.ttf
  
  Em seguida, usamos um atributo nomeado chamado "canvasColor" que coloca cor de fundo em nossa aplicação
  para isto, usamos um RGB em tons amarelados, e então o atributo nomeado para cor de fundo, fica assim

  MaterialApp(
    theme: ThemeData(
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    )
  )

  Após isto, definimos uma cor padrão para o texto, onde todo o texto da app ficara padrão, em termos de
  fonte e cor, colocando dentro do "textTheme", um atributo nomeado do ThemeData, ficando assim:
  
  textTheme: ThemeData.light().textTheme.copyWith(
    headline1: const TextStyle(
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
    ),
  ),

  Agora nós podemos usar os padrões, como por exemplo, do texto, dentro da app, com o seguinteo código:
  Text(
    "Titulo Exemplo",
    style: Theme.of(context).textTheme.headline1,
  ),



*/

import 'package:flutter/material.dart';
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
    );
  }
}
