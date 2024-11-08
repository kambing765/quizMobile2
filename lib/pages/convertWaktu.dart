import 'package:flutter/material.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/homeScreen.dart';

class ConvertWaktu extends StatefulWidget {
  @override
  _ConvertWaktuState createState() => _ConvertWaktuState();
}

class _ConvertWaktuState extends State<ConvertWaktu> {
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

  int hour = 0;
  String selectedZone = 'WIB';
  String convertedTime = '';

  // Dropdown options
  final List<String> timeZones = ['WIB', 'WITA', 'WIT'];

  // Function to convert time based on selected input and output zones
  String convertTime(String inputZone, String outputZone, int h) {
    int offset = {
      'WIB': 0,
      'WITA': 1,
      'WIT': 2,
    }[outputZone]! - {
      'WIB': 0,
      'WITA': 1,
      'WIT': 2,
    }[inputZone]!;

    return '${outputZone}: ${(h + offset) % 24}';
  }

  // Function to handle button press for showing converted time
  void showConvertedTime() {
    setState(() {
      convertedTime = timeZones.map((zone) => convertTime(selectedZone, zone, hour)).join('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 182, 36),
        foregroundColor: Colors.black,
        title: Text('Time Conversion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for selecting input time zone
            DropdownButton<String>(
              value: selectedZone,
              items: timeZones.map((zone) {
                return DropdownMenuItem(value: zone, child: Text(zone));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedZone = value!;
                });
              },
            ),
            SizedBox(height: 16),
            
            // Input for hour
            TextField(
              decoration: InputDecoration(labelText: 'Masukkan jam (0-23)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                hour = int.parse(value);
              },
            ),
            SizedBox(height: 16),
            
            // Elevated Button for conversion
            ElevatedButton(
              onPressed: showConvertedTime,
              child: Text('Konversi'),
            ),
            
            // Display converted times
            SizedBox(height: 20),
            Text('Waktu yang terkonversi:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(convertedTime, style: TextStyle(fontSize: 18)),
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
