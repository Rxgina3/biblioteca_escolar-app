class FavoritosScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> favoritos =
        libros.where(
          (libro) => libro["favorito"] == "Si",
        ).toList();

    return Scaffold(

      appBar: AppBar(
        title: Text("Libros Favoritos"),
        backgroundColor: Colors.pink,
      ),

      body: favoritos.isEmpty

          ? Center(
              child: Text(
                "No hay favoritos",
                style: TextStyle(fontSize: 22),
              ),
            )

          : ListView.builder(

              itemCount: favoritos.length,

              itemBuilder: (context, index) {

                return Card(

                  child: ListTile(

                    leading: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),

                    title: Text(
                      favoritos[index]["titulo"]!,
                    ),

                    subtitle: Text(
                      "Autor: ${favoritos[index]["autor"]}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}