import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgloss/blocs/new_releases/new_releases_bloc.dart';
import 'package:libgloss/constants/app_colors.dart';
import 'package:libgloss/constants/app_text_styles.dart';
import 'package:libgloss/utils/app_routes.dart';

void main() {
  runApp(const LibglossApp());
}

class LibglossApp extends StatelessWidget {
  const LibglossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewReleasesBloc>(
          create: (context) => NewReleasesBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          textTheme: const TextTheme(
            titleLarge: AppTextStyles.titleStyle,
            titleMedium: AppTextStyles.subtitleStyle,
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.accentColor)
              .copyWith(background: AppColors.backgroundColor),
        ),
      ),
    );
  }
}
