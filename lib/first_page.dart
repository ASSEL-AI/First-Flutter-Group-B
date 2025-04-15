import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<String> interests = [
    "Travel & Adventures",
    "Music",
    "Art",
    "Food & Drink",
    "Home & Lifestyle",
    "Other",
  ];

  final Map<String, String> images = {
    "Travel & Adventures": "images/travel.png",
    "Music": "images/music.png",
    "Art": "images/art.png",
    "Food & Drink": "images/food.png",
    "Home & Lifestyle": "images/home.png",
    "Other": "images/other.png"
  };

  final List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        if (selectedInterests.length < 3) {
          selectedInterests.add(interest);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You can only select 3 interests!')),
          );
        }
      }
    });
  }

  bool isSelected(String interest) {
    return selectedInterests.contains(interest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Select Your 3 Interests',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Later you can add more in your account :)',
            style: TextStyle(color: Color.fromARGB(255, 199, 21, 21)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                children: interests.map((interest) {
                  return GestureDetector(
                    onTap: () => toggleInterest(interest),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected(interest)
                            ? const Color.fromARGB(255, 92, 113, 233)
                            : const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(255, 103, 103, 202),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            images[interest]!,
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            interest,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedInterests.length == 3
                    ? const Color.fromARGB(255, 93, 113, 233)
                    : Colors.grey,
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: selectedInterests.length == 3
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CountryPage()),
                      );
                    }
                  : null,
              child: const Text(
                'CONTINUE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
