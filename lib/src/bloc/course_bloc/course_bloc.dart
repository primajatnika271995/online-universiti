import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/course_bloc/course_event.dart';
import 'package:online_university/src/bloc/course_bloc/course_state.dart';
import 'package:online_university/src/models/course_details_model.dart';
import 'package:online_university/src/models/course_model.dart';
import 'package:online_university/src/services/course_service.dart';
import 'package:online_university/src/views/component/log.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseService courseService;
  CourseBloc(this.courseService);

  @override
  // TODO: implement initialState
  CourseState get initialState => CourseIsNotLoaded();

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    if (event is FetchCourseByIdMentor) {
      yield CourseIsLoading();

      try {
        List<CourseModel> value = await courseService.getCourseByIdMentor(event.idMentor);
        yield CourseIsLoaded(value);
      } catch (err) {
        log.warning(err.toString());
        yield CourseIsNotLoaded();
      }
    }

    if (event is FetchCourseDetails) {
      yield CourseIsLoading();

      try {
        CourseDetailsModel value = await courseService.getCourseDetailTabs(event.idCourse);
        yield CourseDetailsIsLoaded(value);
      } catch(err) {
        log.warning(err.toString());
        yield CourseIsNotLoaded();
      }
    }

    if (event is FetchCourseOwned) {
      yield CourseIsLoading();

      try {
        List<CourseModel> value = await courseService.getCourseOwned();
        yield CourseIsLoaded(value);
      } catch(err) {
        log.warning(err.toString());
        yield CourseIsNotLoaded();
      }
    }
  }
}