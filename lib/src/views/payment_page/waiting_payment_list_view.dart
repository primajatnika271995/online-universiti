import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_event.dart';
import 'package:online_university/src/bloc/transaction_bloc/transaction_state.dart';
import 'package:online_university/src/models/transactionModel.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/currencyFormatted.dart';

class WaitingPaymentScreen extends StatefulWidget {
  final Function callback;
  final String title;
  final String status;

  WaitingPaymentScreen({this.callback, this.title, this.status});

  @override
  _WaitingPaymentScreenState createState() => _WaitingPaymentScreenState();
}

class _WaitingPaymentScreenState extends State<WaitingPaymentScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  // TODO: implement context
  BuildContext get context => super.context;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // ignore: close_sinks
    final transactionBloc = BlocProvider.of<TransactionBloc>(context);
    transactionBloc.add(FetchTransaction(widget.status));
    super.didChangeDependencies();
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                appBar(),
                Expanded(
                  child: Container(
                    child: BlocBuilder<TransactionBloc, TransactionState>(
                      builder: (context, state) {
                        if (state is TransactionIsNotLoaded) {
                          return SizedBox();
                        } else if (state is TransactionIsLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 4,
                            ),
                          );
                        } else if (state is TransactionIsLoaded) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.getListTransaction.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var value = state.getListTransaction[index];
                                var count = state.getListTransaction.length > 10
                                    ? 10
                                    : state.getListTransaction.length;
                                var animation = Tween(begin: 0.0, end: 1.0)
                                    .animate(CurvedAnimation(
                                        parent: animationController,
                                        curve: Interval(
                                            (1 / count) * index, 1.0,
                                            curve: Curves.fastOutSlowIn)));
                                animationController.forward();

                                return CategoryView(
                                  animation: animation,
                                  data: value,
                                  animationController: animationController,
                                  callback: () {
                                    widget.callback(value.idCourse);
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Text("s");
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
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
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
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
              widget.title,
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.list,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final TransactionModel data;
  final AnimationController animationController;
  final Animation animation;

  const CategoryView(
      {Key key,
      this.data,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 8, bottom: 10),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  callback();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: <Widget>[
                      imageContent(),
                      descriptionContent(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget imageContent() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data.bannerCourseUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.dark_grey,
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(data.statusName, style: AppTheme.title),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget descriptionContent() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.courseTitle,
                      style: AppTheme.title,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 5, bottom: 5, right: 10),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.mentorProfileUrl),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.mentorName,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              "Jobs : ${data.mentorTitle}",
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.subtitle,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            formattedCoursePrice(data.coursePrice),
                            style: AppTheme.title,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
