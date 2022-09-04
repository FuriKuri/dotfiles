function notion-icon -d "notion-icon <icon>"
    set icon $argv[1]
    set result (http "https://emoji-api.com/emojis?search=$icon&access_key=$EMOJI_API_KEY" | jq -r '.[0].character' | tr -d '\r')
    echo -n $result
end
