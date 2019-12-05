import 'package:http/http.dart';
import 'package:online_university/src/models/transactionModel.dart';
import 'package:simple_logger/simple_logger.dart';

class TransactionService {
  Client client = new Client();
  final log = SimpleLogger();

  Future<TransactionModel> getTransaction() async {

  }
}