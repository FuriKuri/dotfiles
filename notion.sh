notion_icon() {
  result=$(http "https://emoji-api.com/emojis?search=$1&access_key=$EMOJI_API_KEY" | jq -r '.[0].character' | tr -d '\r')
  echo -n $result
}

notion_create_task() {
    echo "--> $1"
    curl 'https://api.notion.com/v1/pages' \
        -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
        -H "Content-Type: application/json" \
        -H "Notion-Version: 2021-05-13" \
        -s \
        --data '{
            "parent": { "database_id": "833c55d9-4625-458b-8c21-d2a9e3a6332a" },
            "properties": {
                "Name": {
                    "title": [
                        {
                            "text": {
                                "content": "'"$1"'"
                            }
                        }
                    ]
                },
                "Status": {
                    "type": "select",
                    "select": {
                        "id": "1",
                        "name": "To Do",
                        "color": "red"
                    }
                }
            }
        }' | jq -r '.id'
}

todo() {
  if [[ -z $2 ]]; then
    echo "missing task"
  else
    icon="$(notion_icon "$1")"
    shift

    notion_create_task "$icon $*"
  fi
}