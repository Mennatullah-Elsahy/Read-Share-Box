import 'package:flutter/material.dart';

import '../../../utilities/theme/media.dart';

class TopOffersPanel extends StatelessWidget {
  const TopOffersPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Image.network(
            "https://th.bing.com/th/id/OIP.kgOPpoY3xk4jvUmm9NH5ZAHaEQ?pid=ImgDet&rs=1",
            height: 176,
            width: MediaHelper.width,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: child,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
