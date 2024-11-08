import 'package:flutter/material.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/homeScreen.dart'; // Import HomeScreen file

class CekHari extends StatefulWidget {
  @override
  _CekHariState createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });    
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  int? dayNumber; 
  String dayName = 'Belum dipilih'; // Default 

  final List<String> daysOfWeek = [
    'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
  ];

  
  void updateDayName() {
    setState(() {
      if (dayNumber != null && dayNumber! >= 1 && dayNumber! <= 7) {
        dayName = daysOfWeek[dayNumber! - 1];
      } else {
        dayName = 'Pilih angka 1-7';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 182, 36),
        foregroundColor: Colors.black,
        title: Text('Day Check'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              decoration: InputDecoration(labelText: 'Enter number (1-7)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  dayNumber = int.tryParse(value);
                } else {
                  dayNumber = null; 
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: updateDayName,
              child: Text('Cek'),
            ),
            SizedBox(height: 16),
            // Display selected day
            Text('Hari yang dipilih: $dayName'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
