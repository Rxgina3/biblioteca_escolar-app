import 'package:flutter/material.dart';
import 'biblioteca_screen.dart';
import 'favoritos_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Container(

          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade100,
                Colors.yellow.shade100,
              ],
            ),
          ),

          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Icon(
                  Icons.library_books,
                  size: 120,
                  color: Colors.deepOrange,
                ),

                SizedBox(height: 20),

                Text(
                  "Biblioteca Escolar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Administra tus libros",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 50),

                SizedBox(
  width: double.infinity,

  child: ElevatedButton(

    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      padding: EdgeInsets.all(18),
    ),

    onPressed: () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BibliotecaScreen(),
        ),
      );
    },

    child: Text(
      "ENTRAR",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
  ),
),

SizedBox(height: 15),

SizedBox(
  width: double.infinity,

  child: ElevatedButton(

    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.pink,
      padding: EdgeInsets.all(18),
    ),

    onPressed: () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FavoritosScreen(),
        ),
      );
    },

    child: Text(
      "FAVORITOS",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
