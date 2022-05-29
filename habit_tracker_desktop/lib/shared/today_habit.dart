import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_tracker_desktop/models/habit.dart';

class TodayHabit extends StatefulWidget {
  const TodayHabit(this.habit, this.state, {Key? key}) : super(key: key);

  final Habit habit;
  final HabitState state;

  @override
  State<TodayHabit> createState() => _TodayHabitState();
}

class _TodayHabitState extends State<TodayHabit> {
  @override
  Widget build(BuildContext context) {
    double percentage =
        (widget.habit.completed + widget.habit.partiallyCompleted) *
            100 /
            (widget.habit.completed +
                widget.habit.partiallyCompleted +
                widget.habit.excused +
                widget.habit.failed);

    Color foregroundColor = widget.state == HabitState.future
        ? Colors.black
        : widget.state == HabitState.skip
            ? const Color(0x50000000)
            : Colors.white;

    return ListTile(
      onTap: () {
        print('toggle habit state');
      },
      onLongPress: () {
        print('toggle not today');
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: foregroundColor == Colors.black
            ? const BorderSide(color: Colors.black38)
            : foregroundColor == const Color(0x50000000)
                ? const BorderSide(color: Colors.black12)
                : BorderSide.none,
      ),
      tileColor: habitStateColors[widget.state],
      textColor: foregroundColor,
      title: SizedBox(
        height: 55,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.habit.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(habitStateIcons[widget.state],
                      size: 18, color: foregroundColor),
                  const SizedBox(width: 5),
                  Text(
                    habitStateNames[widget.state] ??
                        'NO NAME ASSIGNED TO STATE',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    percentage.toStringAsPrecision(3),
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 2),
                  SizedBox(
                    // to ensure the numbers align perfectly
                    width: 16,
                    child:
                        FaIcon(Icons.percent, size: 16, color: foregroundColor),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.habit.streak.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 2),
                  SizedBox(
                    width: 16,
                    child: FaIcon(FontAwesomeIcons.fire,
                        size: 16, color: foregroundColor),
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
