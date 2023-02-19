import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Premium extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const Premium({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  int _selectedIndex = 0;
  bool _monthlySubscription = true;
  bool _yearlySubscription = false;
  void _onItemTappedd(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text("Premium"),
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[500],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[700],
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTappedd,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Choose Your Subscription Plan',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              'Monthly Subscription',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Checkbox(
              value: _monthlySubscription,
              onChanged: (value) {
                setState(() {
                  _monthlySubscription = value!;
                  _yearlySubscription = false;
                });
              },
            ),
            subtitle: Text(
              '\$9.99 per month',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Yearly Subscription',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Checkbox(
              value: _yearlySubscription,
              onChanged: (value) {
                setState(() {
                  _yearlySubscription = value!;
                  _monthlySubscription = false;
                });
              },
            ),
            subtitle: Text(
              '\$99.99 per year',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
            ),
            onPressed: () {
              // TODO: Implement payment gateway.
            },
            child: Text(
              'Subscribe Now',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    ));
  }
}
