import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/view/view.dart';
import 'package:i_beer/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    if (vm.exception != null) return BasicErrorBody(object: vm.exception!);
    if (vm.isLoading) return const Center(child: CircularProgressIndicator());
    if (vm.beers != null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search beers',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  ElevatedButton(
                    onPressed: () {
                      vm.setRated(!vm.onlyRated);
                    },
                    child: Icon(
                      Icons.verified,
                      color: vm.onlyRated ? Colors.yellow : Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: vm.onlyRated ? Colors.yellow.withOpacity(0.1) : Colors.white,
                      fixedSize: const Size(50, 50),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Found",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                "${vm.meta?.totalCount} Results",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ...vm.row1!
                        .map(
                          (b) => BeerCard(
                            beerViewModel: b,
                            onTap: () {},
                          ),
                        )
                        .toList()
                  ],
                ),
                Column(
                  children: vm.row2!
                      .map(
                        (b) => BeerCard(
                          beerViewModel: b,
                          onTap: () {},
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
