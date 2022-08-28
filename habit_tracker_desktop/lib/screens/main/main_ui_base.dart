import 'package:flutter/material.dart';
import 'package:habit_tracker_desktop/models/habit.dart';
import 'package:habit_tracker_desktop/screens/main/all_time_view.dart';
import 'package:habit_tracker_desktop/screens/main/month_view.dart';
import 'package:habit_tracker_desktop/screens/main/year_view.dart';
import 'package:habit_tracker_desktop/shared/progress_bar.dart';
import 'package:habit_tracker_desktop/shared/today_habit.dart';

class MainUIBase extends StatefulWidget {
  const MainUIBase({Key? key}) : super(key: key);

  @override
  State<MainUIBase> createState() => MainUIBaseState();
}

class MainUIBaseState extends State<MainUIBase> {
  TimeOfDay bedTime = const TimeOfDay(hour: 21, minute: 45);

  // returns "[x] hrs [y] mins past bed time"
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

  int currentPage = 0;
  double viewSelectorButtonWidth = 100;
  double viewSelectorButtonHeight = 35;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: screenWidth > 1270
          ? Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
              child: Row(
                children: [
                  // left side of screen (title, month/year/all time view)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        const Text(
                          'Habit Tracker',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // time until bed
                        Text(
                          getTimeToBed(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(height: 30),
                        // view selection
                        Container(
                          width: 330,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text(
                                  'Month',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: currentPage == 0
                                        ? Colors.black
                                        : Colors.black38,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: currentPage == 0
                                      ? const Color(0xFF43CDC4)
                                      : Colors.transparent,
                                  fixedSize: Size(viewSelectorButtonWidth,
                                      viewSelectorButtonHeight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                ),
                                onPressed: () {
                                  pageController.animateToPage(
                                    0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                  setState(() => currentPage = 0);
                                },
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                child: Text(
                                  'Year',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: currentPage == 1
                                        ? Colors.black
                                        : Colors.black38,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: currentPage == 1
                                      ? const Color(0xFF43CDC4)
                                      : Colors.transparent,
                                  fixedSize: Size(viewSelectorButtonWidth,
                                      viewSelectorButtonHeight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                ),
                                onPressed: () {
                                  pageController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                  setState(() => currentPage = 1);
                                },
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                child: Text(
                                  'All Time',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: currentPage == 2
                                        ? Colors.black
                                        : Colors.black38,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: currentPage == 2
                                      ? const Color(0xFF43CDC4)
                                      : Colors.transparent,
                                  fixedSize: Size(viewSelectorButtonWidth,
                                      viewSelectorButtonHeight),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                ),
                                onPressed: () {
                                  pageController.animateToPage(
                                    2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                  );
                                  setState(() => currentPage = 2);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            children: const [
                              MonthView(),
                              YearView(),
                              AllTimeView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.black54, //Color(0x20000000),
                  ),
                  const SizedBox(width: 12.5),

                  // today's habits
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    width: screenWidth / 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Today" text and progress bar
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
                        // habits list
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
                                  HabitState.skip,
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
