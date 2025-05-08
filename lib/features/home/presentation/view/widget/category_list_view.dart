import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryItem> categories;

  CategoryListView({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Set a fixed height to fit the items properly
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Make it scroll horizontally
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5), // Space between items
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: categories[index].color.withOpacity(0.2),
                  radius: 30,
                  child: Image.asset(
                    categories[index].iconPath,
                    width: 30,
                    height: 30,
                    color: categories[index].color,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  categories[index].label,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Category Item Model
class CategoryItem {
  final String label;
  final String iconPath;
  final Color color;

  CategoryItem(this.label, this.iconPath, this.color);
}

