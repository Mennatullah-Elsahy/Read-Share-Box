import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({
    super.key,
    required this.cardsLabels,
    required this.sectionTitle,
  });
  final List<String> cardsLabels;
  final String sectionTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sectionTitle),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            cardsLabels.length,
            (index) => Row(
              children: [
                Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      cardsLabels[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
