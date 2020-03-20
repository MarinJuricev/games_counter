# Game Counter

A universal game counter which can be used in various games.
My friends and I like to play different boardgames and most of the time we used pen & paper to keep
the score.

Since I started learning Flutter why not fix that issue.

### Architecture

The overall app architecture heavily borrows from Uncle Bob’s Clean Architecture.

For the presentation layer the BLOC design pattern was used.

During the development of the project, strict TDD was followed.
The domain/data layers are fully tested, while inside the presentation layer only the blocs are unit tested, didn't dip my toe in widget tests yet.

# Screenshots

### Game Creation

<img width="350" alt="creation_page" src="/screenshots/game_creation_page.jpg">

### Main Page

<img width="350" alt="creation_page" src="/screenshots/main_page.jpg">

### No Players Page

<img width="350" alt="creation_page" src="/screenshots/no_players_page.jpg">


### Edit Player Page

<img width="350" alt="creation_page" src="/screenshots/edit_player_page.jpg">

# TODOS:
  - [ ] History with local persistence
  - [ ] Settings
  - [ ] Delete Player
  - [ ] End game sooner feature, since not all games have a point limit.
  - [ ] Many more...
