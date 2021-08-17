import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';

class SearchPage extends StatefulWidget {
  final String? inPage;

  const SearchPage({@PathParam('inPage') this.inPage});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller ??= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxHeight: kToolbarHeight - 10),
            decoration: BoxDecoration(
                border: Border.all(color: white),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _response(),
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                        hintText: "Search in ${widget.inPage}",
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        enabledBorder: InputBorder.none),
                  ),
                ),
                GestureDetector(
                  onTap: () => _response(),
                  child: Container(
                    child: Icon(Icons.search),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _response() {
    context.router.pop(_controller?.text);
  }
}
