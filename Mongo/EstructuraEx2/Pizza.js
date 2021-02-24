cnx = new Mongo("localhost");
db = cnx.getDB('Pizza');
db.dropDatabase();

db.Customer.insertMany(
    [{
        "_id": ObjectId("60362128b4fc9c06506404a9"),
        "Name": "Carlos",
        "Last_Name": "Fernandez",
        "Address": {
           "Street": "Corsega",
           "Number": 23,
           "Apartmement": "3-2",
           "ZIP_Code": "08012"
        },
        "Phone": 655325699,
        "Locality": ObjectId("603634e8d27c1d2b9d75f7b0"),
        },
        {
        "_id": ObjectId("603643d5b54bfc43eceb80d5"),
        "Name": "Pedro",
        "Last_Name": "Gimenez",
        "Address": {
           "Street": "Provença",
           "Number": 83,
           "Apartmement": "2-2",
           "ZIP_Code": "08012"
        },
        "Phone": 644325696,
        "Locality": ObjectId("603634e8d27c1d2b9d75f7b0"),
        },
        {
        "_id": ObjectId("603649f6b54bfc43eceb80d6"),
        "Name": "Raul",
        "Last_Name": "Gomez",
        "Address": {
          "Street": "Venus",
          "Number": 2,
          "Apartmement": "1-2",
          "ZIP_Code": "07012"
        },
        "Phone": 633325692,
        "Locality": ObjectId("60363a5ed27c1d2b9d75f7b8")
        }
    ]
)

db.Employee.insertMany(
  [
    {
      "_id": ObjectId("60362492e3dbeb103cc54ad3"),
      "Name": "Pere",
      "Last_Name": "Lopez",
      "NIF": "45698635W",
      "Phone": 655458711,
      "Position": "Delivery",
      "Store": ObjectId("603634e8d27c1d2b9d75f7b0"),
},{
      "_id": ObjectId ("60362492e3dbeb103cc54ad4"),
      "Name": "Joan",
      "Last_Name": "Pez",
      "NIF": "46698611J",
      "Phone": 66658719,
      "Position": "Waiter",
      "Store": ObjectId("603634e8d27c1d2b9d75f7b0"),
},{
      "_id": ObjectId("60362492e3dbeb103cc54ad5"),
      "Name": "Joana",
      "Last_Name": "Perez",
      "NIF": "44698619E",
      "Phone": 68658713,
      "Position": "Delivery",
      "Store": ObjectId("60363ebcd27c1d2b9d75f7bf")
},{
      "_id": ObjectId("60362492e3dbeb103cc54ad6"),
      "Name": "Petra",
      "Last_Name": "Ben-youh",
      "NIF": "47798611L",
      "Phone": 62658717,
      "Position": "Waiter",
      "Store": ObjectId("60363ebcd27c1d2b9d75f7bf"),
}]
)

db.Province.insertMany(
  [
    {
      "_id": ObjectId("603634bcd27c1d2b9d75f7af"),      
      "Name": "Barcelona",
      "Locality": [{
            "ID": ObjectId("603634e8d27c1d2b9d75f7b0"),
            "Name": "Barcelona"
        }, {
            "ID": ObjectId("60363515d27c1d2b9d75f7b1"),
            "Name": "Badalona"
        }, {
            "ID": ObjectId("60363549d27c1d2b9d75f7b2"),
            "Name": "Cornella"
        }]
    },
    {
      "_id": ObjectId("603639a8d27c1d2b9d75f7b7"),
      "Name": "Girona",
      "Locality": [{
            "ID": ObjectId("60363a5ed27c1d2b9d75f7b8"),
            "Name": "Banyoles"
        }, {
            "ID": ObjectId("60363a80d27c1d2b9d75f7b9"),
            "Name": "Begur"
        }]
    }
  ]
)

db.Store.insertMany(
  [{
      "_id": ObjectId("60363015d27c1d2b9d75f7ac"),
      "Address": {
            "Street": "Rosello",
            "Number": 210,
            "ZIP_Code": "08012"
      },
      "Locality": ObjectId("603634e8d27c1d2b9d75f7b0"),
  },{ 
      "_id": ObjectId("60363ebcd27c1d2b9d75f7bf"),
      "Address": {
           "Street": "Riera Banyuls",
           "Number": 30,
           "ZIP_Code": "07012"
      },
      "Locality": ObjectId("60363a5ed27c1d2b9d75f7b8")
  }]
)
db.Products.insertMany(
    [{
      "_id": ObjectId("603628dbe3dbeb103cc54ad8"),
      "Name": "4 Cheeses",
      "Description": "Tomato, Mozzarella, pecorino, Gorgonzola and Parmessano",
      "Image": "",
      "Price": {
            "$numberDecimal": "9"
      },
      "Type": "Pizza",
      "Category": {
            "Name": "Basic",
            "id_cat": ObjectId("60362b02e3dbeb103cc54ada"),
      },
    },{
        "_id": ObjectId("603628dbe3dbeb103cc54ab8"),
        "Name": "Funghi",
        "Description": "Tomato, Mozzarella, mushrooms",
        "Image": "",
        "Price": {
            "$numberDecimal": "10"
        },
        "Type": "Pizza",
        "Category": {
            "Name": "Basic",
            "id_cat": ObjectId("60362b02e3dbeb103cc54ada")
            }
    },{
      "_id": ObjectId("603628dbe3dbeb103cc54af8"),
      "Name": "Trufatta",
      "Description": "Tomato, Mozzarella, mushrooms, truffle",
      "Image": "",
      "Price": {
          "$numberDecimal": "14"
      },
      "Type": "Pizza",
      "Category": {
          "Name": "Gourmet",
          "id_cat": ObjectId("60362b02e3dbeb103cc54adb"),
          } 
    },{
      "_id": ObjectId("603628dbe3dbeb103cc541f6"),
      "Name": "Water",
      "Description": "Viladrau 33cl",
      "Image": "",
      "Price": {
          "$numberDecimal": "2"
      },
      "Type": "Drink"
  },{
      "_id": ObjectId("603628dbe3dbeb103cc541f9"),
      "Name": "Coca-Cola",
      "Description": "Can 33cl",
      "Image": "",
      "Price": {
        "$numberDecimal": "2.5"
      },
      "Type": "Drink"
  },{
    "_id": ObjectId("603628dbe3dbeb103cc541f2"),
      "Name": "Beer",
      "Description": "Moritz 33cl",
      "Image": "",
      "Price": {
        "$numberDecimal": "2.2"
      },
      "Type": "Drink",
  },{
    "_id": ObjectId("603628dbe3dbeb103cc541f1"),
    "Name": "Cheese Burger",
    "Description": "Tomate cheese 200g burguer meat",
    "Image": "",
    "Price": {
        "$numberDecimal": "8.5"
    },
    "Type": "Burguer"
  },{
    "_id": ObjectId("603628dbe3dbeb103cc541f3"),
    "Name": "Chicken Burger",
    "Description": "Tomate cheese 200g chicken meat",
    "Image": "",
    "Price": {
        "$numberDecimal": "8.5"
    },
    "Type": "Burguer"
  },{
    "_id": ObjectId("603628dbe3dbeb103cc54af9"),
    "Name": "Calçots",
    "Description": "Tomato, Mozzarella, calçots, Romesco",
    "Image": "",
    "Price": {
        "$numberDecimal": "11"
    },
    "Type": "Pizza",
    "Category": {
        "Name": "Seasonal",
        "id_cat": ObjectId("60362b02e3dbeb103cc54adf"),
    }
}]
)




db.Order.insertMany(
  [{
    "_id": ObjectId("6036516cd27c1d2b9d75f7c3"),
    "Date_time": {
        "$date": "2021-02-19T21:59:00.000Z"
    },
    "Price": {
        "$numberDecimal": "28"
    },
    "Products": [{
        "Product_id": ObjectId("603628dbe3dbeb103cc541f3"),
        "Qty": 2
    },{
        "Product_id": ObjectId("603628dbe3dbeb103cc54af9"),
        "Qty": 1
    }],
    "Store_Order": ObjectId("60363015d27c1d2b9d75f7ac"),
    "Type": "Delivery",
    "Delivery_details": {
        "Employee": ObjectId("60362492e3dbeb103cc54ad3"),
        "Date": {
            "$date": "2021-02-19T22:45:00.000Z"
        }
    },
    "Customer_Id": ObjectId("603643d5b54bfc43eceb80d5"),
  },{
    "_id": ObjectId("603653f5b54bfc43eceb80d7"),
    "Date_time": {
        "$date": "2021-02-20T20:59:00.000Z"
    },
    "Price": {
        "$numberDecimal": "13.5"
    },
    "Products": [{
        "Product_id": ObjectId("603628dbe3dbeb103cc541f9"),
        "Qty": 2
      },{
        "Product_id": ObjectId("603628dbe3dbeb103cc541f3"),
        "Qty": 1
      }],
    "Store_Order": ObjectId("60363015d27c1d2b9d75f7ac"),
    "Type": "Pick-up",
    "Customer_Id": ObjectId("603643d5b54bfc43eceb80d5"),
  },{
    "_id": ObjectId("60365418b54bfc43eceb80d8"),
    "Date_time": {
        "$date": "2021-02-23T21:59:00.000Z"
    },
    "Price": {
        "$numberDecimal": "10"
    },
    "Products": [{
        "Product_id": ObjectId("603628dbe3dbeb103cc54ab8"),
        "Qty": 1
    }],
    "Store_Order": ObjectId("60363ebcd27c1d2b9d75f7bf"),
    "Type": "Delivery",
    "Delivery_details": {
        "Employee": ObjectId("60362492e3dbeb103cc54ad5"),
        "Date": {
            "$date": "2021-02-23T22:30:00.000Z"
        }
    },
    "Customer_Id": ObjectId("603649f6b54bfc43eceb80d6"),
  }]  
)