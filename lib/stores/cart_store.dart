import 'package:mobx/mobx.dart';
import '../model/product.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  ObservableList<Product> items = ObservableList<Product>();

  @action
  void add(Product product) {
    if (!items.contains(product)) {
      items.add(product);
    }
  }

  @action
  void remove(Product product) {
    items.remove(product);
  }

  @computed
  int get totalItems => items.length;
}