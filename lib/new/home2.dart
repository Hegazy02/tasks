import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime? date = DateTime.now();

class home2 extends StatelessWidget {
  home2({super.key});

  List notesList = [
    {
      "title": "asdasdasd",
      "subTitle":
          "${DateFormat.yMMMd().format(date!)} ${DateFormat.jm().format(date!)}",
      "color": Colors.greenAccent
    },
    {
      "title": "awsdgasgasdgas",
      "subTitle":
          "${DateFormat.yMMMd().format(date!)} ${DateFormat.jm().format(date!)}",
      "color": Colors.yellowAccent
    },
    {
      "title": "rjrtjrt",
      "subTitle":
          "${DateFormat.yMMMd().format(date!)} ${DateFormat.jm().format(date!)}",
      "color": Colors.orangeAccent
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Icon(Icons.add),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          CustomSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 10),
                  height: height * 0.1,
                  width: width * 8,
                  decoration: BoxDecoration(
                      color: notesList[index]["color"],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notesList[index]["title"]),
                      Text(notesList[index]["subTitle"])
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.only(left: 10),
            hintText: "Search",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
