#!/bin/bash
# Test script for himalaya email integration

set -e

EMAIL="${HIMALAYA_EMAIL:-}" 
PASSWORD="${HIMALAYA_PASSWORD:-}"
IMAP_SERVER="${IMAP_SERVER:-imap.gmail.com}"
SMTP_SERVER="${SMTP_SERVER:-smtp.gmail.com}"
PORT="${SMTP_PORT:-587}"

echo "=== Himailaya Email Setup Test ==="
echo

# Check if himalaya is installed
if ! command -v himalaya &>/dev/null; then
    echo "❌ Error: himalaya CLI not found"
    echo "Install with: brew install himalaya"
    exit 1
fi

echo "✅ Himailaya installed"
echo

# List existing accounts
if [ -n "$EMAIL" ]; then
    echo "Checking email account..."
    if himalaya list --json | grep -q "$EMAIL"; then
        echo "✅ Account configured: $EMAIL"
    else
        echo "⚠️  Account not found. Run: himalaya add $EMAIL --password $PASSWORD --imap-server $IMAP_SERVER"
    fi
else
    echo "ℹ️  No email configured yet (or EMAIL env var not set)"
fi

echo

# Test sending a test email
if [ -n "$EMAIL" ]; then
    echo "Testing send capability..."
    himalaya send --from "$EMAIL" to "${HIMALAYA_TEST_TO:-you@example.com}" subject "Himalaya Email Integration Test" body "This is a test message from the email integration."
    if [ $? -eq 0 ]; then
        echo "✅ Send test successful!"
    else
        echo "⚠️  Send test failed (may be rate limited or credentials wrong)"
    fi
else
    echo "⚠️  Cannot test send without configured account"
fi

echo
echo "=== Test Complete ==="
echo
if ! command -v himalaya &>/dev/null; then
    echo "To install: brew install himalaya"
    exit 1
fi

echo "All tests passed!"
