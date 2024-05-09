import 'package:challenge_meli/ui/widgets/appbar_custom.dart';
import 'package:challenge_meli/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:challenge_meli/domain/entities/items_category_entity.dart';

class ProductDetailPage extends StatelessWidget {
  final Result? product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Obtiene el producto de los argumentos
   Result product = ModalRoute.of(context)!.settings.arguments as Result;


    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Mostrar la imagen del producto con un borde redondeado
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.thumbnail ?? '',
                    fit: BoxFit.cover,
                    height: 300, // Altura de la imagen
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Mostrar el título del producto con un estilo llamativo
              Text(
                product.title ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Mostrar el precio del producto con un color llamativo
              Text(
                Utils.formatPrice(double.parse(product.price.toString())),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              // Mostrar la condición del producto
              Text(
                'Condición: ${product.condition}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              // Mostrar la cantidad disponible del producto
              Text(
                'Disponibilidad: ${product.availableQuantity} unidades',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              // Mostrar información del vendedor si está disponible
              if (product.seller != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vendedor:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'ID del Vendedor: ${product.seller!.id}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Nombre del Vendedor: ${product.seller!.nickname}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}