import 'package:beautysalon/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? _currentIndex;
  final _isItemSelected = false;
  final List<String> routes = ['/home', '/services', '/back'];  // Теперь 3 элемента

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("SETTINGS",
            style: TextStyle(
              fontFamily: 'Delius-Regular'
            ),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex ?? 0,
        // и передается обязательно(index==currentIndex) - selectedItemColor
    onTap: (index) {
      setState(() {
      _currentIndex = index;  // Обновляем индекс только для Home/Services
      });
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/services');
          break;
        case 2:
          Navigator.pushNamed(context, '/home');
      }

        },
        selectedItemColor: _isItemSelected ? Colors.grey : Colors.white,
        unselectedItemColor: Colors.white,

        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
          BottomNavigationBarItem(label: "Back", icon: Icon(Icons.arrow_back_ios_new))
        ],
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25,top: 10,right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode
                Text("Dark Mode",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontFamily: 'Delius-Regular'
                ),
                ),

                //switch
                CupertinoSwitch(
                  value: context.watch<ThemeProvider>().isDarkMode,
                  onChanged: (value) => context.read<ThemeProvider>().toggleTheme(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
