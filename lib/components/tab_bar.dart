import 'package:beautysalon/components/procedure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: proceduresByCategory.length,
        child: Column(
          children: [
            TabBar(
              tabs: proceduresByCategory.keys.map((category)=>Tab(text: category)).toList(),
            ),
            Expanded(
                child: TabBarView(
                    children: proceduresByCategory.values.map((procedures){
                      return ListView.builder(
                          itemCount: procedures.length,
                          itemBuilder: (_,index)=>ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12), // Уровень скругления
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
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                      );
                    }).toList()
                ),
            ),
          ],
        )
    );
  }
}
