import 'package:flutter/material.dart';

void main() => runApp(BlinkIETApp());

class BlinkIETApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  final TextEditingController rollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blink IET', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                labelText: 'Enter Roll No',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_circle),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Home Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Blink IET',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CategoryButton(
              title: 'Printing Pages',
              icon: Icons.print,
              onTap: () {
                // Navigate to Printing Section
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrintingPage()),
                );
              },
            ),
            CategoryButton(
              title: 'Groceries',
              icon: Icons.shopping_cart,
              onTap: () {
                // Navigate to Groceries Section
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceriesPage()),
                );
              },
            ),
            CategoryButton(
              title: 'Snacks',
              icon: Icons.fastfood,
              onTap: () {
                // Navigate to Snacks Section
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SnacksPage()),
                );
              },
            ),
            // Add more categories as needed
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  CategoryButton(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(title, style: TextStyle(fontSize: 18)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}

// Snacks Page
class SnacksPage extends StatelessWidget {
  final List<String> snacks = ['Chips', 'Kurkure', 'Biscuits', 'Soda'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snacks', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: snacks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(snacks[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Handle Add to Cart
              },
            ),
          );
        },
      ),
    );
  }
}

// Groceries Page
class GroceriesPage extends StatelessWidget {
  final List<String> groceries = ['Rice', 'Sugar', 'Salt', 'Oil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groceries[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Handle Add to Cart
              },
            ),
          );
        },
      ),
    );
  }
}

// Printing Page
class PrintingPage extends StatelessWidget {
  final List<String> printItems = ['A4 Sheets', 'Printouts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Printing Pages',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: printItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(printItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Handle Add to Cart
              },
            ),
          );
        },
      ),
    );
  }
}

// Address Page
class AddressPage extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Address',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Enter Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Payment Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

// Payment Page
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<int>(
              title: Text('Credit/Debit Card'),
              value: 1,
              groupValue: 0,
              onChanged: (value) {},
            ),
            RadioListTile<int>(
              title: Text('UPI'),
              value: 2,
              groupValue: 0,
              onChanged: (value) {},
            ),
            RadioListTile<int>(
              title: Text('Cash on Delivery'),
              value: 3,
              groupValue: 0,
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Proceed with Payment
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
