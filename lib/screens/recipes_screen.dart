import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipe/bloc/recipe_screen_bloc.dart';
import 'package:flutter_recipe/bloc/recipe_screen_events.dart';
import 'package:flutter_recipe/bloc/recipe_screen_states.dart';
import 'package:flutter_recipe/components/recipe_card.dart';
import 'package:flutter_recipe/models/recipes_model.dart';
import 'package:flutter_recipe/router.dart';

class RecipesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  RecipeScreenBloc _recipeScreenBloc;
  List recipes = List();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _recipeScreenBloc = RecipeScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder(
          bloc: _recipeScreenBloc,
          builder: (context, state) {
            if (state is UninitializedState) {
              _recipeScreenBloc.add(FetchRecipes());
              return Container();
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              var data = RecipesModel.fromJson(jsonDecode(state.response));
              recipes = data.recipes;
              return Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                            initialPage: 0,
                            onPageChanged:
                                (int page, CarouselPageChangedReason reason) {
                              _counter = page;
                            },
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            height: MediaQuery.of(context).size.height - 100),
                        itemCount: recipes.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Container(
                          child: RecipeCard(
                            recipe: recipes[itemIndex],
                          ),
                        ),
                      )),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, -2),
                                blurRadius: 6.0)
                          ]),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, recipeDetailsRoute, arguments: recipes[_counter]);
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.fastfood,
                                      color: Colors.white,
                                    ))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    ));
  }
}