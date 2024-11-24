import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.name,
    required this.icon,
    this.isActive = false,
  });

  final String name;
  final IconData icon;
  final bool isActive;

  Category copyWith({String? name, IconData? icon, bool? isActive}) => Category(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        isActive: isActive ?? this.isActive,
      );
}

const categories = [
  Category(
    name: '',
    icon: Icons.tune,
  ),
  Category(name: 'All', icon: Icons.local_activity, isActive: true),
  Category(name: 'Sports', icon: Icons.sports_basketball),
  Category(name: 'Food', icon: Icons.restaurant),
  Category(name: 'Kids', icon: Icons.child_care),
  Category(name: 'Creative', icon: Icons.palette),
];
