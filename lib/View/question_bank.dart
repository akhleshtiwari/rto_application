import 'package:flutter/material.dart';
import 'package:rto_application/Utils/text.dart';

class QuestionBank extends StatelessWidget {
  const QuestionBank({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: textYellow("QuestionBank"),
          backgroundColor: const Color.fromARGB(255, 255, 105, 5),
          bottom: const TabBar(tabs: [
            Tab(
              text: "QUESTIONS",
            ),
            Tab(
              text: "TRAFFIC SIGNS",
            )
          ]),
        ),
        backgroundColor: Colors.yellow,
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => const Card(
                child: ListTile(
                  title: Text(
                    "single questions",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  subtitle: Text(
                    "the correct answer",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                    shape: BeveledRectangleBorder(),
                    child: ListTile(
                      leading: Icon(Icons.arrow_back),
                      title: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Cumpulsory Turn Left",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
