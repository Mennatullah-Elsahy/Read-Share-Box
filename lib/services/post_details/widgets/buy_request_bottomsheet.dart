import 'package:flutter/material.dart';
import '../../../../routers/navigator.dart';
import '../../../base/widgets/fields/text_input_field.dart';
import '../../../handlers/icon_handler.dart';
import '../../../utilities/components/custom_btn.dart';

class BuyRequestBottomSheet extends StatelessWidget {
  const BuyRequestBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 220,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(onTap: () => CustomNavigator.pop(), child: drawSvgIcon("close_circle", iconColor: Theme.of(context).colorScheme.primary)),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Confirm your request",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                hintText: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomBtn(
                text: "Send Request",
                onTap: () {
                  CustomNavigator.pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
