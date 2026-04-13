#!/bin/bash
echo "Setting up workspace..."

# 1. Install Python dependencies
pip install -r requirements.txt

# 2. Inject the configuration file with FIXED token limits into the persistent volume
cat <<EOF > /home/user/.continue/config.json
{
  "models": [
    {
      "title": "Workshop Private GPU",
      "provider": "openai",
      "model": "granite-8b-code-instruct",
      "apiBase": "https://granite-8b-code-instruct.workshop-maas.svc.cluster.local/v1",
      "apiKey": "dummy-key",
      "contextLength": 4096,
      "completionOptions": {
        "maxTokens": 1024
      }
    }
  ],
  "tabAutocompleteModel": {
    "title": "Workshop Autocomplete",
    "provider": "openai",
    "model": "granite-8b-code-instruct",
    "apiBase": "https://granite-8b-code-instruct.workshop-maas.svc.cluster.local/v1",
    "apiKey": "dummy-key",
    "contextLength": 4096,
    "completionOptions": {
      "maxTokens": 256
    }
  },
  "allowAnonymousTelemetry": false
}
EOF

echo "Workspace setup complete!"