import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zdor_app/models/models.dart';
import 'package:zdor_app/states/planner_state.dart';
import 'package:zdor_app/states/recipe_state.dart';
import 'package:zdor_app/widgets/planner/add_menu.dart';
import 'package:zdor_app/widgets/planner/row_recipe.dart';

class AccordionItemRecipes extends StatelessWidget {
  final WeekDays day;
  final Meals meal;

  const AccordionItemRecipes({
    super.key,
    required this.day,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlannerState>(
      builder: (context, value, child) {
        return Column(
          children: [
            ...value.planner
                .firstWhere((el) {
                  return el.day == day && el.meal == meal;
                })
                .recipes
                .map((elem) {
                  final recipe = RecipeState().recipes.getRecipeById(elem);
                  return RowRecipe(
                    recipe: recipe,
                    onDelete: () {
                      print("Cancellato ricetta n. ${recipe.id}");
                      print("day --> $day - meal --> $meal");
                      value.deleteRecipe(day, meal, int.parse(recipe.id!));
                      print(value.planner);
                    },
                  );
                }),
            AddMenu(day: day, meal: meal)
          ],
        );
      },
    );
  }
}
