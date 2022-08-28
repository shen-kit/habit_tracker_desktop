import 'package:flutter/material.dart';
import 'package:habit_tracker_desktop/shared/progress_bar.dart';

class MonthView extends StatefulWidget {
  const MonthView({Key? key}) : super(key: key);

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  final TextStyle habitSymbolFontStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final double dateNumbersSpacing = 12.6;

  // get the date of the first saturday in the month
  List<int> _getSaturdays() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    // get first saturday in the month
    DateTime date = DateTime(now.year, now.month, 1);
    date = date.subtract(Duration(days: date.weekday - 6));

    List<int> saturdays = [];
    for (var i = date.day; i <= daysInMonth; i += 7) {
      saturdays.add(i);
    }
    return saturdays;
  }

  // create a list of text widgets of the date numbers
  List<Widget> _generateDateNumbers(List<int> saturdays) {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    List<Widget> datesList = [];
    for (var date = 1; date <= daysInMonth; date++) {
      if (saturdays.contains(date)) {
        datesList.addAll([
          Text(date.toString()),
          SizedBox(
            height: 20,
            child: VerticalDivider(
              width: dateNumbersSpacing,
              color: Colors.black26,
            ),
          ),
        ]);
      } else {
        datesList.addAll([
          Text(date.toString()),
          SizedBox(width: dateNumbersSpacing),
        ]);
      }
    }
    return datesList;
  }

  @override
  Widget build(BuildContext context) {
    final List<int> saturdays = _getSaturdays();

    return Column(
      children: <Widget>[
        // for month switch bottons and current month
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 36,
              splashRadius: 20,
              icon: const Icon(Icons.keyboard_arrow_left),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 36,
              splashRadius: 20,
              icon: const Icon(Icons.keyboard_arrow_right),
            ),
            const SizedBox(width: 16),
            const Text(
              'September 2022',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ProgressBar(
          backgroundColor: Color(0x2000397C),
          fillColor: Color(0xFF30ACD3),
          fillAmount: .76,
        ),

        // habit tracking area
        Column(
          children: [
            const Divider(
              thickness: 1,
              height: 20,
              color: Colors.black38,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // habit symbols
                Column(
                  children: [
                    const SizedBox(height: 36),
                    Text(
                      'A',
                      style: habitSymbolFontStyle,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'E',
                      style: habitSymbolFontStyle,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'H',
                      style: habitSymbolFontStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                  child: VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: Colors.black26,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // date numbers
                      Row(
                        children: _generateDateNumbers(saturdays),
                      ),
                      // habit 1 boxes
                      Row(),
                      // habit 2 boxes
                      Row(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
