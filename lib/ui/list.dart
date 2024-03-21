import 'package:flutter/material.dart';

class ShowAllProductsPage extends StatelessWidget {
  const ShowAllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: GridView.count(
        crossAxisCount: 2, 
        mainAxisSpacing: 10, 
        crossAxisSpacing: 10, 
        padding: const EdgeInsets.all(1),
        childAspectRatio: 0.7,
        children: const [
          ProductImage(
            rndSeed: 1,
            nama: "Lukisan 1",
            harga: 1500000,
          ),
          ProductImage(
            rndSeed: 2,
            nama: "Lukisan 2",
            harga: 5000000,
          ),
          ProductImage(
            rndSeed: 3,
            nama: "Lukisan 3",
            harga: 3000000,
          ),
          ProductImage(
            rndSeed: 4,
            nama: "Lukisan 4",
            harga: 2000000,
          ),
          ProductImage(
            rndSeed: 5,
            nama: "Lukisan 5",
            harga: 4000000,
          ),
          ProductImage(
            rndSeed: 6,
            nama: "Lukisan 6",
            harga: 6000000,
          ),
        ].map((widget) => Container(child: widget)).toList(),
      ),
    );
  }
}

class ProductImage extends StatefulWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  const ProductImage({
    super.key,
    this.rndSeed = 1,
    this.nama = "Lukisan",
    this.harga = 0,
  });

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 200, // atur tinggi container sesuai kebutuhan
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage('https://picsum.photos/200/?random=${widget.rndSeed}'),
                  ),
                  const SizedBox(height: 8), // Memberikan jarak vertikal antara gambar dan teks
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nama,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp. ${widget.harga}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}