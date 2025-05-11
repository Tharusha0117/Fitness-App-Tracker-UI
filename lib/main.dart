import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App Daily Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: FitnessTrackerScreen(),
    );
  }
}

class FitnessTrackerScreen extends StatefulWidget {
  @override
  _FitnessTrackerScreenState createState() => _FitnessTrackerScreenState();
}

class _FitnessTrackerScreenState extends State<FitnessTrackerScreen> {
  // Dummy Data
  double steps = 7000; // Total Steps
  double maxSteps = 10000; // Max Steps goal
  double calories = 1500; // Total Calories
  double maxCalories = 2500; // Max Calories goal
  double sleep = 6.5; // Hours of sleep
  double maxSleep = 8.0; // Max Sleep goal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness Tracker"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // To make the app bar transparent
      body: Stack(
        children: [
          // Animated Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple, Colors.pink],
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(seconds: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.deepPurpleAccent],
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats Header (Motivational)
                Text(
                  "Keep Pushing!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(color: Colors.black54, offset: Offset(3, 3), blurRadius: 5)
                    ],
                  ),
                ).animate().fadeIn().move(duration: 1.seconds, curve: Curves.easeOut),
                SizedBox(height: 10),
                Text(
                  "You're doing great, let's hit those goals!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.7),
                    shadows: [
                      BoxShadow(color: Colors.black54, offset: Offset(3, 3), blurRadius: 5)
                    ],
                  ),
                ).animate().fadeIn().move(duration: 1.seconds, curve: Curves.easeOut),
                SizedBox(height: 30),
                // Circular Progress Bars (Steps, Calories, Sleep)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircularProgressBar("Steps", steps, maxSteps),
                    _buildCircularProgressBar("Calories", calories, maxCalories),
                    _buildCircularProgressBar("Sleep", sleep, maxSleep),
                  ],
                ),
                SizedBox(height: 30),
                // Card Grid for Data
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildCard("Steps", "$steps/$maxSteps", Icons.directions_walk),
                      _buildCard("Calories", "$calories/$maxCalories", Icons.local_fire_department),
                      _buildCard("Sleep", "$sleep/$maxSleep hours", Icons.bed),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Circular Progress Bar with Animation
  Widget _buildCircularProgressBar(String label, double value, double maxValue) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value / maxValue,
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.white.withOpacity(0.3),
          ),
          Text(
            "${(value / maxValue * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                BoxShadow(color: Colors.black54, offset: Offset(3, 3), blurRadius: 5)
              ],
            ),
          ).animate().fadeIn(),
        ],
      ),
    );
  }

  // Enhanced Card with Neumorphism, Shadow Effects, and Animation
  Widget _buildCard(String title, String value, IconData icon) {
    return GestureDetector(
      onTap: () {
        // You can handle tap here, like navigating to a detailed page
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(4, 4),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(-4, -4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ).animate().fadeIn().slideY(duration: 1.seconds, curve: Curves.easeOut),
    );
  }
}
