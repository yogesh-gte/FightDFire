-- Track hardening milestones applied in app code (audit trail in DB).

INSERT INTO schema_meta (version_key, notes)
VALUES
  ('harden_secrets_env', 'Secrets externalized to environment variables'),
  ('harden_admin_invite_only', 'Open admin registration closed'),
  ('harden_payment_verify', 'Razorpay signature verify always enforced'),
  ('harden_bcrypt_auth', 'PasswordAuthHelper BCrypt across roles'),
  ('harden_sos_sms', 'SOS unified + Tier-2 escalation + real SMS providers'),
  ('harden_idor_websocket', 'IDOR ownership checks + JWT WebSocket handshake'),
  ('harden_stubs_removed', 'Dead stubs removed; funding/FL/AI honest-gated')
ON DUPLICATE KEY UPDATE notes = VALUES(notes);
