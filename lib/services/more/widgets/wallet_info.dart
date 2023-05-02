import 'package:flutter/material.dart';
import '../../../handlers/icon_handler.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_btn.dart';
import '../../../utilities/theme/text_styles.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: drawSvgIcon("flaticon_wallet", width: 16, height: 16),
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Text("Points", style: Theme.of(context).textTheme.headline6),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance ", style: AppTextStyles.w500.copyWith(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(" \$ 0", style: AppTextStyles.w600.copyWith(fontSize: 22, color: Color(0xff78AA17))),
                ],
              ),
              Expanded(child: SizedBox()),
              CustomBtn(
                text: "More",
                icon: SizedBox(width: 16, height: 16, child: ArrowBack(reverse: true, color: Colors.white)),
                onTap: () {
                  CustomNavigator.push(Routes.pointsDetails);
                },
                width: 75,
                height: 30,
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
              ),
            ],
          ),
          Divider(height: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
