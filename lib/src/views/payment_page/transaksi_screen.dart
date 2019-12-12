import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:online_university/src/services/transaction_service.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/views/payment_page/waiting_payment_list_view.dart';

class TransaksiScreen extends StatefulWidget {
  @override
  _TransaksiScreenState createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return true;
  }

  _onNavigationWaitingPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => TransactionBloc(TransactionService()),
          child: WaitingPaymentScreen(
            callback: () {},
            status: "waiting-payment",
            title: "Waiting Payment",
          ),
        ),
      ),
    );
  }

  _onNavigationWaitingConfirmation() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => TransactionBloc(TransactionService()),
          child: WaitingPaymentScreen(
            callback: () {},
            status: "waiting-confirmation",
            title: "Waiting Confirmation",
          ),
        ),
      ),
    );
  }

  _onNavigationPaymentCompleted() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => TransactionBloc(TransactionService()),
          child: WaitingPaymentScreen(
            callback: () {},
            status: "completed",
            title: "Payment Completed",
          ),
        ),
      ),
    );
  }

  _onNavigationPaymentCanceled() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          builder: (context) => TransactionBloc(TransactionService()),
          child: WaitingPaymentScreen(
            callback: () {},
            status: "canceled",
            title: "Payment Canceled",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return SizedBox();
          else
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context, snapshot) {
                        if (!snapshot.hasData)
                          return SizedBox();
                        else
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.grey[200],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  waitingPaymentContent(),
                                  waitingConfirmationContent(),
                                  paymentCompleteContent(),
                                  paymentCanceledContent(),
                                ],
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.black,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                  new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Transaction History",
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget waitingPaymentContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          _onNavigationWaitingPayment();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Waiting for Payment",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget waitingConfirmationContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          _onNavigationWaitingConfirmation();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Waiting for Confirmation",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCompleteContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          _onNavigationPaymentCompleted();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Payment Complete",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCanceledContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          _onNavigationPaymentCanceled();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Payment Canceled",
                style: AppTheme.profileSetting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
