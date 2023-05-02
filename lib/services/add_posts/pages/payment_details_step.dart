import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/models/select_option.dart';
import '../../../base/widgets/fields/location_input_field.dart';
import '../../../base/widgets/fields/text_input_field.dart';
import '../../../config/app_events.dart';
import '../../../config/app_states.dart';
import '../bloc/add_post_bloc.dart';
import '../widgets/single_select_field.dart';

class PaymentDetailsStep extends StatelessWidget {
  const PaymentDetailsStep({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AddPostBloc>(context);
    return BlocBuilder<AddPostBloc, AppStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleSelectField(
                labelText: "Payment Method",
                valueSet: [
                  SelectOption("cash", "Cash"),
                  SelectOption("exchange", "Exchange"),
                  SelectOption("cash & exchange", "Cash & Exchange"),
                ],
                initialValue: bloc.paymentMethod,
                onSelect: (option) {
                  bloc.paymentMethod = option;
                  bloc.paymentMethodValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.paymentMethodValidated,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                keyboardType: TextInputType.phone,
                labelText: "Phone",
                hintText: "Enter phone number",
                initialValue: bloc.phone,
                onChange: (value) {
                  bloc.phone = value;
                  bloc.phoneValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.phoneValidated,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LocationInputField(
                labelText: "Location",
                initialValue: bloc.location,
                onChange: (value) => bloc.location = value,
              ),
            ),
          ],
        );
      },
    );
  }
}
