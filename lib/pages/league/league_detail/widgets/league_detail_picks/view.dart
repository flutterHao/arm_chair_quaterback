import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LeagueDetailPicksPage extends StatefulWidget {
  const LeagueDetailPicksPage({super.key});

  @override
  State<LeagueDetailPicksPage> createState() => _LeagueDetailPicksPageState();
}

class _LeagueDetailPicksPageState extends State<LeagueDetailPicksPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _LeagueDetailPicksViewGetX();
  }
}

class _LeagueDetailPicksViewGetX extends GetView<LeagueDetailPicksController> {
  const _LeagueDetailPicksViewGetX({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueDetailPicksController>(
      init: LeagueDetailPicksController(),
      id: "league_detail_picks",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("league_detail_picks")),
          body: SafeArea(
            child: Container(),
          ),
        );
      },
    );
  }
}
