import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';

DateTime? date = DateTime.now();

class home2 extends StatefulWidget {
  home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  Map? m;
  getDate(date) {
    m = {
      "title": "asdasdasd",
      "subTitle":
          "${DateFormat.yMMMd().format(date)} ${DateFormat.jm().format(date)}",
      "color": Colors.greenAccent
    };
    return m;
  }

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
    GlobalKey<AnimatedListState> animKey = GlobalKey<AnimatedListState>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            notesList.add(getDate(DateTime.now()));
            animKey.currentState!
                .insertItem(0, duration: const Duration(milliseconds: 500));
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        splashColor: Colors.yellowAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          CustomSearch(),
          Expanded(
              child: AnimationLimiter(
            child: AnimatedList(
              initialItemCount: notesList.length,
              key: animKey,
              itemBuilder: (context, index, animation) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 200),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: DismissibleTile(
                          movementDuration: Duration(milliseconds: 0),
                          direction: DismissibleTileDirection.rightToLeft,
                          key: UniqueKey(),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          delayBeforeResize: const Duration(milliseconds: 0),
                          rtlDismissedColor: Colors.redAccent,
                          rtlOverlay: const Text('Delete'),
                          rtlOverlayDismissed: const Text('Deleted'),
                          onDismissConfirmed: () {
                            try {
                              notesList.removeAt(index);
                            } catch (e) {
                              print(e);
                            }
                            print(notesList);
                          },
                          child: Container(
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
                          ),
                        ))));
              },
            ),
          ))
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
