import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'navigation.dart';

class ServiceSelection extends StatefulWidget {
  const ServiceSelection({Key? key}) : super(key: key);
  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}
class _ServiceSelectionState extends State<ServiceSelection>{
  String? _selectedService; // Состояние: выбранная услуга
  //List<DateTime?> _dates = [];
  DateTime? _selectedDate; // Store selected date
  final List<String> _services = [
    'Hot Wrap and Mineralization ',
    'Hair Masks for Nourishing Dry Hair',
    'Reflexology',
    'Aromatherapy',
    'Thermal Detoxification',
    'Turkish Bath',
    'Facial Peel',
    'Hydrotherapy Jacuzzi',
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 95, 182, 232), Color.fromARGB(255, 102, 71, 213)],
                stops: [0.2, 0.8]),
          ),
          child: SafeArea(
              child: Center(
                  child: Column(
                    children:[
                      SizedBox(height: 30,),
                      const Text(
                        'Rejuvenate your body and soul with our restorative beauty rituals',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15,),
                      Icon(Icons.assignment,
                        size: 70,),
                      SizedBox(height: 20,),
                      DropdownButton<String>(
                        value: _selectedService,
                        hint: const Text('Choose service',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), // Отображается, когда ничего не выбрано
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedService = newValue;
                          });
                        },
                        items: _services.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(style: TextStyle(fontWeight: FontWeight.bold), value),
                          );
                        }).toList(),
                      ),
                      //if (_selectedService != null) // Отображаем, что-то после выбора
                SizedBox( // Added SizedBox for height control
                  height: 300, //Adjust value to control the height
                  width: 300, // Adjust width as needed.
                  child: TableCalendar(
                    firstDay: DateTime.utc(2025, 1, 1),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _selectedDate ?? DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return _selectedDate != null && isSameDay(_selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDate = selectedDay;
                      });
                    },
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(fontSize: 12),
                      weekendTextStyle: TextStyle(fontSize: 12),
                      selectedTextStyle: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(fontSize: 14),
                    ),
                    daysOfWeekHeight: 20,
                    rowHeight: 30,

                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        if (isSameDay(day, DateTime.now()) && _selectedDate == null) {
                          return Center(
                            child: Text(
                              day.day.toString(),
                              style: const TextStyle(color: Colors.black, fontSize: 12), // Match calendarStyle
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Selected Date: ${_selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : 'No date selected'}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_selectedDate != null) {
                    print('Confirmed Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}');
                  } else {
                    print('No date selected');
                  }

                },
                child: const Text('Confirm my choice'),
              ),
                ]
    ),
          ),
        ),
    ),
        bottomNavigationBar: const CustomBottomNavigationBar()
        );

  }
}

