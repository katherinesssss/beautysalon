import 'package:beautysalon/provider/cart_provider.dart';
import 'package:beautysalon/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? _currentIndex;
  final _isItemSelected = false;
  final List<String> routes = ['/home', '/services', '/back']; 

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    final groupedItems = cartProvider.groupedItems; // Получаем список товаров

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CART",
            style: TextStyle(
              fontFamily: 'Delius-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex ?? 0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
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
        selectedItemColor: _isItemSelected 
            ? Theme.of(context).colorScheme.onPrimary 
            : Theme.of(context).colorScheme.inversePrimary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Services", icon: Icon(Icons.list_alt)),
          BottomNavigationBarItem(label: "Back", icon: Icon(Icons.arrow_back_ios_new)),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.indigo, Colors.deepPurple, Colors.purple.shade200]
                : [Colors.lightBlueAccent, Colors.cyan, Colors.blueAccent.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Отображение списка товаров
            Expanded(
              child: groupedItems.isEmpty
                  ? Center(
                      child: Text(
                        'Cart is empty...',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 18,
                          fontFamily: 'Delius-Regular',
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: groupedItems.length,
                      itemBuilder: (context, index) {
                        final item = groupedItems.keys.elementAt(index);
                        final quantity = groupedItems[item]!;
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(color:Theme.of(context).colorScheme.surface,),
                          ),
                          subtitle: Text(
                            '\$${item.price}× $quantity = \$${(item.price * quantity).toStringAsFixed(2)}',
                            style: TextStyle(color: Theme.of(context).colorScheme.surface,),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.surface,),
                            onPressed: () {
                              cartProvider.removeFromCart(item);
                            },
                          ),
                        );
                      },
                    ),
            ),
            // total price
            if (groupedItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Delius-Regular'
                  ),
                ),
              ),
          ],
        ),
      ),
    
    );
  }
}
