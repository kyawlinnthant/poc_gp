import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/feature/feature/ekyc/presentation/start/bloc/ekyc_start_bloc.dart';
import 'package:poc/feature/feature/ekyc/presentation/start/screen/ekyc_start_view.dart';

import '../../../../../../core/di/di.dart';

class EkycStartScreen extends StatelessWidget {
  const EkycStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EkycStartBloc>()..add(OnGetEkycStatus()),
      child: const EkycStartView(),
    );
  }
}
