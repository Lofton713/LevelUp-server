--To retrieve all items in the Game table.

--(GET) http://localhost:8000/games

games = Games.objects.all()

SELECT g.id,
    g.game_type_id,
    g.title,
    g.maker,
    g.gamer_id,
    g.number_of_players,
    g.skill_level
FROM levelupapi_game g

--To retrieve a single item in the Game table.
--(GET) http://localhost:8000/games/2

games = Games.objects.get(pk=request.data["2"])

SELECT g.id,
    g.game_type_id,
    g.title,
    g.maker,
    g.gamer_id,
    g.number_of_players,
    g.skill_level
FROM levelupapi_game g
WHERE g.id = 2

-- To retrieve items in the Game table that match a specific GameType.
--(GET) http://localhost:8000/games?gameTypeId=2

game_type_param = self.request.query_params.get('gameTypeId', None)
games = Games.objects.filter(game_type__id=game_type_param)

SELECT g.id,
    g.game_type_id,
    g.title,
    g.maker,
    g.gamer_id,
    g.number_of_players,
    g.skill_level,
    t.label game_type
FROM levelupapi_game g
LEFT JOIN levelupapi_gametype t
    ON g.game_type_id = t.id
WHERE t.id = 2

--To retrieve items in the Game table that match a specific GameType.
--(GET) http://localhost:8000/games?gameTypeId=2

--The use of the dunderscore (__) here represents a join operation.
game_type_param = self.request.query_params.get('gameTypeId', None)
games = Games.objects.filter(game_type__id=game_type_param)

SELECT g.id,
    g.game_type_id,
    g.title,
    g.maker,
    g.gamer_id,
    g.number_of_players,
    g.skill_level,
    t.label game_type
FROM levelupapi_game g
LEFT JOIN levelupapi_gametype t
    ON g.game_type_id = t.id
WHERE t.id = 2

--To retrieve items in the Events table that belong to a specific gamer.

--(GET) http://localhost:8000/profile/events

--HEADERS:
    --Authorization: Token 5k5k5k5k5k5k5k

events = Event.objects.filter(organizer__user=request.auth.user)

SELECT e.id,
       e.description
FROM levelupapi_event e
LEFT JOIN levelupapi_gamer g
    ON e.gamer_id = g.id
LEFT JOIN auth_user u
    ON g.user_id= u.id
LEFT JOIN authtoken_token t
    ON t.user_id = u.id
WHERE t.key = `5k5k5k5k5k5k5k`

--(DELETE) http://localhost:8000/games/5

event = Event.objects.get(pk=pk)
event.delete()

DELETE FROM levelupapi_events WHERE id = 5
