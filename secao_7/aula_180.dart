/*
  180. Iniciando a App.

  A primeira coisa que iremos fazer, é dentro de lib, criar uma nova pasta chamada "models" e dentro
  desta pasta, vamos criar uma arquivo chamado "category.dart", que nele irá constar a classe que se 
  refere a categoria, ela irá criar a instancia de todas as categorias, ficando assim

  --> category.dart
  class Category {
    final String id;
    final String title;
    final Color color;

    const Category({
      required this.id,
      required this.title,
      this.color = Colors.orange,
    });
  }

  Então criamos um dummy_data.dart dentro de "lib > data" para que possamo instanciar varias categorias
  dentro de um array e com isto, temos diversas categorias instanciadas e dentro de uma lista.

  Criaremos uma nova pasta chamada "screens" e dentro dela colocaremos o "categories_screen.dart" que irá
  criar a tela principal, onde irá mostrar todas as telas. Nela iremos usar o GridView(). A diferença do
  GridView() pro ListView() é que o ListView ficara um em baixo do outro enquanto o GridView pode ficar
  em esquema de grid, lado a lado, do tamanho necessário.

  Dentro do GridView nós iremos passar um atributo nomeado chamado "gridDelegate" que por sua vez irá
  receber um SliverGridDelegateswithMaxCrossAxisExtent()

  Sliver = em flutter é uma área que contem Scroll (scrollable area) 
  GridDelegate = como essa grid será renderizada
  WithMaxCrossAxisExtent = No ponto de vista do CrossAxis ele irá extender ao máximo

  return GridView(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent()
  )

  dentro de SliverGridDelegateWithmaxCrossAxisExtends nós iremos colocar alguns atributos nomeados

  - maxCrossAxisExtent: 200 = aqui ele está informando que o número máximo de pixels que um grid terá
  é de 200, então se nossa tela tem 300px, ele irá colocar apenas 1 grid, se nossa tela tiver 800px ele
  irá colocar 4 grids (800 / 200 = 4) e assim sucessivamente.

  - childAspectRatio: 3/2 = qual será a proprorção de cada elemento dentro do meu GridView() se a proproção
  for por exemplo 2 pra 1 (mais alto do que largo) e no nosso caso, usamos de 1/5 (ou seja, 3 pra 2)

  - crossAxisSpacing: 20 = É o espaçamento no eixo cruzado (horizontal) com o tamanho de 20

  - mainAxisSpacing: 20 = É o espaçamento no eixo principal (vertical) com tamanho de 20


  OBS: Nós podemos usar intercambiavel o nome "screen(tela)", as vezes usamos página(page), rota(route)
  e teremos diversos tipo de nomeclaturas que podem ser definidos diferentemente

*/

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
