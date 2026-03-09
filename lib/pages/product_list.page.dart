import 'package:app_mercado_livre/model/product.dart';
import 'package:app_mercado_livre/pages/product_cart.page.dart';
import 'package:app_mercado_livre/widgets/product_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_mercado_livre/stores/cart_instance.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    loadProducts();
  }

  Future<void> loadProducts() async {
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  final List<Product> products = List.generate(15, (index) {
    final double basePrice = 599.99;
    final double price = basePrice * (index + 1);

    return Product(
      id: index,
      name: "Apple Iphone 11 Pro (128gb) - Preto",
      image: "assets/images/iphone.png",
      price: price,
      installment: "em 10x R\$ ${(price / 10).toStringAsFixed(2)} sem juros",
      colors: "Disponível em 6 cores",
      freeShipping: true,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,

        title: Row(
          children: [
            // Campo de busca
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(
                  key: Key("inputSearch"),
                  decoration: InputDecoration(
                    hintText: 'Buscar no Mercado Livre',

                    prefixIcon: Icon(Icons.search),

                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Ícone do carrinho
            Observer(
              builder: (_) {
                final count = cartStore.items.length;

                return Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductCart(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),

                    if (count > 0)
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Text(
                            count.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: Row(
                    children: const [
                      Icon(Icons.pin_drop_outlined),
                      SizedBox(width: 5),
                      Text('Informe o seu CEP'),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // ocupa tudo
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: 0.15,
                        ), // sombra mais visível
                        blurRadius: 6,
                        offset: const Offset(0, 3), // mais pra baixo
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Text("15 resultados", style: TextStyle(fontSize: 14)),
                      Spacer(),
                      Text(
                        "Filtrar (2)",
                        style: TextStyle(
                          color: Colors.blue, // azul igual app
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: products[index],
                        onAdd: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
