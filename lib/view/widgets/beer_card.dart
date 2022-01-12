import 'package:flutter/material.dart';
import 'package:i_beer/model/model.dart';

class BeerCard extends StatelessWidget {
  final BeerViewModel beerViewModel;
  final VoidCallback onTap;

  const BeerCard({Key? key, required this.beerViewModel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Hero(tag: beerViewModel.id, child: Image.network(beerViewModel.thumbImageUrl))),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beerViewModel.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 4),
                        if (beerViewModel.brewery != null)
                          Text(
                            beerViewModel.brewery!.name,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        const SizedBox(height: 4),
                        if (beerViewModel.rating != null) getIcons(beerViewModel.rating!)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getIcons(int rating) {
    List<Widget> icons = [];
    for (int i = 0; i < rating; i++) {
      icons.add(const Icon(Icons.star, color: Colors.black, size: 16));
    }
    return Row(children: icons);
  }
}
