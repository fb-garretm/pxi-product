# Custom Domains prototype

Self-service flow: enter domain → add DNS at registrar → wait for propagation → connected.

## Screens

1. Your domain — enter and validate
2. DNS records — registrar-specific steps + copy values
3. Checking DNS — pending / check again
4. Connected — success state

## Notes

- Single HTML file, no build step. Open `index.html` in a browser.
- DNS check is simulated in the prototype (no live lookup).
