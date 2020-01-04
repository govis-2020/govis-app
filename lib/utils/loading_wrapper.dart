import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//유니크 로딩 래퍼
typedef AsyncFunction = Future<dynamic> Function();
typedef LoadingBuilder = Widget Function(BuildContext context, bool loading);

class LoadingWrapperController {
  LoadingWrapperState state;
  void loadFuture(AsyncFunction asyncFunc,
      {ValueChanged onCompleted, ValueChanged onError}) {
    if (state == null) {
      throw ("State must be not null!");
    }
    state.loadFuture(asyncFunc, onCompleted: onCompleted, onError: onError);
  }
}

class LoadingWrapper extends StatefulWidget {
  final LoadingBuilder builder;
  final LoadingWrapperController controller;

  final Widget loadingWidget;

  LoadingWrapper(
      {Key key,
      this.loadingWidget,
      @required this.controller,
      @required this.builder})
      : super(key: key);

  @override
  LoadingWrapperState createState() => LoadingWrapperState();
}

class LoadingWrapperState extends State<LoadingWrapper> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    widget.controller.state = this;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.builder(context, loading),
        loading
            ? widget.loadingWidget ??
                Positioned.fill(
                  child: Container(
                    color: Colors.black26,
                    child: Center(
                      child: SpinKitChasingDots(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
            : Container()
      ],
    );
  }

  loadFuture(AsyncFunction asyncFunc,
      {ValueChanged onCompleted, ValueChanged onError}) async {
    if (loading) {
      return;
    }
    if (mounted) {
      setState(() {
        loading = true;
      });
    }

    try {
      var data = await asyncFunc();
      if (onCompleted != null) {
        onCompleted(data);
      }
    } catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        var log = Logger();
        log.e(e);
      }
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
