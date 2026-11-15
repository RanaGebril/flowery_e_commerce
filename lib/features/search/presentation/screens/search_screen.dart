import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_bloc.dart';
import 'package:flowery_e_commerce/features/search/presentation/widgets/search_body.dart';
import 'package:flowery_e_commerce/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: context.setHeight(70),
          title: const SearchTextField(),
        ),
        body: SearchBody(),
      ),
    );
  }
}
