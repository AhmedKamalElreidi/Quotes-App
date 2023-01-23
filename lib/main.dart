// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quotes/widgets/CardW.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quotes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}
//class of card quote(title,author)
class BestQuote {
  String title;
  String author;
  BestQuote({required this.author, required this.title});
}

class _QuotesState extends State<Quotes> {
  //List of all quotes
  List AllQuotes = [
    BestQuote(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuote(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuote(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuote(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
  //To delete card-quote when clicking on delete icon
  deleteTask(BestQuote item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }
  //To Add New card-quote when clicking on Add Text Button in showmodelbuttonsheet
  addNewQuote() {
    setState(() {
      AllQuotes.add(
          BestQuote(title: myController.text, author: myController2.text));
    });
  }
  //create 2 controller to get the text from 2 textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          hintText: "Add New Quote",
                        ),
                        maxLength: 400,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                          hintText: "Add Author",
                        ),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addNewQuote();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Quotes",
          style: TextStyle(fontSize: 33),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //... children انا عملت الديستراكتور هنا ... عشان الاقواس بتاعة ال
            ...AllQuotes.map((item) => CardWidget(
              //to pass the item inside the List to "CardW.dart" file
                  item: item,
              //to pass the Function inside to "CardW.dart" file
                  deleteTask: deleteTask,
                  mytitle: item.title,
                  myauthor: item.author,
                )).toList(),
          ],
        ),
      ),
    );
  }
}
