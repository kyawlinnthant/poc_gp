import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/ekyc/presentation/start/bloc/ekyc_start_bloc.dart';
import 'package:poc/feature/ui/spacer/horizontal_spacer.dart';

import '../../../../../../../core/navigation/routes.dart';
import '../../../../../../../core/theme/dimen.dart';
import '../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/spacer/vertical_spacer.dart';
import '../../../../../ui/state/ui_state.dart';
import '../../../../../ui/view/orientation.dart';

class EkycStartView extends StatelessWidget {
  const EkycStartView({super.key});

  @override
  Widget build(BuildContext context) {
    String assetName = 'assets/image/svg/ekyc_start.svg';

    return BlocConsumer<EkycStartBloc, EkycStartState>(
      listenWhen: (previous, current) {
        return previous.uiState != current.uiState;
      },
      listener: (context, state) {
        if (state.uiState is UiError) {
          showSnackBar(
            context: context,
            message: (state.uiState as UiError).message,
          );
        }
        if (state.uiState is UiSuccess) {
          context.pushReplacement(Routes.landing);
        }
      },

      builder: (context, state) {
        return ModalLoaderPlaceholder(
          isLoading: state.uiState is UiLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              actions: [
                if (state.hasData)
                  Padding(
                    padding: EdgeInsets.only(right: Dimens.paddingBase2x),
                    child: TextButton(
                      onPressed: () {
                        context.read<EkycStartBloc>().add(OnResetToLogin());
                      },
                      child: Row(
                        children: [
                          Text(
                            'loginNewAccount'.tr(),
                            style: context.textStyles.labelMedium,
                          ),
                          HorizontalSpacer(),
                          Icon(Icons.close),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.paddingBase3x),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: OrientationView(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: SvgPicture.asset(
                                    assetName,
                                    semanticsLabel: 'EKYC Start',
                                  ),
                                ),
                              ),
                              VerticalSpacer(height: Dimens.paddingBase3x),
                              Text(
                                'ekycStartTitle'.tr(),
                                style: context.textStyles.titleLarge,
                              ),
                              VerticalSpacer(),
                              Text(
                                'ekycStartDescription'.tr(),
                                style: context.textStyles.labelMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SafeArea(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: Dimens.paddingBase2x,
                          ),
                          child: FilledButton(
                            onPressed: () {
                              context.push(Routes.eKycGuide);
                            },
                            child: Text('beginEkyc'.tr()),
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
      },
    );
  }
}
