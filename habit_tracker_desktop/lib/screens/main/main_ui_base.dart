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
  TimeOfDay bedTime = const TimeOfDay(hour: 21, minute: 45);

  String getTimeToBed() {
    if (TimeOfDay.now().hour * 60 + TimeOfDay.now().minute <
        bedTime.hour * 60 + bedTime.minute) {
      int hours = bedTime.hour - TimeOfDay.now().hour;
      int minutes = bedTime.minute - TimeOfDay.now().minute;
      if (minutes < 0) {
        minutes = 60 + minutes;
        hours -= 1;
      }
      return '$hours ${hours == 1 ? 'hr' : 'hrs'} $minutes ${minutes == 1 ? 'min' : 'mins'} until bed time';
    }
    if (TimeOfDay.now().hour == bedTime.hour) {
      if (TimeOfDay.now().minute == bedTime.minute) return 'Time to Sleep';
      return '${TimeOfDay.now().minute - bedTime.minute} mins past bed time';
    }
    return '${TimeOfDay.now().hour - bedTime.hour} hrs ${TimeOfDay.now().minute - bedTime.minute} mins past bed time';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: screenWidth > 800
          ? Padding(
              padding: const EdgeInsets.fromLTRB(60, 60, 60, 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Habit Tracker',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          getTimeToBed(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Color(0x20000000),
                  ),
                  const SizedBox(width: 12.5),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    width: screenWidth / 4,
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
                        Expanded(
                          child: Material(
                            child: ListView(
                              children: [
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.completed,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.failed,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.partiallyCompleted,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.excused,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.future,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.excused,
                                ),
                                const SizedBox(height: 18),
                                TodayHabit(
                                  Habit(
                                    name: 'Anki',
                                    requirement: '20 mins or finish cards',
                                    partialRequirement: 'do 10 cards',
                                    completed: 50,
                                    partiallyCompleted: 10,
                                    failed: 10,
                                    excused: 3,
                                    streak: 54,
                                  ),
                                  HabitState.future,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null, // different layout if too narrow
    );
  }
}
