
# My Party!
  My Party! is a tracking and discovery application to help revelers and
  party-goers record their favorite drinks.  My Party! allows the user to enter
  their own favorite beverages, assign a rating, and an occasion.  Users can
  modify the recipes later if they want to improve upon what they already posted.

  My Party! is also a social site where beverages are crowd sourced.  As
  beverages are added by users signed up to the site, these beverages become
  available for viewing by all other members. The more members who join the
  better selection to choose from.  

  Currently there are two points of integration.  First is the random drink that
  appears on the My Party front page.  The second is a drink name search that is
  available to the user when they go to add a beverage to the My Party! site.
  The external search is intended to enhance the experience of My Party! by
  allowing the user to more quickly enter a list of beverages that they can then
  modify at a later day.

## On Github & Heroku
Front End Code Repo on Github:
  https://github.com/MBKeeler/My-Party-Front

Frond End Code Hosted on Github:
  https://mbkeeler.github.io/My-Party-Front/

Back End Code Repo on Github:
  https://github.com/MBKeeler/My-Party-Back

Heroku:
  https://enigmatic-wildwood-15287.herokuapp.com/

## Wire Frames & ERDs
  https://imgur.com/a/bPHkz

## Beverage Schema

```
| Field           | Description            | Notes                   |
|-----------------|------------------------|-------------------------|
| name            | Beverage Name          |  60 chars maximum       |
|                 |                        |                         |
| rating          | User's rating          |                         |
|                 |                        |                         |
| occasion        | Occasion suited for the|                         |
|                 | beverage               |                         |
| description     | Short description of   |  150 chars max          |
|                 | the beverage           |                         |
|                 |                        |                         |
| recipe          | Holds the ingredients  | to be renamed in v.2    |
|                 |                        | 300 chars maximum       |
|                 |                        |                         |
| instructions    |Holds any instructions  |  400 chars maximum      |
|                 |for making the beverage |                         |
```

## API

### Beverage Resource
The Beverage resource belongs to the User.  A beverage is defined in the schema
model below.  A User has a one to many relationship with Beverage.

```
| Verb   | URI Pattern            | Controller#Action       |
|--------|------------------------|-------------------------|
| POST   | `/beverages'           | `Create`                |
| GET    | `/beverages'           | `Index`                 |
| PATCH  | `/beverages'           | `Update`                |
| DELETE | `/beverages'           | `Destroy`               |
| GET    | `/user_beverages'      | `Index_All_Beverages`   |
```

  Scripts
  Scripts to test all basic actions are available in the project repository
  using this path:  ./scripts/beverages

  Request Examples:

  Create:
  ```sh
  curl --include --request POST "http://localhost:4741/beverages" \
    --header "Authorization: Token token=${TOKEN}" \
   --header "Content-Type: application/json" \
   --data '{
     "beverage": {
       "name": "'"${NAME}"'",
       "description": "'"${DESCRIPTION}"'",
       "recipe": "'"${RECIPE}"'",
       "instructions": "'"${INSTRUCTIONS}"'",
       "rating": "'"${RATING}"'",
       "occasion": "'"${OCCASION}"'"
     }
   }'
   ```

   Update:
   ```sh
   curl --include --request PATCH "http://localhost:4741/beverages/${ID}" \
     --header "Authorization: Token token=${TOKEN}" \
    --header "Content-Type: application/json" \
    --data '{
      "beverage": {
        "name": "'"${NAME}"'",
        "description": "'"${DESCRIPTION}"'",
        "recipe": "'"${RECIPE}"'",
        "instructions": "'"${INSTRUCTIONS}"'",
        "rating": "'"${RATING}"'",
        "occasion": "'"${OCCASION}"'"
      }
    }'
   ```

   Destroy:
    Response: 204 No Content
   ```sh
   curl --include --request DELETE "http://localhost:4741/beverages/${ID}" \
     --header "Content-Type: application/json" \
     --header "Authorization: Token token=${TOKEN}" \
   ```

   Index_All_Beverages (list of all beverages)
    Response: 200 OK
   ```sh
   curl --include --request GET "http://localhost:4741/user_beverages" \
     --header "Content-Type: application/json" \
     --header "Authorization: Token token=$TOKEN"
   ```

   Show:
    Response: 200 OK
   ```sh
   curl --include --request GET "http://localhost:4741/beverages/${ID}" \
   --header "Content-Type: application/json" \
   --header "Authorization: Token token=${TOKEN}"
   ```

   Index (list just the user's beverages)
    Response: 200 OK
   ```sh
   curl --include --request GET "http://localhost:4741/beverages" \
     --header "Content-Type: application/json" \
     --header "Authorization: Token token=$TOKEN"
   ```

### Authentication
```
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |
```

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```
