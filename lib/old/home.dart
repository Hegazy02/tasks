import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

GlobalKey<AnimatedListState> animKey = GlobalKey<AnimatedListState>();
int count = 0;

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
  
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                sports.insert(0, "item $count");

                animKey.currentState!
                    .insertItem(0, duration: const Duration(milliseconds: 500));
                count++;
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: AnimationLimiter(
        child: AnimatedList(
          key: animKey,
          initialItemCount: sports.isNotEmpty ? sports.length : 0,
          itemBuilder: (context, index, animation) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child:
                            slidIt(context, index, animation, press: false))));
          },
        ),
      ),
    );
  }
}

List sports = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten"
];
Widget slidIt(BuildContext context, int index, Animation<double> animation,
    {bool? press}) {
  return SizeTransition(
    axis: Axis.vertical,
    sizeFactor: animation,
    child: Card(
      child: ListTile(
        title: press == false ? Text("${sports[index]}") : Text("Deleted"),
        leading: IconButton(
            onPressed: () {
              press = true;

              try {
                animKey.currentState!.removeItem(
                    index,
                    (_, animation) =>
                        slidIt(context, index, animation, press: true),
                    duration: const Duration(milliseconds: 500));
                count--;

                Future.delayed(
                    Duration(milliseconds: 500), () => sports.removeAt(index));
              } catch (e) {
                print(e);
              }
            },
            icon: Icon(Icons.delete)),
        tileColor: press == false
            ? Colors.primaries[index % Colors.primaries.length]
            : Color.fromARGB(255, 219, 27, 20),
      ),
    ),
  );
}
