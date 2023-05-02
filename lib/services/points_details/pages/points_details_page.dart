import 'package:flutter/material.dart';
import '../../../handlers/icon_handler.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../widgets/transaction_card.dart';

class PointsDetailsPage extends StatelessWidget {
  const PointsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: ArrowBack(),
          ),
        ),
        title: const Text('Your Points', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        titleSpacing: 8,
        elevation: .2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: drawSvgIcon("flaticon_wallet"),
                ),
                const SizedBox(width: 16),
                Text("200", style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.green)),
              ],
            ),
            Divider(
              height: 24,
              thickness: .5,
              color: Theme.of(context).dividerColor,
            ),
            Text("Transactions", style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    12,
                    (index) => const TransactionCard(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
