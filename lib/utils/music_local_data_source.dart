/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
class MusicDataSource {
  static dynamic musicDataSource = {
    "Users": [
      {
        "id": 12345,
        "username": "Joe User",
        "favorite_song_name": "Dreams",
        "music_style": "Rock",
        "playlist": {
          "id": 12,
          "name": "Old rocks",
          "user_id": 12345,
          "songs": [5, 6]
        }
      },
      {
        "id": 5,
        "username": "Ramesh Kumar",
        "favorite_song_name": "Shake It Off",
        "music_style": "Pop",
        "playlist": {
          "id": 15,
          "name": "Pop Hits",
          "user_id": 5,
          "songs": [1, 2]
        }
      },
      {
        "id": 3,
        "username": "Simon Binder",
        "favorite_song_name": "Sweet Little Angel",
        "music_style": "Blues",
        "playlist": {
          "id": 17,
          "name": "Blues Mix",
          "user_id": 3,
          "songs": [1, 3]
        }
      },
      {
        "id": 4,
        "username": "Wang Xiaoming",
        "favorite_song_name": "Wish You Were Here",
        "music_style": "Rock",
        "playlist": {
          "id": 18,
          "name": "Pink Floyd Mix",
          "user_id": 4,
          "songs": [6, 7]
        }
      },
      {
        "id": 2,
        "username": "Sandy Smith",
        "favorite_song_name": "Hey Jude",
        "music_style": "Rock",
        "playlist": {
          "id": 16,
          "name": "Classic Rock",
          "user_id": 2,
          "songs": [6, 7, 8, 9]
        }
      },
    ],
    "Songs": [
      {
        "id": 1,
        "name": "Dreams",
        "duration": 250,
        "genre": "Rock",
        "album": "Rumours",
        "artistId": 5
      },
      {
        "id": 2,
        "name": "Edge of Seventeen",
        "duration": 280,
        "genre": "Rock",
        "album": "Bella Donna",
        "artistId": 5
      },
      {
        "id": 3,
        "name": "Sweet Little Angel",
        "duration": 210,
        "genre": "Blues",
        "album": "B.B. King Wails",
        "artistId": 1
      },
      {
        "id": 4,
        "name": "Wish You Were Here",
        "duration": 320,
        "genre": "Rock",
        "album": "Wish You Were Here",
        "artistId": 2
      },
      {
        "id": 5,
        "name": "Strange Fruit",
        "duration": 270,
        "genre": "Jazz",
        "album": "Lady Sings the Blues",
        "artistId": 7
      },
      {
        "id": 6,
        "name": "Moonlight Sonata",
        "duration": 360,
        "genre": "Classical",
        "album": "Sonata Quasi Una Fantasia",
        "artistId": 8
      },
      {
        "id": 7,
        "name": "Heart of Gold",
        "duration": 230,
        "genre": "Folk",
        "album": "Harvest",
        "artistId": 9
      },
      {
        "id": 8,
        "name": "Fearless",
        "duration": 200,
        "genre": "Country",
        "album": "Fearless",
        "artistId": 10
      },
      {
        "id": 9,
        "name": "Love Story",
        "duration": 240,
        "genre": "Country",
        "album": "Fearless",
        "artistId": 10
      },
      {
        "id": 10,
        "name": "Blank Space",
        "duration": 280,
        "genre": "Pop",
        "album": "1989",
        "artistId": 10
      }
    ],
    "Artists": [
      {
        "id": 1,
        "name": "BB King",
        "age": 89,
        "music_style": "Blues",
      },
      {
        "id": 2,
        "name": "Pink Floyd",
        "age": 36,
        "music_style": "Rock",
      },
      {
        "id": 5,
        "name": "Stevie Nicks",
        "age": 65,
        "music_style": "Rock",
      },
      {
        "id": 9,
        "name": "Neil Young",
        "age": 78,
        "music_style": "Rock",
      },
      {
        "id": 10,
        "name": "Taylor Swift",
        "age": 33,
        "music_style": "Pop",
      },
    ]
  };
}
