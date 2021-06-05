#!/bin/bash
# Usage: ./lpass_login.sh <lpass_email_account> <lpass_master_password>

LASTPASS_MASTER_EMAIL=$1
LASTPASS_MASTER_PASSWORD=$2

export LPASS_DISABLE_PINENTRY=1
LOGGED_IN=$(lpass login "$LASTPASS_MASTER_EMAIL" <<<"$LASTPASS_MASTER_PASSWORD")
logger $LOGGED_IN
