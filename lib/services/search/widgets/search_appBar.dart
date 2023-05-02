import 'package:flutter/material.dart';

import '../../../handlers/icon_handler.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
    this.isGrid = false,
    required this.onListTap,
    required this.onFilterTap,
  });
  final bool isGrid;
  final Function() onListTap, onFilterTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(onTap: onFilterTap, child: drawSvgIcon("filter", width: 20, height: 20, iconColor: Theme.of(context).colorScheme.primary)),
          const SizedBox(width: 16),
          GestureDetector(onTap: onListTap, child: drawSvgIcon(!isGrid ? "grid" : "list", width: 20, height: 20, iconColor: Theme.of(context).colorScheme.primary)),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
