import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgloss/blocs/new_releases/new_releases_bloc.dart';
import 'package:libgloss/constants/app_text_styles.dart';
import 'package:libgloss/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewReleasesBloc>(context).add(NewReleasesLoad());
    return Scaffold(
        appBar: AppBar(
          title: const Text('For You', style: AppTextStyles.titleStyle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text('New Releases',
                      style: AppTextStyles.subtitleStyle)),
              const Divider(),
              SizedBox(
                height: 275,
                width: double.infinity,
                child: _newReleases(),
              ),
              const Divider(),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Best Sellers',
                      style: AppTextStyles.subtitleStyle)),
              SizedBox(
                height: 275,
                width: double.infinity,
                child: _newReleases(),
              ),
              const Divider(),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Recommended for You',
                      style: AppTextStyles.subtitleStyle)),
              SizedBox(
                height: 275,
                width: double.infinity,
                child: _newReleases(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {
            print('index: $index');
          },
        ));
  }

  Widget _newReleases() {
    return BlocBuilder<NewReleasesBloc, NewReleasesState>(
      builder: (context, state) {
        print('state: $state');
        if (state is NewReleasesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewReleasesLoaded) {
          return SizedBox(
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 125,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 175,
                          width: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              state.books[index].coverImagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(state.books[index].title,
                              style: AppTextStyles.bodyStyleBold),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(state.books[index].author,
                              style: AppTextStyles.bodyStyle),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewReleasesError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
