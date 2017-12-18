curl --include --request POST "http://localhost:4741/beverages" \
  --header "Authorization: Token token=${TOKEN}" \
 --header "Content-Type: application/json" \
 --data '{
   "beverage": {
     "name": "'"${NAME}"'",
     "description": "'"${DESCRIPTION}"'",
     "recipe": "'"${RECIPE}"'",
     "rating": "'"${RATING}"'",
     "occasion": "'"${OCCASION}"'"
   }
 }'
