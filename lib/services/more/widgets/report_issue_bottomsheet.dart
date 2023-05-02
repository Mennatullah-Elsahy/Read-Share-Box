import 'package:flutter/material.dart';
import '../../../../routers/navigator.dart';
import '../../../base/widgets/fields/text_descrabtion_input_field.dart';
import '../../../handlers/icon_handler.dart';
import '../../../utilities/components/custom_btn.dart';

class ReportIssueBottomSheet extends StatelessWidget {
  const ReportIssueBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 340,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(.5),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(onTap: () => CustomNavigator.pop(), child: drawSvgIcon("close_circle", iconColor: Theme.of(context).colorScheme.primary)),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Report Issue",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextDescrabtionInputField(
                hintText: "Describe your issue...",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomBtn(
                text: "Submit",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
