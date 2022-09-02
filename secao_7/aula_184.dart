/*
  184. Navegando para uma nova tela

  Para fazer a navegação, inicialmente nós iremos usar o "Navigator".
  E um dos conceitos de navegação que ele tem, é o de stack (pilha), que consiste em
  nós tem uma tela, se nós queremos uma nova tela, nós colocamos ela por cima, e isso faz
  com que a tela que esta em cima da pilha, seja apresentada, embora a tela anterior
  esteja atrás dela tela, sendo exibida atras da tela principal que esta acima na pilha das
  telas, se colocarmos a terceira tela, ele vai colocando ela na stack e assim vai empilhando
  as telas

  push = iremos adicionado telas a pilha de telas
  pop = iremos retirando as telas da pilha, saca a anterior e volta pra tela anterior

  o proprio Flutter (app) irá dar o botão de voltar ao darmos um push e irmos para a proxima tela
  ele automaticamente dara o botão de pop

  A primeira coisa que precisamos fazer é que o item da categoria seja clicavel, para isto,
  inicialmente iremos usar o InkWell, que através dele temos um feedback de que o usuário clicou 
  na tela, para isto usaremos o parametro nomeado chamado "onTap" ficando assim

  InkWell(
    onTap: () {},
  )

  Nota: Se nos estamos usando um elemento com "borderRadius" o feedback do click, ficara fora do "botão"
  para isto, basta adicionar dentro do InkWell o borderRadius igual do "Container" por exemplo

  Outra coisa que podemos fazer é, ao clicar no link, ele ter uma cor associada, para isto, podemos usar
  o paramentro nomeado "splashColor" e então, neste caso, usamos a cor primaria do tela para conseguirmos
  mantermos o padrão, ele irá misturar a cor com a cor de fundo da aplicação e dara um efeito de "click"

  InkWell(
    splashColor: Theme.of(context).primaryColor,
  )

  ---- Fazendo o PUSH em uma tela.
  Para começar, precisamos criar uma função que não retorna nada (void) e passaremos via parametro um context
  então daremos um Navigator.of(context).push, so que esse navigator por sua vez, não pode receber
  simplismente a Classe da nova tela, ela terá que receber um MaterialPageRoute (ou CupertinoPageRoute no
  caso do iOS), e então passaremos um builder que por padrão não precisa "ficar" com o paramentro e então
  daremos o retorno na classe da nova tela, neste caso o CategoriesMealsScreen.

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen();
        },
      ),
    );
  }

  E para chamar, nós colocamos no onTap essa função criada para chamar a nova tela, neste caso ficando assim:
  onTap: () => _selectCategory(context),

  




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
