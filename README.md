# App Mercado Livre - Flutter

Aplicação desenvolvida em **Flutter** que simula uma listagem de produtos semelhante ao aplicativo do Mercado Livre.  
O projeto foi criado como atividade prática para exercitar **componentização, gerenciamento de estado com MobX e construção de interfaces responsivas**.

---

# Funcionalidades

- ✔️ Listagem de produtos  
- ✔️ Simulação de carregamento (Loading)  
- ✔️ Avaliação com estrelas clicáveis  
- ✔️ Adicionar produtos ao carrinho  
- ✔️ Contador de itens no carrinho  
- ✔️ Navegação para tela de carrinho  
- ✔️ Gerenciamento de estado com MobX  

---

# Conceitos praticados

Este projeto foi desenvolvido para praticar conceitos importantes do Flutter:

- Widgets e Componentização  
- StatefulWidget  
- ListView.builder  
- Gerenciamento de estado com MobX  
- Observer  
- Estruturação de pastas  
- Simulação de requisições assíncronas  
- Navegação entre páginas  
- Boas práticas de UI  

---

# Estrutura do Projeto

```text
lib/
│
├── model/
│ └── product.dart
│
├── pages/
│ ├── product_list.page.dart
│ └── product_cart.page.dart
│
├── stores/
│ ├── cart_store.dart
│ └── cart_instance.dart
│
├── widgets/
│ ├── list_empty.widget.dart
│ └── product_card.widget.dart
│
└── main.dart
```

---

# Funcionamento do Carrinho

O carrinho utiliza **MobX** para controle de estado.

Quando um produto é adicionado:

1. O botão **Add carrinho** chama a função no `cartStore`.
2. O item é adicionado à lista observável `items`.
3. O **Observer** detecta a alteração.
4. O contador do carrinho é atualizado automaticamente.

---

# Simulação de Carregamento

Foi implementada uma simulação de carregamento utilizando:

```dart
Future.delayed(Duration(seconds: 3))
```

Durante esse tempo é exibido um CircularProgressIndicator, simulando uma chamada de API.

# Interface

A interface foi inspirada no layout do aplicativo do Mercado Livre, contendo:

- Barra de busca
- Ícone de carrinho com badge
- Lista de produtos
- Informações de preço
- Parcelamento
- Frete grátis
- Avaliação por estrelas

# Tecnologias utilizadas

- Flutter
- Dart
- MobX
- flutter_mobx

# Aprendizado

Este projeto foi desenvolvido com foco em:
- prática de Flutter
- organização de código
- gerenciamento de estado
- construção de interfaces modernas
