import 'package:flutter/material.dart';
import 'package:gomate/screens/page_screen.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel Page")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                TripCard(
                  trip: const {
                    "title": "RedFish Lake",
                    "location": "Idaho",
                    "price": "\$40 /Visit",
                    "rating": "4.5",
                    "image": "https://picsum.photos/200/120?random=1",
                  },
                ),
                TripCard(
                  trip: const {
                    "title": "Mountainous Trip",
                    "location": "Shellsburg",
                    "price": "\$60 /Visit",
                    "rating": "4.5",
                    "image": "https://picsum.photos/200/120?random=2",
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Packages",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                TripCard(
                  trip: const {
                    "title": "King + Duke",
                    "location": "Toronto",
                    "price": "\$120 / 3 day visit",
                    "rating": "4.5",
                    "image": "https://picsum.photos/200/120?random=3",
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TripCard widget for displaying trip info
class TripCard extends StatelessWidget {
  final Map<String, String> trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LakeParkCard()),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                trip["image"]!,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip["title"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(trip["location"]!),
                    Text(trip["price"]!, style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
