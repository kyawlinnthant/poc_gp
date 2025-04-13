import 'package:flutter/material.dart';
import 'package:poc/core/theme/extension.dart';

import '../../../core/theme/dimen.dart';
import '../../ui/component/phone_text_field.dart';
import '../../ui/placeholder/modal_loader.dart';
import '../../ui/spacer/vertical_spacer.dart';
import '../../ui/view/orientation.dart';

class OtpRequestView extends StatelessWidget {
  final bool isLoading;
  final String title;
  final String description;
  final Function(String) onPhoneNumberChange;
  final VoidCallback onPrefixClick;
  final String prefix;
  final String phoneError;
  final VoidCallback onActionClick;
  final String actionText;

  const OtpRequestView({
    super.key,
    required this.isLoading,
    required this.title,
    required this.description,
    required this.onPhoneNumberChange,
    required this.prefix,
    required this.phoneError,
    required this.onPrefixClick,
    required this.onActionClick,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return ModalLoaderPlaceholder(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
          child: Center(
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
                        Text(
                          description,
                          style: context.textStyles.labelMedium,
                        ),
                        VerticalSpacer(height: Dimens.paddingBase3x),
                        PhoneTextField(
                          onChanged: (String v) {
                            onPhoneNumberChange(v);
                          },
                          onClickPrefix: onPrefixClick,
                          prefix: prefix,
                          errorMessage: phoneError,
                        ),
                        VerticalSpacer(),
                      ],
                    ),
                  ),
                ),

                SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Dimens.paddingBase2x),
                      child: FilledButton(
                        onPressed: onActionClick,
                        child: Text(actionText),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
