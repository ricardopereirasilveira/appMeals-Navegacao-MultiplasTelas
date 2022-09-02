/*
  182. Componente Item Categoria

  Aqui nós criamos uma cor, pegando a cor definida no Category e colocamos um grandient, para isto
  usamos, dentro do BoxDecoration um atributo nomeado chamado "grandient" e então passamos duas
  sendo ambas as mesmas cores, so que uma com opacidade e outra sem opacidade, ficando assim:

  Container(
    padding: EdgeInsets.all(15),
    child: Text(category.title),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.5),
          category.color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );

  É possível usar quantas cores achar necessário, pois é um array. Nós também colocamos o gradiente
  começando do lado esquerdo superior e finalizando o lado direito inferior.
  
  Colocamos também uma borda circular utilizando "borderRadius" 

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
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesScreens(),
    );
  }
}
