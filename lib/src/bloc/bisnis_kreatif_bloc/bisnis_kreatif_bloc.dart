import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_event.dart';
import 'package:online_university/src/bloc/bisnis_kreatif_bloc/bisnis_kreatif_state.dart';
import 'package:online_university/src/models/bisnis_kreatif_model.dart';
import 'package:online_university/src/services/bisnis_kreatif_service.dart';
import 'package:online_university/src/views/component/log.dart';

class BisnisKreatifBloc extends Bloc<BisnisKreatifEvent, BisnisKreatifState> {

  BisnisKreatifService bisnisKreatifService;
  BisnisKreatifBloc(this.bisnisKreatifService);

  @override
  // TODO: implement initialState
  BisnisKreatifState get initialState => BisnisKreatifIsNotLoaded();

  @override
  Stream<BisnisKreatifState> mapEventToState(BisnisKreatifEvent event) async* {
    if (event is FetchBisnisKreatif) {
      yield BisnisKreatifIsLoading();

      try {
        List<BisnisKreatifModel> value = await bisnisKreatifService.getListBisnisKreatif(event.category);
        yield BisnisKreatifIsLoaded(value);
      } catch(err) {
        log.warning(err.toString());
        yield BisnisKreatifIsNotLoaded();
      }
    }
  }

}