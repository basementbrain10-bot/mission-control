# Email Integration Setup

This document describes the IMAP/SMTP email integration using [himalaya](https://github.com/rofrischmann/himalaya) CLI.

## Prerequisites

Ensure himalaya CLI is installed:

```bash
brew install himalaya
```

## Configuration

### 1. IMAP Account Setup

Configure your email client credentials:

```bash
himalaya list --json
# Add new account: himalaya add <email> --password <password> --imap-server <server>
```

**Example IMAP server configurations:**
- Gmail: `imap.gmail.com:993`
- Outlook: `outlook.office365.com:993`
- Custom: `<your-email>.com:993`

### 2. SMTP Sender Setup

Configure outgoing email credentials:

```bash
himalaya add --smtp-server smtp.example.com --port 587 --user <from-email> --password <app-password>
```

**Example SMTP settings:**
- Gmail: `smtp.gmail.com:587` (requires app password)
- Outlook: `smtp.office365.com:587`

### 3. Authentication

Store credentials securely:

```bash
himalaya list --json > ~/.config/himalaya/accounts.json
chmod 600 ~/.config/himalaya/accounts.json
```

## Email Templates

Located in `scripts/` directory:
- `templates/welcome-email.mml`
- `templates/verification-email.mml`
- `templates/error-notification.mml`

## Testing

### Test inbox reading:

```bash
himalaya list --all
```

### Test sending email:

```bash
cat scripts/templates/welcome-email.mml | himalaya send --from <your-email>
```

## Troubleshooting

- **Connection errors**: Check IMAP/SMTP server addresses and SSL settings
- **Authentication fails**: Use app passwords for Gmail/Outlook, not account passwords
- **Port 993/587 blocked**: Ensure firewall allows these ports
