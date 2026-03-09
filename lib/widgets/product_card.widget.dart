import 'package:app_mercado_livre/model/product.dart';
import 'package:flutter/material.dart';
import 'package:app_mercado_livre/stores/cart_instance.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onAdd;
  const ProductCard({super.key, required this.product, required this.onAdd});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key("productItem"),
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGEM
            Container(
              width: 140,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  key: Key("productImage"),
                  widget.product.image,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 10),

            // TEXTOS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TÍTULO
                  Text(
                    widget.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 5),

                  // PREÇO
                  Text(
                    "R\$ ${widget.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 3),

                  // PARCELAS
                  Text(
                    widget.product.installment,
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),

                  const SizedBox(height: 3),

                  // FRETE
                  if (widget.product.freeShipping)
                    const Text(
                      "Frete grátis",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  const SizedBox(height: 3),

                  // CORES
                  Text(
                    widget.product.colors,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  const SizedBox(height: 6),

                  // AVALIAÇÃO
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      final starIndex = index + 1;

                      return GestureDetector(
                        onTap: () {
                          widget.product.rating = starIndex;
                          (context as Element).markNeedsBuild();
                        },
                        child: Icon(
                          starIndex <= widget.product.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.blue,
                          size: 18,
                        ),
                      );
                    }),
                  ),

                  // BOTÃO
                  Align(
                    key: Key("addProductToCart"),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        final alreadyInCart = cartStore.items.any(
                          (p) => p.id == widget.product.id,
                        );

                        if (alreadyInCart) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Produto já está no carrinho"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          cartStore.add(widget.product);
                          widget.onAdd();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Produto adicionado ao carrinho"),
                              backgroundColor: Colors.amber,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Add carrinho",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
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
    );
  }
}
