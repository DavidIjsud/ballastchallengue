import 'package:pokemonballastlane/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokemonballastlane/features/searchlist/data/data_sources/data_source_search_list_impl.dart';
import 'package:pokemonballastlane/features/searchlist/data/repository/repository_search_list_impl.dart';
import 'package:pokemonballastlane/features/searchlist/domain/usecases/search_list_case_impl.dart';
import 'package:pokemonballastlane/features/searchlist/domain/usecases/visited_products_impl.dart';
import 'package:pokemonballastlane/features/searchlist/presentation/blocs/bloc_detail_product/detail_product_bloc.dart';
import 'package:pokemonballastlane/features/searchlist/presentation/blocs/bloc_search_list/searchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonballastlane/features/splash/presentation/splash.dart';
import 'package:pokemonballastlane/shared/preferences/preferences.dart';
import 'package:provider/provider.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchListCaseImpl searchListCaseImpl = SearchListCaseImpl(
        repository:
            RepositorySearchListImpl(dataSource: SearchSourceListImpl()));

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(
              create: (_) => DetailProductBloc(
                  searchListCase: searchListCaseImpl,
                  visitedProductsCase: VisitedProductsImpl())),
          BlocProvider(
              create: (_) =>
                  SearchlistBloc(searchListCase: searchListCaseImpl)),
        ],
        child: Provider(
          create: (_) => Preferences(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          ),
        ));
  }
}
