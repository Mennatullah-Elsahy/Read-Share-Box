import 'package:flutter/material.dart';
import 'package:read_share_box/services/more/widgets/report_issue_bottomsheet.dart';

import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import 'more_option.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoreOption(
          icon: "notification",
          title: "Notifications",
          onTap: () => CustomNavigator.push(Routes.notifications),
        ),
        MoreOption(
          icon: "request",
          title: "Your Requests",
          onTap: () => CustomNavigator.push(Routes.myRequests),
        ),
        MoreOption(
          icon: "edit",
          title: "Edit Profile",
          onTap: () {},
        ),
        MoreOption(
          icon: "lock",
          title: "Edit Password",
          onTap: () {},
        ),
        MoreOption(
          icon: "shop",
          title: "Read Share Box Store",
          onTap: () => CustomNavigator.push(Routes.musStore),
        ),
        MoreOption(
          icon: "issue",
          title: "Report an Issue",
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              builder: (context) => const ReportIssueBottomSheet(),
            );
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
        MoreOption(
          icon: "logout",
          title: "Logout",
          isLogout: true,
          onTap: () {},
        ),
      ],
    );
  }
}
