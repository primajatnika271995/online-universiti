import 'package:bloc/bloc.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_event.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_state.dart';
import 'package:online_university/src/models/transaction_model.dart';
import 'package:online_university/src/services/transaction_service.dart';
import 'package:online_university/src/views/component/log.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {

  TransactionService transactionService;
  TransactionBloc(this.transactionService);

  @override
  // TODO: implement initialState
  TransactionState get initialState => TransactionIsNotLoaded();

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is FetchTransaction) {
      yield TransactionIsLoading();

      try {
        List<TransactionModel> value = await transactionService.getTransaction(event.status);
        yield TransactionIsLoaded(value);
      } catch(err) {
        log.warning(err.toString());
        yield TransactionIsNotLoaded();
      }
    }
  }

}