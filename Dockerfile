FROM alpine

# Copy the print script
COPY print-secrets.sh /print-secrets.sh
RUN chmod +x /print-secrets.sh

# Set script as entrypoint
CMD ["/print-secrets.sh"]