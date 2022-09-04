function notion-note -d "notion-note <note>"
    set note (string join ' ' $argv[1..-1])

    curl -X PATCH "https://api.notion.com/v1/blocks/$NOTION_DB_NOTE/children" \
        -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
        -H "Content-Type: application/json" \
        -H "Notion-Version: 2022-02-22" \
        --data '{
            "children": [
                {
                    "object": "block",
                    "type": "paragraph",
                    "paragraph": {
                        "rich_text": [
                            {
                                "type": "text",
                                "text": {
                                    "content": "'"$note"'"
                                }
                            }
                        ]
                    }
                }
            ]
        }'
end
