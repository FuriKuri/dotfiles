function notion-task -d "notion-task <icon> <task>"
    set icon (notion-icon $argv[1])
    set task $icon (string join ' ' $argv[2..-1])
    curl 'https://api.notion.com/v1/pages' \
        -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
        -H "Content-Type: application/json" \
        -H "Notion-Version: 2021-05-13" \
        -s \
        --data '{
            "parent": { "database_id": "$NOTION_DB_TASK" },
            "properties": {
                "Name": {
                    "title": [
                        {
                            "text": {
                                "content": "'"$task"'"
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
end
