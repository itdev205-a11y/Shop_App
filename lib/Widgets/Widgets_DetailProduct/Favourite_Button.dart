import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ModelProduct.dart';
import '../../Providers/Provider_Favourite.dart';

class FavouriteButton extends StatefulWidget {
  final ModelProduct product;

  const FavouriteButton({
    super.key,
    required this.product,
  });

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addFavorite() {
    controller.forward().then((_) {
      controller.reverse();
    });

    context.read<FavouriteProvider>().toggleFavorite(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavouriteProvider>();

    final isFavorite = provider.isFavorite(widget.product);

    return ScaleTransition(
      scale: Tween<double>(
        begin: 1,
        end: 1.3,
      ).animate(controller),
      child: IconButton(
        onPressed: addFavorite,
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}