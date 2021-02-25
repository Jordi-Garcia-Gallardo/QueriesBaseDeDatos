cnx = new Mongo("localhost");
db = cnx.getDB('Youtube');
db.dropDatabase();

db.User.insertMany(
    [{
        "_id": ObjectId("60362128b4fc9c06506404a9"),
        "User_name": "Carlos88",
        "Email": "CFernandez@hotmail.com",
        "Password": "Fernandez88",
        "ZIP_Code": "08012",
        "Sex": "Male",
        "Channel":{
            "Channel_Id": ObjectId("60363a5ed27c1d2b9d76f7b8"),
            "Name": "4Fun",
            "Description": "Funny content for hours",
            "Date/Time": "",
            "Subs": [{
                "User.Id": ObjectId("603643d5b54bfc43eceb80d5"),
                 }, {
                "User.Id": ObjectId("603649f6b54bfc43eceb80d6"),
                }]
        },
        "Playlist":{
            "Playlist_Id": ObjectId("60363a5ed27c1d2b9d75f8b8"),
            "Name": "1",
            "Description": "My favourite playlist",
            "Status": "", 
            "Videos":[{
                "User.Id": ObjectId("603643d5b54bfc43eceb81d5"),
                 },{
                "User.Id": ObjectId("603649f6b54bfc43eceb82d6"),
                }]
        }              
    },{
        "_id": ObjectId("603643d5b54bfc43eceb80d5"),
        "User_name": "lozano89",
        "Email": "lozano89@hotmail.com",
        "Password": "ghtyu7897",
        "ZIP_Code": "08072",
        "Sex": "Male",
        "Channel":{
            "Channel_Id": ObjectId("60362b02e3dbeb103cc54ada"),
            "Name": "Music",
            "Description": "Me at home, playing guitar for you",
            "Date/Time": "",
            "Subs": [{}],   
        },
        "Playlist":{
            "Playlist_Id": ObjectId("fb72ba71227b4867eb10738d"),
            "Name": "Chilling",
            "Description": "My favourite songs",
            "Status": "", 
            "Videos":[{
                "User.Id": ObjectId("603643d5b54bfc43eceb22d5"),
                 },{
                "User.Id": ObjectId("603649f6b54bfc43eceb21d6"),
                }]
    }        
    },{
        "_id": ObjectId("603649f6b54bfc43eceb80d6"),
        "User_name": "anaoz",
        "Email": "anaoz@gmail.com",
        "Password": "ghjktyui12",
        "ZIP_Code": "09023",
        "Sex": "Female",
        "Channel":{
            "Channel_Id": ObjectId("60363015d27c1d2b9d75f7ac"),
            "Name": "Run if u can",
            "Description": "Scary situations not to be envolved in",
            "Date/Time": "",
            "Subs": [{
                "User.Id": ObjectId("603643d5b54bfc43eceb80d5"),
                 }],
        },
    },]
)

db.Video.insertMany(
  [
    {
      "_id": ObjectId("60362492e3dbeb103cc54ad3"),
      "Tittle": "Flying cat",
      "Description": "Flying dressed as Superman, moving around house's roof ",
      "Size": "1280 X 720",
      "File_name": "kitten23",
      "Duration": "",
      "Thumbnail": "",
      "Reproductions": 1850,
      "Num_Likes": 350,
      "Num_Dislikes": 2,
      "Status": "",
      "Tags": [{
        "ID": ObjectId("603634e8d27c1d2b9d75f7b0"),
        "Name": "Funny"
        }, {
        "ID": ObjectId("60363515d27c1d2b9d75f7b1"),
        "Name": "Animals"
        }, {
        "ID": ObjectId("60363549d27c1d2b9d75f7b2"),
        "Name": "FriendsForever"
       }],
       "UploadDetails": {
            "User_Id": ObjectId("60362128b4fc9c06506404a9"),
            "Date/Time": {"$date": "2020-02-05T22:59:00.000Z"}
        },
        "Liked":[{
            "User_ID": ObjectId("603643d5b54bfc43eceb80d5"),
            "Date_Time": {"$date": "2020-02-06T22:59:00.000Z"},
           },{
            "User_ID": ObjectId("603649f6b54bfc43eceb80d6"),
            "Date_Time": {"$date": "2021-02-01T12:59:00.000Z"},
           },],
        "Disliked":[{}],
        "Comments":[{
            "Comment_Id": ObjectId("603634e8d27c1d1b9d75f7b0"),
            "Text": "Lovely animals, i sued to do the same with mine",
            "User_Id": ObjectId("603643d5b54bfc43eceb80d5"),
            "Date_Time": {"$date": "2020-02-06T22:59:00.000Z"},
            "Liked":[{
                "User_ID": ObjectId("603634e8d27c1d1b9d75f7b0"),
                "Date_Time": {"$date": "2021-02-01T12:59:00.000Z"},
               },],
            "Disliked":[{}],
            },{
            "Comment_Id": ObjectId("603634e8d27c1d1b9d75f7b0"),
            "Text": "True Amor",
            "User_Id": ObjectId("603649f6b54bfc43eceb80d6"),
            "Date_Time": {"$date": "2021-02-01T12:59:00.000Z"},
            "Liked":[{
                "User_ID": ObjectId("603634e8d27c1d1b9d75f7b0"),
                "Date_Time": {"$date": "2021-02-01T13:59:00.000Z"},
               },],
            "Disliked":[{}],
           }],
},{
      "_id": ObjectId ("60362492e3dbeb103cc54ad4"),
      "Tittle": "Solo guitar",
      "Description": "Me playing some rock & roll themes",
      "Size": "1920 X 1080",
      "File_name": "Rocking",
      "Duration": "",
      "Thumbnail": "",
      "Reproductions": 321,
      "Num_Likes": 38,
      "Num_Dislikes": 10,
      "Status": "",
      "Tags": [{
        "ID": ObjectId("603634bcd27c1d2b9d75f7af"),
        "Name": "Music"
        }, {
        "ID": ObjectId("603639a8d27c1d2b9d75f7b7"),
        "Name": "Guitar"
      }],
      "UploadDetails": {
        "User_Id": ObjectId("603643d5b54bfc43eceb80d5"),
        "Date/Time": {"$date": "2021-02-01T22:59:00.000Z"},
        },
        "Liked":[{
            "User_ID": ObjectId("60362492e3dbeb103cc54ad5"),
            "Date_Time": {"$date": "2021-02-05T22:59:00.000Z"},
           },],
        "Disliked":[{
            "User_ID": ObjectId("60362492e3dbeb103cc54ad3"),
            "Date_Time": {"$date": "2021-02-11T12:59:00.000Z"},
           },],
},{
      "_id": ObjectId("60362492e3dbeb103cc54ad5"),
      "Tittle": "Hurricane Fox",
      "Description": "Images of hurricane Fox reaching south coast of EUA",
      "Size": "3840 X 2160",
      "File_name": "Fox_2020",
      "Duration": "",
      "Thumbnail": "",
      "Reproductions": 15000,
      "Num_Likes": 100,
      "Num_Dislikes": 500,
      "Status": "",
      "Tags": [{
        "ID": ObjectId("60363a5ed27c1d2b9d75f7b8"),
        "Name": "+18"
       }, {
        "ID": ObjectId("60363a80d27c1d2b9d75f7b9"),
        "Name": "Meteo"
       }],
       "UploadDetails": {
        "User_Id": ObjectId("603649f6b54bfc43eceb80d6"),
        "Date/Time": {"$date": "2021-02-10T21:59:00.000Z"},
        },
        "Liked":[{
            "User_ID": ObjectId("603643d5b54bfc43eceb80d5"),
            "Date_Time": {"$date": "2021-02-10T22:59:00.000Z"},
           },],
        "Disliked":[{
            "User_ID": ObjectId("60362128b4fc9c06506404a9"),
            "Date_Time": {"$date": "2021-02-11T12:59:00.000Z"},
           },],

  },
  ]
)

