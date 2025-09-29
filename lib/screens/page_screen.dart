import 'package:flutter/material.dart';

class LakeParkCard extends StatelessWidget {
  const LakeParkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Image Section ----------
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Row(
                        children: [
                          _smallPreview("https://picsum.photos/60/60?1"),
                          const SizedBox(width: 6),
                          _smallPreview("https://picsum.photos/60/60?2"),
                          const SizedBox(width: 6),
                          _smallPreview("https://picsum.photos/60/60?3"),
                          const SizedBox(width: 6),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "+8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
      
              // ---------- Title + Rating ----------
              Row(
                children: const [
                  Text(
                    "Lake Park",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4),
                  Text("4.5"),
                ],
              ),
              const SizedBox(height: 8),
      
              // ---------- Location ----------
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.grey, size: 18),
                  SizedBox(width: 4),
                  Text("Idaho"),
                ],
              ),
              const SizedBox(height: 16),
      
              // ---------- Description ----------
              const Text(
                "What is Redfish Lake known for?\n"
                "Redfish Lake is the final stop on the longest Pacific salmon run in North America, which requires long-distance swimmers, such as Sockeye and Chinook Salmon, to travel over 900 miles upstream to return to their spawning grounds.\n"
                "Redfish Lake is an alpine lake in Custer County, Idaho, just south of Stanley. It is the largest lake within the Sawtooth National Recreation Area.",
                style: TextStyle(height: 1.4),
              ),
              const SizedBox(height: 20),
      
              // ---------- Travel Button ----------
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Travel Now | \$40",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Small Preview Helper ----------
  Widget _smallPreview(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, width: 40, height: 40, fit: BoxFit.cover),
    );
  }
}
