# syntax=docker/dockerfile:1.2
FROM alpine

# Print and export secrets at build time to /exported-secrets.txt
RUN --mount=type=secret,id=FOO \
    --mount=type=secret,id=BAR \
    echo "---- THIS IS WHERE THE SECRETS ARE ----" > /exported-secrets.txt && \
    echo "FOO: $(cat /run/secrets/FOO 2>/dev/null || echo '<not set>')" >> /exported-secrets.txt && \
    echo "BAR: $(cat /run/secrets/BAR 2>/dev/null || echo '<not set>')" >> /exported-secrets.txt

# Default entrypoint: show the exported file when running the image
CMD ["/bin/sh", "-c", "cat /exported-secrets.txt || echo 'No secrets file found.'"]