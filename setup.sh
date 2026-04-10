#!/bin/bash
echo "Setting up workspace..."

# 1. Install Python dependencies
pip install -r requirements.txt

# 2. Download the extension file as a bulletproof backup
echo "Downloading Continue extension backup..."
wget -q -nc https://open-vsx.org/api/Continue/continue/linux-x64/0.8.21/file/Continue.continue-0.8.21@linux-x64.vsix -O continue-offline.vsix

# 3. Create the Continue.dev configuration directory
mkdir -p ~/.continue

# 4. Inject the configuration file to point to your internal GPU pod
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