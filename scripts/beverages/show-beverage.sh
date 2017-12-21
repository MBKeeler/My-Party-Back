# below script would be for when only the current user would be allowed to get a single beverage.
curl --include --request GET "http://localhost:4741/beverages/${ID}" \
--header "Content-Type: application/json" \
--header "Authorization: Token token=${TOKEN}"

# curl --include --request GET "http://localhost:4741/beverages/${ID}" \
# --header "Content-Type: application/json"
