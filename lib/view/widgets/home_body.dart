import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/view/view.dart';
import 'package:i_beer/view/widgets/search_beer.dart';
import 'package:i_beer/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    if (vm.exception != null) return BasicErrorBody(object: vm.exception!);
    if (vm.isLoading) return const Center(child: CircularProgressIndicator());
    late Widget child;
    if (vm.listStyle == ListStyle.grid) {
      child = Row(
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
                          "${vm.beers.length} Results",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ...vm.row1
                  .map(
                    (b) => BeerCard(
                      beerViewModel: b,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeerDetailScreen(beerViewModel: b),
                          ),
                        );
                      },
                    ),
                  )
                  .toList()
            ],
          ),
          Column(
            children: vm.row2
                .map(
                  (b) => BeerCard(
                    beerViewModel: b,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BeerDetailScreen(beerViewModel: b),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ],
      );
    } else if (vm.listStyle == ListStyle.list) {
      child = Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: vm.beers
              .map(
                (b) => ListTile(
                  title: Text(b.name),
                  subtitle: Text(b.brewery?.name ?? "-"),
                  leading: Hero(
                    tag: b.id,
                    child: Image.network(
                      b.thumbImageUrl,
                      errorBuilder: (c, o, e) {
                        return const FlutterLogo(size: 50);
                      },
                    ),
                  ),
                  trailing: Text(b.rating != null ? "${b.rating}/5" : "-"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BeerDetailScreen(beerViewModel: b),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ).toList(),
      );
    } else {
      child = const SizedBox();
    }
    return RefreshIndicator(
      onRefresh: () async {
        vm.refreshBeers();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 3, child: vm.isRefreshing ? const LinearProgressIndicator() : const SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SearchBeer(
                      onChanged: (newValue) {
                        vm.searchBeers(newValue);
                      },
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
            const SizedBox(height: 12.0),
            child,
          ],
        ),
      ),
    );
  }
}
