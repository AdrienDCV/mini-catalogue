import 'package:flutter/material.dart';
import 'package:mobile/models/product_data.dart';

List<ProductData> buildSampleProducts() {
  return [
    ProductData(
      id: 'cafe-arabica',
      name: 'Café Arabica',
      price: 4.50,
      description: 'Grains torréfiés en France, notes de cacao et de noisette.',
      icon: Icons.local_cafe,
    ),
    ProductData(
      id: 'casque-bluetooth',
      name: 'Casque Bluetooth',
      price: 89.90,
      description: 'Réduction de bruit active et 30 heures d\'autonomie.',
      icon: Icons.headphones,
    ),
    ProductData(
      id: 'sneakers-cuir',
      name: 'Sneakers cuir',
      price: 64.00,
      description: 'Baskets minimalistes en cuir véritable, semelle légère.',
      icon: Icons.checkroom,
    ),
    ProductData(
      id: 'livre-poche',
      name: 'Livre de poche',
      price: 9.90,
      description: 'Roman contemporain primé, 320 pages.',
      icon: Icons.menu_book,
    ),
    ProductData(
      id: 'lampe-bureau',
      name: 'Lampe de bureau',
      price: 24.50,
      description: 'Éclairage LED 3 températures, pied orientable.',
      icon: Icons.light,
    ),
    ProductData(
      id: 'montre-minimaliste',
      name: 'Montre minimaliste',
      price: 129.00,
      description: 'Cadran saphir, bracelet en maille milanaise.',
      icon: Icons.watch,
    ),
    ProductData(
      id: 'cactus-pot',
      name: 'Cactus en pot',
      price: 12.00,
      description: 'Plante d\'intérieur facile d\'entretien, pot en terre cuite.',
      icon: Icons.eco,
    ),
    ProductData(
      id: 'enceinte-portable',
      name: 'Enceinte portable',
      price: 59.90,
      description: 'Étanche IPX7, 12 heures de lecture, format poche.',
      icon: Icons.speaker,
    ),
  ];
}