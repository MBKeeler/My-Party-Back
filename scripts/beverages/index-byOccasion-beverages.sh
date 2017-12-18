curl --include --request GET "http://localhost:4741/beverages/index_by_occasion" \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}" \
--data '{
  "beverage": {
    "occasion": "'"${OCCASION}"'"
  }
}'
