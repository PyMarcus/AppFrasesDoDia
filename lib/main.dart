import 'package:flutter/material.dart';


// app simples que consiste em gerar novas frases

void main(List<String> args){
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Home()
    ));
}


//classe para controle de estados e que permite alterações:
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//classe gerada pra construir os widgets
class _HomeState extends State<Home> {

  int contador = 0;
  String _exibition = "Clique abaixo para gerar uma frase!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Frases do dia"),
        backgroundColor: Colors.green[900], //verde escuro

      ),

      body: Center(
        child: Container(

          //width: double.infinity, //permite alinhar 100% ao tamanho disponível, caso nao use Center()

          padding: EdgeInsets.all(16),

          child: Column(

            children: <Widget>[

              //conteúdo em coluna, um abaixo do outro, imagem ,texto ,botao
              Image.asset("images/logo.png"),

              Text(_exibition,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),),

              ElevatedButton(

                  // funcao anônima no onPressed
                  onPressed:   (){
                        List vetor = ["Se Cristo vos libertar, verdadeiramente sereis livres! (João 8:36)", "Quem é correto nunca fracassará e será lembrado para sempre.", "Somos autómatos em três quartas partes das nossas acções.Wilhelm Leibniz"
                        ,"Amar é encontrar a própria felicidade na felicidade alheia. Wilhelm Leibniz", "Como é duro odiar os que se gostaria de amar.Voltaire", "O trabalho poupa-nos de três grandes males: tédio, vício e necessidade.Voltaire"];

                        //altera estado
                        setState(() {
                          this._exibition = vetor[contador];
                        });
                        this.contador += 1;

                        // se alcançar o tamanho do vetor, é zerado
                        if(contador == vetor.length) contador = 0;

                  }

                      ,
                  child: Text(
                    "Próxima",
                    style: TextStyle(fontSize: 25),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.green[900]),
                    foregroundColor: MaterialStateProperty.all(Colors.white),)
              )

            ],

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),


    );
  }
}
