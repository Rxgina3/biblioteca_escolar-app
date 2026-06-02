import 'package:flutter/material.dart';
import '../data/libros_data.dart';

class BibliotecaScreen extends StatefulWidget {
  @override
  State<BibliotecaScreen> createState() =>
      _BibliotecaScreenState();
}

class _BibliotecaScreenState
    extends State<BibliotecaScreen> {

  TextEditingController buscarController =
      TextEditingController();

  List<Map<String, String>> librosFiltrados =
      [];

  @override
  void initState() {
    super.initState();
    librosFiltrados = List.from(libros);
  }

  void buscarLibro(String texto) {

    setState(() {

      librosFiltrados = libros.where((libro) {

        return libro["titulo"]!
            .toLowerCase()
            .contains(texto.toLowerCase());

      }).toList();
    });
  }

  void mostrarFormulario({
    int? indexEditar,
  }) {

    TextEditingController tituloController =
        TextEditingController();

    TextEditingController autorController =
        TextEditingController();

    TextEditingController categoriaController =
        TextEditingController();

    if (indexEditar != null) {

      tituloController.text =
          libros[indexEditar]["titulo"]!;

      autorController.text =
          libros[indexEditar]["autor"]!;

      categoriaController.text =
          libros[indexEditar]["categoria"]!;
    }

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: Text(
            indexEditar == null
                ? "Agregar Libro"
                : "Editar Libro",
          ),

          content: SingleChildScrollView(

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                TextField(
                  controller:
                      tituloController,
                  decoration:
                      InputDecoration(
                    labelText: "Título",
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller:
                      autorController,
                  decoration:
                      InputDecoration(
                    labelText: "Autor",
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller:
                      categoriaController,
                  decoration:
                      InputDecoration(
                    labelText:
                        "Categoría",
                  ),
                ),
              ],
            ),
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),

            ElevatedButton(

              onPressed: () {

                if (tituloController
                        .text
                        .isEmpty ||
                    autorController
                        .text
                        .isEmpty ||
                    categoriaController
                        .text
                        .isEmpty) {
                  return;
                }

                setState(() {

                  if (indexEditar ==
                      null) {

                    libros.add({

  "titulo":
      tituloController.text,

  "autor":
      autorController.text,

  "categoria":
      categoriaController.text,

  "estado":
      "Disponible",

  "favorito":
      "No",
});
                  } else {

                    libros[indexEditar] = {

  "titulo": tituloController.text,

  "autor": autorController.text,

  "categoria": categoriaController.text,

  "estado":
      libros[indexEditar]["estado"]!,

  "favorito":
      libros[indexEditar]["favorito"]!,
};
                  }

                  librosFiltrados =
                      List.from(libros);
                });

                Navigator.pop(context);
              },

              child: Text(
                indexEditar == null
                    ? "Guardar"
                    : "Actualizar",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Biblioteca Escolar",
        ),
        backgroundColor:
            Colors.deepOrange,
      ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor:
            Colors.green,

        onPressed: () {
          mostrarFormulario();
        },

        child: Icon(Icons.add),
      ),

      body: Padding(
        padding:
            EdgeInsets.all(15),

        child: Column(

          children: [

            Container(

              padding:
                  EdgeInsets.all(12),

              decoration:
                  BoxDecoration(
                color:
                    Colors.orange
                        .shade100,

                borderRadius:
                    BorderRadius
                        .circular(
                            12),
              ),

              child: Column(
  children: [

    Text(
      "📚 Total de libros: ${libros.length}",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    SizedBox(height: 5),

    Text(
      "❤️ Favoritos: ${libros.where((libro) => libro["favorito"] == "Si").length}",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 5),

Text(
  "📖 Prestados: ${libros.where((libro) => libro["estado"] == "Prestado").length}",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),
  ],
),
            ),

            SizedBox(height: 15),

            TextField(

              controller:
                  buscarController,

              decoration:
                  InputDecoration(
                hintText:
                    "Buscar libro...",
                prefixIcon:
                    Icon(Icons.search),
                border:
                    OutlineInputBorder(),
              ),

              onChanged:
                  buscarLibro,
            ),

            SizedBox(height: 15),

            Expanded(

              child:
                  ListView.builder(

                itemCount:
                    librosFiltrados
                        .length,

                itemBuilder:
                    (context,
                        index) {

                  return Card(

                    elevation: 4,

                    child: ListTile(

                      leading: CircleAvatar(
                        backgroundColor:
                            Colors
                                .deepOrange,

                        child: Icon(
                          Icons
                              .menu_book,
                          color: Colors
                              .white,
                        ),
                      ),

                      title: Text(
                        librosFiltrados[
                                index]
                            ["titulo"]!,
                      ),
subtitle: Text(
  "Autor: ${librosFiltrados[index]["autor"]}\n"
  "Categoría: ${librosFiltrados[index]["categoria"]}\n"
  "Estado: ${librosFiltrados[index]["estado"]}",
),

                      trailing: Row(
  mainAxisSize: MainAxisSize.min,

  children: [

    // FAVORITO
    IconButton(
      icon: Icon(
        librosFiltrados[index]["favorito"] == "Si"
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.pink,
      ),

      onPressed: () {

        setState(() {

          int indiceReal =
              libros.indexOf(librosFiltrados[index]);

          libros[indiceReal]["favorito"] =
              libros[indiceReal]["favorito"] == "Si"
                  ? "No"
                  : "Si";

          librosFiltrados = List.from(libros);
        });
      },
    ),

    // PRESTADO
    IconButton(
      icon: Icon(
        Icons.swap_horiz,
        color: Colors.orange,
      ),

      onPressed: () {

        setState(() {

          int indiceReal =
              libros.indexOf(librosFiltrados[index]);

          libros[indiceReal]["estado"] =
              libros[indiceReal]["estado"] ==
                      "Disponible"
                  ? "Prestado"
                  : "Disponible";

          librosFiltrados = List.from(libros);
        });
      },
    ),

    // EDITAR
    IconButton(
      icon: Icon(
        Icons.edit,
        color: Colors.blue,
      ),

      onPressed: () {

        int indiceReal =
            libros.indexOf(librosFiltrados[index]);

        mostrarFormulario(
          indexEditar: indiceReal,
        );
      },
    ),

    // ELIMINAR
    IconButton(
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),

      onPressed: () {

        setState(() {

          libros.remove(
              librosFiltrados[index]);

          librosFiltrados =
              List.from(libros);
        });
      },
    ),
  ],
),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}