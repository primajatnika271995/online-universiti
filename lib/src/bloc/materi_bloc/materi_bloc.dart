import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_event.dart';
import 'package:online_university/src/bloc/materi_bloc/materi_state.dart';
import 'package:online_university/src/models/materiModel.dart';
import 'package:online_university/src/services/materiService.dart';
import 'package:online_university/src/views/component/log.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  MateriService materiService;
  MateriBloc(this.materiService);

  @override
  // TODO: implement initialState
  MateriState get initialState => MateriIsNotLoaded();

  @override
  Stream<MateriState> mapEventToState(MateriEvent event) async* {
    if (event is FetchMateriCourse) {
      yield MateriIsLoading();

      try {
        List<MateriModel> value = await materiService.getListMateri(event.idCourse);
        yield MateriIsLoaded(value);
      } catch(err) {
        log.warning(err.toString());
       yield MateriIsNotLoaded();
      }
    }
  }
}