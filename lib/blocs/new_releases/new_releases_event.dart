part of 'new_releases_bloc.dart';

@immutable
sealed class NewReleasesEvent {}

class NewReleasesLoad extends NewReleasesEvent {}

class NewReleasesLoadMore extends NewReleasesEvent {}

class NewReleasesRefresh extends NewReleasesEvent {}
