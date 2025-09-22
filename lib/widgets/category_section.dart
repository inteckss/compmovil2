import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<CategoryItem> items;
  final Color backgroundColor;

  const CategorySection({
    super.key,
    required this.title,
    required this.items,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) => _buildCategoryItem(items[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(CategoryItem item) {
    return Card(
      child: InkWell(
        onTap: item.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(item.icon, size: 24.0, color: Colors.blue),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(fontSize: 12.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}