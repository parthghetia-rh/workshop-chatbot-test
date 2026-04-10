#!/bin/bash
echo "Setting up workspace..."

# 1. Install Python dependencies
pip install -r requirements.txt

# 2. Create the Continue.dev configuration directory
mkdir -p ~/.continue

# 3. Inject the configuration file for the AI side-chat
cat <<EOF > ~/.continue/config.json
{
  "models": [
    {
      "title": "Workshop Private GPU",
      "provider": "openai",
      "model": "workshop-maas-model",
      "apiBase": "https://workshop-maas-model.workshop-maas.svc.cluster.local/v1",
      "apiKey": "dummy-key"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Workshop Autocomplete",
    "provider": "openai",
    "model": "workshop-maas-model",
    "apiBase": "https://workshop-maas-model.workshop-maas.svc.cluster.local/v1",
    "apiKey": "dummy-key"
  },
  "allowAnonymousTelemetry": false
}
EOF

echo "Workspace setup complete!"