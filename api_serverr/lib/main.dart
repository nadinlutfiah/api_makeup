import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

// Fungsi utama
void main() async {
  // Membuat router
  final router = Router();

  // Mendefinisikan route API
  router.get('/products', (Request request) {
    final products = [
      {'id': 1, 'name': 'Nike Air VaporMax Evo', 'price': 120000},
      {'id': 2, 'name': 'Adidas UltraBoost', 'price': 140000},
    ];
    return Response.ok(
      jsonEncode(products),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // Jalankan server
  final server = await shelf_io.serve(router, 'localhost', 8080);
  print('Server running on http://localhost:${server.port}');
}
