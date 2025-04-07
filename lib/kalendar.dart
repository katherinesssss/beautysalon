// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart'; // Для локализации
// void main(List<String> args) {
//   runApp(MaterialApp(home: ScrollingCalendar()));
// }
// class ScrollingCalendar extends StatefulWidget {
//   @override
//   _ScrollingCalendarState createState() => _ScrollingCalendarState();
// }
//
// class _ScrollingCalendarState extends State<ScrollingCalendar> {
//   late DateTime _currentDate;
//   late FixedExtentScrollController _scrollController;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentDate = DateTime.now();
//     _scrollController = FixedExtentScrollController(initialItem: 365); // Начальная позиция
//     initializeDateFormatting('ru_RU', null); // Инициализация локализации для русского
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   String _formatDate(DateTime date) {
//     final formatter = DateFormat('dd MMMM yyyy', 'ru_RU'); // Формат даты на русском
//     return formatter.format(date);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Календарь с прокруткой'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 80,
//             child: ListWheelScrollView.useDelegate(
//               controller: _scrollController,
//               itemExtent: 50,
//               diameterRatio: 1.5,
//               physics: FixedExtentScrollPhysics(), // Предотвращает "пружинный" эффект
//               childDelegate: ListWheelChildLoopingListDelegate(
//                 children: List<Widget>.generate(
//                   10 * 365, // 10 лет (примерно)
//                       (index) {
//                     final date = DateTime.now().add(Duration(days: index - 365)); // Рассчитываем дату
//                     return Center(
//                       child: Text(
//                         _formatDate(date), // Форматируем дату
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               onSelectedItemChanged: (index) {
//                 setState(() {
//                   _currentDate = DateTime.now().add(Duration(days: index - 365));
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Выбранная дата: ${_formatDate(_currentDate)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
class Kalendar extends StatelessWidget {
  const Kalendar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: SafeArea(
              child: Calendar(
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fr', 'Sat', 'Sun'],
                isExpandable: false,//снизу показывает дату при нажатии
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                selectedTodayColor: Colors.red,
                todayColor: Colors.blue,
                eventColor: null,
                locale: 'en_EN',
                isExpanded: true,
                expandableDateFormat: 'dd MMMM yyyy',
                datePickerType: DatePickerType.hidden,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
              ),
            ),
          ),
          //ListView.builder(itemBuilder: itemBuilder)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // const Text(
          //   'Выберите услугу:',
          //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          // );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
