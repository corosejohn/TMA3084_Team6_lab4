class Pizza {
  const Pizza({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String description;
  final double price;
  final String image;

  String get priceLabel => 'RM ${price.toStringAsFixed(2)}';
}

const List<Pizza> pizzas = [
  Pizza(
    name: 'Hawaiian Pizza',
    description: 'Sweet pineapple and smoky ham on creamy mozzarella.',
    price: 24.90,
    image: 'assets/images/hawaiian.png',
  ),
  Pizza(
    name: 'Pepperoni Pizza',
    description: 'Crispy-edged pepperoni on our slow-simmered tomato sauce.',
    price: 26.90,
    image: 'assets/images/pepperoni.png',
  ),
  Pizza(
    name: 'Secret Mushroom Pizza',
    description: 'Our house secret: garlic-herb mushrooms and a savoury sauce.',
    price: 27.90,
    image: 'assets/images/secret_mushroom.png',
  ),
  Pizza(
    name: 'Baked Bacon with Cheese',
    description: 'Smoky bacon baked under a golden blanket of melted cheese.',
    price: 28.90,
    image: 'assets/images/baked_bacon_cheese.png',
  ),
  Pizza(
    name: 'Margarita Pizza',
    description: 'The classic: tomato, fresh mozzarella and basil leaves.',
    price: 22.90,
    image: 'assets/images/margarita.png',
  ),
];
