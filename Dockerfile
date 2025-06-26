# syntax=docker/dockerfile:1.2
FROM alpine
RUN --mount=type=secret,id=FOO \ 
    ls -l /run/secrets && \    
    cat /run/secrets/FOO || exit 1