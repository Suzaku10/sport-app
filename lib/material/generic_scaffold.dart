import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

class GenericScaffold extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const GenericScaffold({Key? key, this.appBar, this.body}) : super(key: key);

  @override
  _GenericScaffoldState createState() => _GenericScaffoldState();
}

class _GenericScaffoldState extends State<GenericScaffold> {
  ScaffoldStore? _store;
  List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _store ??= GetIt.I.get<ScaffoldStore>();
    _disposers.add(_listenMessage);
    super.initState();
  }

  @override
  void dispose() {
    _disposers.forEach((element) => element());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: widget.appBar,
          body: Observer(builder: (_) {
            switch (_store?.state) {
              case ScaffoldMessageState.showMessage:
                return _bodyBuilder;
              case ScaffoldMessageState.initialMessage:
                return widget.body ?? Container();
              default:
                return Container();
            }
          }),
        ));
  }

  Widget get _bodyBuilder {
    return Stack(
      children: [
        if (widget.body != null) widget.body!,
        Positioned(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: kToolbarHeight,
              width: double.infinity,
              alignment: Alignment.center,
              color: blue.withOpacity(0.4),
              child: Text(_store?.message as String),
            ),
          ),
        )
      ],
    );
  }

  ReactionDisposer get _listenMessage {
    return autorun((_) {
      switch (_store?.state) {
        case ScaffoldMessageState.showMessage:
          Future.delayed(Duration(seconds: 2))
              .then((value) => _store?.removeState());
          break;
        case ScaffoldMessageState.initialMessage:
          break;
        default:
          break;
      }
    });
  }
}
