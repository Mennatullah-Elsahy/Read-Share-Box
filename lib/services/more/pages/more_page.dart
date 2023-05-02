import 'package:flutter/material.dart';
import '../widgets/more_options.dart';
import '../widgets/user_info_card.dart';
import '../widgets/wallet_info.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 24),
            //================================= User Info ==================================
            //==============================================================================
            //==============================================================================
            UserInfoCard(),

            //================================= Wallet Info ================================
            //==============================================================================
            //==============================================================================

            WalletInfo(),

            //================================= More Options ===============================
            //==============================================================================
            //==============================================================================
            MoreOptions(),
          ],
        ),
      ),
    );
  }
}
