import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const defaultTotalSeconds = 5;
  int totalSeconds = defaultTotalSeconds;

  late Timer timer;
  bool isRunning = false;
  int completeCount = 0;

  void tick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;

      if (totalSeconds == 0) {
        isRunning = false;
        completeCount = completeCount + 1;
        totalSeconds = defaultTotalSeconds;
        onPausePressed();
      }
    });
  }

  void onStartPressed() {
    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), tick);
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
    });

    timer.cancel();
  }

  String format(int seconds) {
    Duration duration = Duration(seconds: seconds);
    var timeSplits = Duration(seconds: seconds)
        .toString()
        .split(".")
        .first
        .toString()
        .split(":");

    return "${timeSplits[1]}:${timeSplits[2]}";
  }

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
                    format(totalSeconds),
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
                onPressed: isRunning ? onPausePressed : onStartPressed,
                icon: Icon(isRunning
                    ? Icons.stop_circle_outlined
                    : Icons.play_circle_outline_rounded),
              ))),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
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
                          Text("$completeCount",
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
