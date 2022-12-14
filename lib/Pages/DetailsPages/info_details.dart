// Se importa el paquete material.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';
import '../../Models/model_foods.dart';
import '../../Provider/foods_provider_Str.dart';

List mientras = [
  "hora",
  "Noche",
  "Dia",
  "mañana",
  "ven",
  "vamos",
];

//Se crea un stateless con el fin de plasmar la información de la comida seleccionada
class InfoDetails extends StatefulWidget {
  //Creamos una variable que tendrá la información
  final ModelRandomFood food;
  const InfoDetails({
    super.key,
    required this.food,
  });

  @override
  State<InfoDetails> createState() => _InfoDetailsState();
}

class _InfoDetailsState extends State<InfoDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: backgraundApp,
      child: Column(children: [
        Text(
          widget.food.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconText(
              Icons.access_time_outlined,
              primaryColor,
              "${widget.food.time.toString()} Min",
            ),
            _buildIconText(
              Icons.local_fire_department_outlined,
              primaryColor,
              (widget.food.calories.toString().length > 4)
                  ? widget.food.calories.toString().substring(0, 4)
                  : widget.food.calories.toString(),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.maxFinite,
          height: 60,
          color: backgraundApp,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.only(left: 20, right: 18, top: 4),
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.food.cuisineType,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: double.maxFinite,
                  padding: EdgeInsets.only(left: 20, right: 18, top: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.food.category,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          child: Text(
            "Ingredients",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 110,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              width: 2,
                              color: primaryColor,
                              style: BorderStyle.solid),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            widget.food.ingredients[index]["image"],
                            width: 70,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.food.ingredients[index]["name"]),
                    ]),
                  ),
              separatorBuilder: (_, index) => SizedBox(width: 15),
              itemCount: widget.food.ingredients.length),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          child: Text(
            "Recipe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            itemCount: widget.food.recipe.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.radio_button_checked_outlined,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      widget.food.recipe[index],
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 19,
                        wordSpacing: 1.2,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              );
            },
          ),
        ), // Colocar la descripción
        SizedBox(
          height: 48,
        ),
      ]),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            icon,
            color: color,
            size: 25,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 19,
          ),
        )
      ],
    );
  }
}
