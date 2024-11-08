import 'package:flutter/material.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/cekHari.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/convertWaktu.dart';
import 'package:quiz_mobile_sia_124220069_nauval/pages/hitungPiramid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Add HomeScreenContent and ProfileScreen to the pages list
  final List<Widget> _pages = [
    HomeScreenContent(),
    ProfileScreen(),  // Profile page
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 182, 36),
        foregroundColor: Colors.black,
        title: Text('Halaman Utama'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HitungPiramid()),
                );
              },
              child: Text('Fungsi piramid'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConvertWaktu()),
                );
              },
              child: Text('Konversi waktu'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CekHari()),
                );
              },
              child: Text('Cek hari'),
            ),
          ],
        ),
      ),
    );
  }
}

// Create the ProfileScreen widget
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 182, 36),
        foregroundColor: Colors.black,
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/nauval_doge.jpg'),
            SizedBox(height: 16),
            Text('Nama: Nauval Ghaina Mochamad Hanif'),
            Text('NIM: 124220069'),
            Text('Tempat, Tanggal Lahir: Pekanbaru, 13 Juli 2004'),
            Text('Hobi: Bongkar motor'),
          ],
        ),
      ),
    );
  }
}
