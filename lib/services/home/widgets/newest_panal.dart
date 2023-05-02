import 'package:flutter/material.dart';

import '../../../utilities/theme/media.dart';
import '../../../utilities/theme/text_styles.dart';

class NewerBooksPanel extends StatelessWidget {
  const NewerBooksPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MediaHelper.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 24),
            ...List.generate(
              5,
              (index) => Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "image",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network("https://th.bing.com/th/id/R.f130ff77f75101067d9cc5818e307ca7?rik=Fw6L%2bImNwU%2bSaw&riu=http%3a%2f%2ftesseraguild.com%2fwp-content%2fuploads%2f2018%2f06%2fHobbit.jpg&ehk=0xpERpQ3Zvv7CZHZts86OPPva7nqdaM33H9h%2b932pG0%3d&risl=&pid=ImgRaw&r=0", height: 192, width: 131, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Book Name",
                        style: AppTextStyles.w600.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Author",
                        style: AppTextStyles.w500.copyWith(fontSize: 12, color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
