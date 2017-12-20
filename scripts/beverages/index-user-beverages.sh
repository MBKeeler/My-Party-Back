curl --include --request GET "http://localhost:4741/user_beverages" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

# previous version
  # curl --include --request GET "http://localhost:4741/users/{$ID}/beverages" \
  #   --header "Content-Type: application/json" \
  #   --header "Authorization: Token token=$TOKEN"
