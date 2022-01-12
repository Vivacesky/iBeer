import 'package:flutter/material.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/view/view.dart';
import 'package:i_beer/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';

class BeerDetailBody extends StatelessWidget {
  const BeerDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DetailViewModel>(context);
    if (vm.exception != null) return BasicErrorBody(object: vm.exception!);

    return NestedScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxScrolled) => [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(vm.beerViewModel.name),
              background: Hero(
                tag: vm.beerViewModel.id,
                child: Image.network(
                  vm.beerViewModel.thumbImageUrl,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  errorBuilder: (c, o, e) {
                    return FlutterLogo(size: MediaQuery.of(context).size.width);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                vm.beerViewModel.name,
                                style: Theme.of(context).textTheme.headline1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (vm.beerViewModel.rating != null) getIcons(vm.beerViewModel.rating!)
                            ],
                          ),
                          const SizedBox(height: 12.0),
                          if (vm.beerViewModel.brewery != null)
                            Text(
                              vm.beerViewModel.brewery!.name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      if (vm.beerViewModel.brewery != null)
                        Text(
                          vm.beerViewModel.brewery!.fullAddress,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        child: Wrap(
                          children: [
                            if (vm.isLoading) const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                            const Text("Rate this beer"),
                          ],
                        ),
                        onPressed: () async {
                          final rating = await showModalBottomSheet<int?>(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.grey,
                                ),
                                height: 200,
                                child: const Rater(),
                              );
                            },
                          );
                          if (rating != null) {
                            vm.rateBeer(rating);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getIcons(int rating) {
    List<Widget> icons = [];
    for (int i = 0; i < rating; i++) {
      icons.add(const Icon(Icons.star, color: Colors.black, size: 16));
    }
    final grayed = 5 - icons.length;
    for (int i = 0; i < grayed; i++) {
      icons.add(const Icon(Icons.star, color: Colors.grey, size: 16));
    }
    return Row(children: icons);
  }
}
