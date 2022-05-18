import 'package:flutter/material.dart';
import 'package:habit_tracker_desktop/models/habit.dart';
import 'package:habit_tracker_desktop/shared/progress_bar.dart';
import 'package:habit_tracker_desktop/shared/today_habit.dart';

class MainUIBase extends StatefulWidget {
  const MainUIBase({Key? key}) : super(key: key);

  @override
  State<MainUIBase> createState() => MainUIBaseState();
}

class MainUIBaseState extends State<MainUIBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: Row(
          children: [
            Expanded(child: PageView()),
            const VerticalDivider(
              thickness: 1,
              color: Color(0x20000000),
            ),
            const SizedBox(width: 12.5),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const ProgressBar(
                    backgroundColor: Color(0x2000397C),
                    fillColor: Color(0xFF30ACD3),
                    fillAmount: .25,
                  ),
                  const SizedBox(height: 36),
                  TodayHabit(
                    Habit(
                        name: 'Anki',
                        requirement: '20 mins or finish cards',
                        partialRequirement: 'do 10 cards',
                        completed: 50,
                        partiallyCompleted: 10,
                        failed: 10,
                        excused: 3,
                        streak: 54),
                    habitState.future,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
