# Scoreboard API

At the office we love playing ping pong. But currently we have a problem,
we don't have any scoreboard where we can register all matches and points per player.

We'd love to have a **restful** API that we could use to track each game and points.

## The overview

* You can use *any* framework or library you want, but it must be in Ruby.
* It should accept and respond JSON format.
* You can use any database or storage strategy you'd like.
* The API should be live when you deliver it, you can set a free [heroku](http://heroku.com) account.
* Adding tests is optional, but it will add extra points. (You can use any testing library).
* Fork this repo to your own github account and work there.

## The specs

The actions you should be able to do with the API are these:

* Create a user
* Update a user
* Delete a user
* Get user info
* Start a game
* Score a point for a player in a game
* Reset a point scored previously
* End a game
* Get game details
* Get leaderboard

The first four actions are self explanatory, a `user` would have `:name`, `:wins_count` and `:loses_count` only.
For the other actions below is the detailed explanation.

### Start a game

Starting a game would be as creating a new game, you'll need to send the two users' id that are playing.

#### Example

    POST /games

    Request:
    {
        "players" : {
            "A" : 3,
            "B" : 1,
        }
    }

    Response:
    { 
        "game": { 
            "id": 45,
            "players": [
                { "id": 3, "points": 0 },
                { "id": 1, "points": 0 }
            ],
            "winner": 0 
        } 
    }

### Score a point for a player in a game

This would be used when a user scores a point in a game. You'll need to send the id of the game as well as the user's id that scored the point.

#### Example

    POST /games/45/score

    Request:
    {
        "player_id": 3
    }

    Response:
    { 
        "game": 
        { 
            "id": 45,
            "players": [
                { "id": 3, "points": 1 },
                { "id": 1, "points": 0 }
            ],
            "winner": 0 
        } 
    }

### Reset a point scored previously

This is useful for when someone scores and in the end it wasn't a valid point or something. You need to send the id of the player that scored the point.
It should validate if you try to reset a score of zero.

#### Example

    DELETE /games/45/reset_point
    
    Request:
    {
        "player_id": 3
    }

    Response:
    { 
        "game": { 
            "id": 45,
            "players": [
                { "id": 3, "points": 0 },
                { "id": 1, "points": 0 }
            ],
            "winner": 0 ,
        } 
    }

### End a game

Ending a game should freeze the game, that means no more scores can be registered and it will add the stats to the player.
It should return the winner of the game based on the current registered points.

#### Example

    PUT /games/45/end

    Response:
    { 
        "game": { 
            "id": 45,
            "players": [
                { "id": 3, "points": 7 },
                { "id": 1, "points": 5 }], 
            "winner": 3 
        }
    }

### Get game details

This is only for informational purposes, should return the game details.

#### Example

    GET /games/45

    Response:
    { 
        "game": { 
            "id": 45,
            "players": [
                { "id": 3, "points": 7 },
                { "id": 1, "points": 5 }
            ],
            "winner": 3 
        } 
    }

### Get leaderboard

This is the list of all the users ordered by their `wins_count - loses_count`, that means the one with most wins could not
be the top leaderboard, but the one that also doesn't have too many loses.

#### Example

    GET /leaderboard

    Response:
    { 
        "players": [
            {   "id": 3, "name": "Fer", "wins_count": 50, "loses_count": 3 },
            {   "id": 1, "name": "Adrian", "wins_count": 53, "loses_count": 10 },
            {   "id": 19, "name": "Chava", "wins_count": 45, "loses_count": 20 }
        ] 
    }


### Error responses

The API should respond with appropiate [status codes and messages](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html). All requests served correctly should respond with 2xx.
The requests that fails should return a correct status code according to the description of each one.