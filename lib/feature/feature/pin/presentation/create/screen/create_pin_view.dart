import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/core/theme/alpha.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/core/theme/shape.dart';

import '../../../../../ui/placeholder/modal_loader.dart';
import '../../../../../ui/prompt/snackbar.dart';
import '../../../../../ui/state/ui_state.dart';
import '../../ui/pin_back_button.dart';
import '../../ui/pin_number_button.dart';
import '../bloc/create_pin_bloc.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePinBloc, CreatePinState>(
      listenWhen: (previous, current) {
        return previous.uiState != current.uiState;
      },
      listener: (context, state) {
        if (state.uiState is UiError) {
          showSnackBar(
            context: context,
            message: (state.uiState as UiError).message,
          );
          context.read<CreatePinBloc>().add(OnResetUiStateCreatePin());
        }
        if (state.uiState is UiSuccess) {
          context.push(Routes.confirmPin, extra: state.pin);
          context.read<CreatePinBloc>().add(OnResetCreatePin());
        }
      },
      builder: (context, state) {
        return ModalLoaderPlaceholder(
          isLoading: state.uiState is UiLoading,
          child: Scaffold(
            appBar: AppBar(),
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'createPinTitle'.tr(),
                      style: context.textStyles.displaySmall,
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
                                index < state.pin.length
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
                            context.read<CreatePinBloc>().add(
                              OnUpdatePin(
                                state.pin.trim() + (i + 1).toString(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox.shrink(),
                      PinNumberButton(
                        number: '0',
                        onPressed: () {
                          context.read<CreatePinBloc>().add(
                            OnUpdatePin('${state.pin.trim()}0'),
                          );
                        },
                      ),
                      PinBackButton(
                        onPressed: () {
                          if (state.pin.trim().isNotEmpty) {
                            context.read<CreatePinBloc>().add(
                              OnUpdatePin(
                                state.pin.trim().substring(
                                  0,
                                  state.pin.trim().length - 1,
                                ),
                              ),
                            );
                          }
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
