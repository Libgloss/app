import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:libgloss/models/book_card.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
part 'new_releases_event.dart';
part 'new_releases_state.dart';

class NewReleasesBloc extends Bloc<NewReleasesEvent, NewReleasesState> {
  NewReleasesBloc() : super(NewReleasesInitial()) {
    on<NewReleasesLoad>((event, emit) async {
      emit(NewReleasesLoading());
      try {
        final List<BookCard> books = await _fetchBookCards();
        emit(NewReleasesLoaded(books));
      } catch (e) {
        emit(NewReleasesError(e.toString()));
      }
    });
  }
}

Future<List<BookCard>> _fetchBookCards() async {
  try {
    final jsonString = await rootBundle.loadString('lib/data/book_card.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((json) => BookCard.fromJson(json)).toList();
  } catch (error) {
    print('Error loading book cards: $error');
    return []; // or throw an exception if you want to handle errors differently
  }
}
