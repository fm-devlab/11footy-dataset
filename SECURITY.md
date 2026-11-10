# Security policy

Please do not report a security problem in a public issue.

## How to report

Use GitHub's private vulnerability reporting: open the **Security** tab of this repository,
then **Report a vulnerability**. Only the maintainer sees the report.

If you cannot use it, write to `11footy.game@gmail.com`.

## What counts

- A release file whose SHA-256 does not match `SHA256SUMS`, or a `SHA256SUMS.sig` that does
  not verify, when you downloaded it from this repository's Releases page.
- Personal data in a file that should not be there.
- Anything in a file that could harm the person who opens it.

A wrong score, scorer or date is not a security problem: use the "Data correction" form.

## What happens next

We reply within 7 days. A release found faulty is withdrawn and replaced, and the change is
listed in `CHANGELOG.md`. We credit you if you want to be credited.
