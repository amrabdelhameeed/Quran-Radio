part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class QuranLoaded extends QuranState {
 final List<RadioModel> allreciters;

  QuranLoaded(this.allreciters);
}
class UpdateButtonState extends QuranState{}