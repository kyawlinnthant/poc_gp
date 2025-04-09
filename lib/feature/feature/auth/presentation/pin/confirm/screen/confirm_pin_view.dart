import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/feature/feature/auth/presentation/pin/confirm/bloc/confirm_pin_bloc.dart';

import '../../../../../../../core/theme/alpha.dart';
import '../../../../../../../core/theme/dimen.dart';
import '../../../../../../../core/theme/shape.dart';
import '../../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../../ui/prompt/snackbar.dart';
import '../../../../../../ui/state/ui_state.dart';
import '../../ui/pin_back_button.dart';
import '../../ui/pin_number_button.dart';

class ConfirmPinView extends StatelessWidget {
  const ConfirmPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmPinBloc, ConfirmPinState>(
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
          isLoading: false,
          child: Scaffold(
            appBar: AppBar(),
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'confirmPinTitle'.tr(),
                      style: context.textStyles.titleLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'createPinDescription'.tr(),
                      style: context.textStyles.labelMedium,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.paddingStandard,
                    vertical: Dimens.paddingBase4x,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: CircleAvatar(
                            radius: Shapes.medium,
                            backgroundColor:
                                index < state.confirmPin.length
                                    ? context.colors.primary
                                    : context.colors.outline.withValues(
                                      alpha: Alpha.tiny,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Number pad
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.paddingBase4x,
                  ),
                  sliver: SliverGrid.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: Dimens.paddingBase2x,
                    crossAxisSpacing: Dimens.paddingBase2x,
                    childAspectRatio: 1,
                    children: [
                      ...List.generate(
                        9,
                        (i) => PinNumberButton(
                          number: (i + 1).toString(),
                          onPressed: () {
                            context.read<ConfirmPinBloc>().add(
                              OnUpdateConfirmPin(
                                state.confirmPin + (i + 1).toString(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox.shrink(),
                      PinNumberButton(
                        number: '0',
                        onPressed: () {
                          context.read<ConfirmPinBloc>().add(
                            OnUpdateConfirmPin('${state.confirmPin}0'),
                          );
                        },
                      ),
                      PinBackButton(
                        onPressed: () {
                          context.read<ConfirmPinBloc>().add(
                            OnUpdateConfirmPin(
                              state.confirmPin.substring(
                                0,
                                state.confirmPin.length - 1,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
