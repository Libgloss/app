part of 'new_releases_bloc.dart';

@immutable
sealed class NewReleasesState {}

final class NewReleasesInitial extends NewReleasesState {}

final class NewReleasesLoading extends NewReleasesState {}

final class NewReleasesLoaded extends NewReleasesState {
  final List<BookCard> books;

  NewReleasesLoaded(this.books);
}

final class NewReleasesError extends NewReleasesState {
  final String message;

  NewReleasesError(this.message);

  String get error => message;
}
