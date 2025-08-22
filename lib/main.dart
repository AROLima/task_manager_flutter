import 'package:flutter/material.dart';

const double fontSize = 28;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            leading: Container(),
            title: Text("Tarefas")
        ),
        body: ListView(
          children: [
            Task("Aprender Flutter", "https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096"),
            Task("Andar de Bike","https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            Task("Meditar", "https://gruposaojudastadeu.com.br/wp-content/webp-express/webp-images/uploads/2019/10/como-meditar-pode-te-ajudar.jpg.webp"),
            Task("Ler", "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg"),
            Task("Jogar", "https://img.odcdn.com.br/wp-content/uploads/2021/04/Controle-do-Xbox-One.jpg"),

          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;

  const Task(
    //constructor
    this.nome,
    this.foto,
      {super.key,}
      );

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Stack(
          children: [
            Container(color: Colors.blue, height: 140),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                          ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,size: 15,color: Colors.blue,),
                              Icon(Icons.star,size: 15,color: Colors.blue,),
                              Icon(Icons.star,size: 15,color: Colors.blue,),
                              Icon(Icons.star,size: 15,color: Colors.blue[100],),
                              Icon(Icons.star,size: 15,color: Colors.blue[100],),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                "UP",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel/10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Nível: $nivel",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
