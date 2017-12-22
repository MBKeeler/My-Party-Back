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
