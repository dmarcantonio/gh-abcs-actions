# syntax=docker/dockerfile:1.2
FROM alpine
RUN --mount=type=secret,id=FOO cat /run/secrets/FOO || exit 1