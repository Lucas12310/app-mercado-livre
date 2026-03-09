import 'package:app_mercado_livre/widgets/list_empty.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_mercado_livre/stores/cart_instance.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(
          key: Key("backBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Carrinho de compras"),
      ),
      body: Observer(
        key: Key("imageCart"),
        builder: (_) {
          if (cartStore.items.isEmpty) {
            return const ListEmpty();
          }

          return ListView.builder(
            itemCount: cartStore.items.length,
            itemBuilder: (context, index) {
              final product = cartStore.items[index];

              return ListTile(
                leading: Image.asset(product.image, width: 50),
                title: Text(product.name),
                subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cartStore.remove(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
