import 'package:flutter/material.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/homeScreen.dart';

class HitungPiramid extends StatefulWidget {
  @override
  _HitungPiramidState createState() => _HitungPiramidState();
}

class _HitungPiramidState extends State<HitungPiramid> {
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
  double baseLength = 0;
  double baseWidth = 0;
  double height = 0;
  double volume = 0;
  double keliling = 0;

  void hitungVolume() {
    setState(() {
      volume = (1 / 3) * baseLength * baseWidth * height;
    });
  }

  void hitungKeliling() {
    setState(() {
      keliling = 2 * baseLength + 2 * baseWidth; // assuming a square base
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 182, 36),
        foregroundColor: Colors.black,
        title: Text('Hitungan piramid')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Panjang'),
              onChanged: (value) => baseLength = double.parse(value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Lebar'),
              onChanged: (value) => baseWidth = double.parse(value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tinggi'),
              onChanged: (value) => height = double.parse(value),
            ),
            ElevatedButton(
              onPressed: hitungVolume,
              child: Text('Hitung volume'),
            ),
            Text('Volume: $volume'),
            ElevatedButton(
              onPressed: hitungKeliling,
              child: Text('Hitung keliling'),
            ),
            Text('Keliling alas: $keliling'),
          ],
        ),
        )
        
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
