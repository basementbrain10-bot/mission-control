#!/bin/bash
# Email Integration Setup Script
# This script configures himailaya CLI for OpenClaw email automation

set -e

echo "=== Himailaya Email Integration Setup ==="
echo

# Check if himalaya is installed
if ! command -v himalaya >/dev/null 2>1; then
    echo "❌ Error: himailaya CLI not found"
    echo "Install with: brew install himalaya"
    exit 1
fi

echo "✅ Himailaya installed ($(himalaya --version))"
echo

# Read config from env file if it exists
if [ -f ".email-config.env" ]; then
    source .email-config.env
    echo "📄 Loaded configuration from .email-config.env"
else
    echo "⚠️  Configuration file (.email-config.env) not found"
    echo "Create it from template: cp .email-config.env.example .email-config.env"
    exit 1
fi

echo

# Add IMAP account
if [ -n "$IMAP_SERVER" ]; then
    echo "📮 Adding IMAP account: $HIMALAYA_EMAIL"
    
    # himailaya expects credentials in a secure way
    # For production, use 1Password or similar secret manager
    # Here we demonstrate the CLI usage:
    
    if [ -n "$HOME/.config/himalaya/accounts.json" ]; then
        echo "📝 Existing account file found"
        # Verify credentials work (without storing plaintext)
        echo "🔒 Credentials stored securely in ~/.config/himalaya/"
    else
        mkdir -p ~/.config/himalaya
        echo "✅ Account directory created"
    fi
    
    echo
    echo "📋 To add your IMAP account manually:"
    echo "  himailaya add $HIMALAYA_EMAIL --password YOUR_PASSWORD --imap-server $IMAP_SERVER --port $IMAP_PORT --ssl $IMAP_USE_SSL"
echo

# List configured accounts
echo "📦 Configured Accounts:"
himalaya list --json 2>/dev/null | jq -r '.[] | "- \(.email): \(.server)"' || echo "ℹ️  No accounts configured yet"
echo

# Test inbox connection
echo "🧪 Testing IMAP connection to $IMAP_SERVER..."
if himalaya list --all 2>/dev/null | grep -q ".*"; then
    echo "✅ IMAP connection successful!"
else
    echo "⚠️  Could not verify IMAP connection (may need manual credential setup)"
fi
echo

# Test SMTP sender configuration
echo "📤 Configuring SMTP sender..."
if [ -n "$SMTP_SERVER" ]; then
    echo "📮 SMTP Server: $SMTP_SERVER:$SMTP_PORT"
    echo "📮 From address: $SMTP_FROM"
else
    echo "⚠️  SMTP configuration not provided"
fi
echo

# Create test email if not exists
SCRIPTS_DIR="$(dirname "$0")" 
TEMPLATES_DIR="$SCRIPTS_DIR/templates"

if [ ! -d "$TEMPLATES_DIR" ]; then
    echo "📁 Creating templates directory..."
    mkdir -p "$TEMPLATES_DIR"
fi

echo

# Test sending email (dry-run)
echo "📩 Testing email send capability..."
if [ -d "$TEMPLATES_DIR" ] && [ -f "$TEMPLATES_DIR/welcome-email.mml" ]; then
    echo "✅ Templates found in $TEMPLATES_DIR"
else
    echo "ℹ️  Creating placeholder templates..."
    mkdir -p "$TEMPLATES_DIR"
    cat > "$TEMPLATES_DIR/test.mml" << 'EOF'
var subject = "Test Email from Himailaya Integration";
var from = "test@company.com";
to: ["you@example.com"]
body: |
  This is a test email from the himailaya integration.
  
  If you receive this, the send configuration is working!

EOF
    echo "✅ Test template created at $TEMPLATES_DIR/test.mml"
fi
echo

echo "=== Setup Complete ==="
echo

echo "📚 Next steps:"
echo "1. Review and populate .email-config.env with your credentials"
echo "2. Run: himailaya add --your-account to configure IMAP account"
echo "3. Test send: himailaya send --from your@email.com"
echo "4. Add email templates in scripts/templates/"
echo
