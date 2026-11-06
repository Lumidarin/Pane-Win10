# Public fork packaging policy

Reject embedded credential material in the installer and uncompressed payload.
The upstream private packaging policy is not part of the public repository.

```forbidden
-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----
gh[pousr]_[A-Za-z0-9]{36}
github_pat_[A-Za-z0-9_]{80,}
```
