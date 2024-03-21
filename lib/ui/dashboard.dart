import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Expanded(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Image(
                              image: NetworkImage('https://picsum.photos/id/60/400')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Best Seller',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/list');
                              },
                              child: const Text(
                                'Show All',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ListProducts(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Arrivals',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Image(
                                  image: NetworkImage('https://picsum.photos/id/61/400')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            // Navigate to home page
            // Misalnya, jika home page adalah Dashboard, maka cukup kembali ke halaman ini
            Navigator.popUntil(context, ModalRoute.withName('/'));
          } else if (index == 1) {
            // Navigate to search page
            // Misalnya, jika halaman pencarian memiliki nama route '/search'
            Navigator.pushNamed(context, '/search');
          }
        },
      ),
    );
  }
}



class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ProductImage(),
          ProductImage(
            rndSeed: 2,
            nama: "lukisan 2",
            harga: 5000000,
          ),
          ProductImage(
            rndSeed: 3,
            nama: "lukisan 3",
            harga: 3000000,
          )
        ]),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage(
      {super.key,
      this.rndSeed = 1,
      this.nama = "lukisan 1",
      this.harga = 1500000});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
              image:
                  NetworkImage('https://picsum.photos/200/?random=$rndSeed')),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(nama), Text("Rp. $harga")])
        ],
      ),
    );
  }
}
