cnx = new Mongo("localhost");
db = cnx.getDB('Optica');
db.dropDatabase();

db.Clients.insertMany(
    [{
        "_id": ObjectId("602af9d0026e251dc92d82d7"),
        "Nom": "Carlos",
        "Telefon": "696665636",
        "Email": "Carlos@gmail.com",
        "Data_Registre": {
          "$date": "2020-01-01T23:00:00Z"
        },
        "Adreça": {
          "Carrer": "Corsega",
          "Numero": 23,
          "CP": "08036",
          "Ciutat": "Barcelona",
          "Pais": "España"
        },
        "Recomanat": null,
      },{
        "_id": ObjectId("602af9d0026e251dc92d82d8"),
        "Nom": "Joan",
        "Telefon": "655696321",
        "Email": "Joan@gmail.com",
        "Data_Registre": {
          "$date": "2020-01-21T23:00:00Z"
        },
        "Adreça": {
          "Carrer": "Venus",
          "Numero": 13,
          "CP": "08036",
          "Ciutat": "Barcelona",
          "Pais": "España"
        },
        "Recomanat": ObjectId("602af9d0026e251dc92d82d7"),
        }
      ]
)


db.Empleats.insertMany(
  [
    {
      "_id": ObjectId("602afe81026e251dc92d82d9"),
      "Nom": "Joan",
      "Cognom": "Perez",
    },{
      "_id": ObjectId("602afe81026e251dc92d72d8"),
      "Nom": "Monica",
      "Cognom": "Lopez",
    }
  ]
)

db.Proveidor.insertMany(
  [
    {
      "_id": ObjectId("602aeb3c026e251dc92d82cc"),
      "Nom": "Pro glasses",
      "Telefon": 652358565,
      "Fax": 652358566,
      "Nif": "B589632",
      "Adreça": {
          "Carrer": "Av.Diagonal",
          "Numero": 363,
          "CP": "08037",
          "Ciutat": "Barcelona",
          "Pais": "España",
      }
    },
    {
        "_id": ObjectId("602af611026e251dc92d82d4"),
        "Nom": "Natural glasses",
        "Telefon": 654257844,
        "Fax": 654257844,
        "Nif": "B564655",
        "Adreça": {
            "Carrer ": "Rosello",
            "Numero": 58,
            "CP": "08036",
            "Ciutat": "Barcelona",
            "Pais": "España",
        }
    }  
  ]
)

db.Ulleres.insertMany(
  [
    {
      "_id": ObjectId("602af76f026e251dc92d82d5"),
      "Marca": {
        "Id_Marca": ObjectId("602e47c3fabf13a0c80b81cc"),
        "Nom": "Wooglass",
        "Id_provider": ObjectId("602aeb3c026e251dc92d82cc")
       },
      "Muntura": {
          "Tipus_Muntura": "Flotant",
          "Color_Muntura": "Blau"
      },
      "Vidres": {
          "Graduacio_RH": 1,
          "Graduacio_LH": 2,
          "Color_vidre": "Negre"
      },
      "Preu": 60,
    },
    {
      "_id": ObjectId("602af8f7026e251dc92d82d6"),
      "Marca": {
        "Id_Marca": ObjectId("602e4866fabf13a0c80b81cd"),
        "Nom": "Blassss",
        "Id_provider": ObjectId("602af611026e251dc92d82d4")
       },
      "Muntura": {
         "Tipus_Muntura": "Metàl.lica",
         "Color_Muntura": "Negre"
      },
      "Vidres": {
        "Graduacio_RH": 2,
        "Graduacio_LH": 1,
        "Color_vidre": "Negre"
      },
      "Preu": 80,
    }
  ]
)

db.Compra.insertOne(
  
    {
        "_id": ObjectId("602e4a3d9323671764ee3700"),
        "Id_Client": ObjectId("602af9d0026e251dc92d82d7"),
        "Llista_Ulleres": [ ObjectId("602af76f026e251dc92d82d5"), ObjectId("602af8f7026e251dc92d82d6")],
        "Data": {
            "$date": "2020-01-01T23:00:00.000Z"
        },
        "Id_Empleats": ObjectId("602afe81026e251dc92d82d9")
  
    }   
)