import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Lakukan sesuatu ketika teks diubah
              },
            ),
          ),
       Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Image.network(
                    'https://picsum.photos/id/14/2500/1667'),
                const SizedBox(height: 10),
                Image.network(
                    'https://picsum.photos/id/16/2500/1667'),
                const SizedBox(height: 10),
                Image.network(
                    'https://picsum.photos/id/29/4000/2670'),
                const SizedBox(height: 10),
                Image.network(
                    'https://picsum.photos/id/27/3264/1836'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}