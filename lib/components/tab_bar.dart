import 'dart:convert';

import 'package:beautysalon/components/procedure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  late Future<Map<String, List<Procedure>>> _proceduresFuture;

  @override
  void initState() {
    super.initState();
    _proceduresFuture = _loadProcedures();
  }

  Future<Map<String, List<Procedure>>> _loadProcedures() async {
    final jsonString = await rootBundle.loadString('lib/assets/procedure.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final Map<String, List<Procedure>> proceduresByCategory = {};

    jsonData.forEach((category, proceduresJson) {
      proceduresByCategory[category] = (proceduresJson as List)
          .map((item) => Procedure.fromJson(item))
          .toList();
    });

    return proceduresByCategory;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _proceduresFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final proceduresByCategory = snapshot.data!;

        return DefaultTabController(
          length: proceduresByCategory.length,
          child: Column(
            children: [
              TabBar(
                tabs: proceduresByCategory.keys
                    .map((category) => Tab(text: category))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: proceduresByCategory.values.map((procedures) {
                    return ListView.builder(
                      itemCount: procedures.length,
                      itemBuilder: (_, index) => ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            procedures[index].imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(procedures[index].title),
                        subtitle: Text(procedures[index].description),
                        trailing: Text(
                          '\$${procedures[index].price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}