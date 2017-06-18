#!/bin/bash
source env/bin/activate
google-oauthlib-tool --client-secrets /home/pi/client_secret_client-id.json --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless