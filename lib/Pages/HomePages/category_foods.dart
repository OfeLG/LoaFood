// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:loafood/constants.dart';

//Se usará un estateles ya que solo se mostrarán las categorias
class Category_Foods extends StatelessWidget {
  const Category_Foods({
    //Se indica que datos se desean mostrar
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback
      press; //Con el fin de mantener un flujo continuo de datos, se define la función (VoidCallback) que se supone que debe activarse como una devolución de llamada cuando ocurre un evento específico.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Se utiliza un GestureDetector y en el opTap para devolver un valor en caso de que se seleccione el contendor de la categoria
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Card(
            color: primaryColor,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
