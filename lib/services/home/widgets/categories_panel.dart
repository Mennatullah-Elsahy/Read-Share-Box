import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../handlers/icon_handler.dart';

List<String> categories = ['Account', "Biology", "Business", "Comic", "Crime_Detection", "Fantasy", "Historical"];

class CategoriesPanel extends StatelessWidget {
  const CategoriesPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: MasonryGridView.count(
        // axisDirection: AxisDirection.right,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: categories.length,
        padding: const EdgeInsets.only(left: 24),
        // childAspectRatio: 1/3.5,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(.2)),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                drawSvgIcon(
                  "categories/${categories[index]}",
                  width: 100,
                  height: 100,
                ),
                Positioned(
                  bottom: 11,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(categories[index].replaceAll('_', " "), style: TextStyle(color: Colors.white)),
                  ),
                ),
                // Positioned(
                //   left: -16,
                //   top: -8,
                //   child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
