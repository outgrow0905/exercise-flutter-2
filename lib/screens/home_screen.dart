import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "25:00",
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ))),
          Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle_outline_rounded),
                ),
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pomodoro",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                            ),
                          ),
                          Text("0",
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
