import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../core/theme/dimen.dart';
import '../../ui/component/pin_text_field.dart';
import '../../ui/placeholder/modal_loader.dart';
import '../../ui/spacer/vertical_spacer.dart';
import '../../ui/view/orientation.dart';
import 'otp_resend/resend_view.dart';

class OtpVerifyView extends StatelessWidget {
  final bool isLoading;
  final String appBarTitle;
  final String title;
  final String description;
  final Function(String) onPinChange;
  final Function(String) onPinComplete;
  final TextEditingController controller;
  final VoidCallback onResent;

  const OtpVerifyView({
    super.key,
    required this.isLoading,
    required this.appBarTitle,
    required this.title,
    required this.description,
    required this.onPinChange,
    required this.onPinComplete,
    required this.controller,
    required this.onResent,
  });

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: OrientationView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacer(),
                      Text(title, style: context.textStyles.titleLarge),
                      VerticalSpacer(),
                      Text(description, style: context.textStyles.labelMedium),
                      VerticalSpacer(height: Dimens.paddingBase3x),
                      PinTextField(
                        onChanged: (String v) {
                          onPinChange(v);
                        },
                        onCompleted: (String otp) {
                          onPinComplete(otp);
                        },
                        controller: controller,
                      ),
                      VerticalSpacer(),
                      ResentView(onResend: onResent),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
