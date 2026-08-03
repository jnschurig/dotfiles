#!/usr/bin/env sh

response=$(curl -s http://localhost:11434/api/tags)
if [ $? -eq 0 ]; then
  count=$(echo "$response" | grep -o '"name"' | wc -l)
  # Output JSON format for Waybar
  echo "{\"text\": \"🦙 $count\", \"tooltip\": \"Ollama Active\nInstalled models: $count\"}"
  # echo "{\"text\": \"  $count\", \"tooltip\": \"Ollama Active\nInstalled models: $count\"}"
else
  echo '{"text": "🦙 off", "tooltip": "Ollama Service Stopped"}'
  # echo '{"text": "  off", "tooltip": "Ollama Service Stopped"}'
fi
