import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
class ServiceSelection extends StatefulWidget {
  const ServiceSelection({Key? key}) : super(key: key);
  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}
class _ServiceSelectionState extends State<ServiceSelection>{
  String? _selectedService; // Состояние: выбранная услуга
  List<DateTime?> _dates = [];
  final List<String> _services = [
    'Горячее обертывание и минерализация ',
    'Маски для волос для питания сухих волос',
    'Рефлексотерапия',
    'Ароматерапия',
    'Термальная детоксикация',
    'Хамам',
    'Пилинг лица',
    'Джакузи с гидромассажем',
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
                child: Container(
                  child: Column(
                    children:[
                      SizedBox(height: 30,),
                      const Text(
                        'Выберите услугу:',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15,),
                      Icon(Icons.assignment,
                        size: 70,),
                      SizedBox(height: 20,),
                      DropdownButton<String>(
                        value: _selectedService,
                        hint: const Text('Выберите услугу',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), // Отображается, когда ничего не выбрано
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
                      if (_selectedService != null) // Отображаем, что-то после выбора
                        SizedBox(height: 15,),
                      Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),'Выберите дату'),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CalendarDatePicker2WithActionButtons(
                            config: CalendarDatePicker2WithActionButtonsConfig(
                            ),
                            value: _dates,
                            onValueChanged: (dates) => setState(() {
                              _dates = dates;
                            }),
                          )
                      ),
                    ],

                  ),
                ),
              )
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar()
    );

  }
}

