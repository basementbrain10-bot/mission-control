# Email Configuration Task

Configure email integration using himalaya CLI for IMAP/SMTP integration into OpenClaw.

## Requirements
- Install himalaya CLI: `brew install himalaya`
- Configure IMAP account authentication
- Set up SMTP sender credentials  
- Create email templates for common workflows
- Test inbox reading and message sending
- Document the setup in docs/email-setup.md

## Acceptance Criteria

### ✅ Email Account Configured
- [ ] IMAP server connects successfully
- [ ] Can list messages from inbox
- [ ] Credentials stored securely

### ✅ SMTP Sender Setup  
- [ ] Can send test email
- [ ] Authentication works with app password
- [ ] Test to address delivered successfully

### ✅ Email Templates Created
- [ ] Welcome/verification email template exists
- [ ] Error notification template exists
- [ ] Templates use MML format

### ✅ Documentation Complete
- [ ] docs/email-setup.md exists with setup instructions
- [ ] Troubleshooting guide included

## Steps

1. **Install himailaya**: `brew install himalaya`
2. **Add IMAP account**: `himalaya add your@email.com --password YOUR_PASSWORD --imap-server imap.example.com`
3. **Test inbox read**: `himalaya list --all`
4. **Configure SMTP sender**: `himalaya add --smtp-server smtp.example.com --port 587`
5. **Create templates**: Place MML files in `scripts/templates/`
6. **Test send**: `himalaya send --from your@email.com` body "test"
7. **Document**: Update docs/email-setup.md

## Notes
- Use app passwords for Gmail/Outlook, not account passwords
- Store credentials securely with proper permissions
- Consider using 1Password or similar for credential management