import 'package:question_2/state/redux/reducers.dart';
import 'package:redux/redux.dart';

final store = Store<int>(
  counterReducer,
  initialState: 0,
);