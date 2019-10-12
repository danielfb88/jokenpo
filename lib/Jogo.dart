import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolha) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[Random().nextInt(3)];
    print("escolha usuário: $escolha");
    print("escolha app: $escolhaApp");

    // exibição da imagem escolhida pelo app
    switch( escolhaApp ) {
      case "pedra" :
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    // validando ganhador
    var empate = "Empatou!";
    var vencedor = "Você venceu!";
    var perdedor = "Voce perdeu!";

    // user ganahdor
    if(
      (escolha == "pedra" && escolhaApp == "tesoura") ||
      (escolha == "tesoura" && escolhaApp == "papel") ||
      (escolha == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabéns! Você ganhou!";
      });
      // App ganahdor
    } else if (
      (escolhaApp == "pedra" && escolha == "tesoura") ||
      (escolhaApp == "tesoura" && escolha == "papel") ||
      (escolhaApp == "papel" && escolha == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você perdeu!";
      });
      // Empate
    } else if (
      (escolha == "pedra" && escolhaApp == "pedra") ||
      (escolha == "tesoura" && escolhaApp == "tesoura") ||
      (escolha == "papel" && escolhaApp == "papel")
    ) {
      setState(() {
        this._mensagem = "Empatamos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imageApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              )
            ],
          )

        ],
      ),
    );
  }
}
