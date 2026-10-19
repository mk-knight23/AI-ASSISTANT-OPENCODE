# OpenCode configuration

`configs/opencode.json` follows the current [OpenCode config format](https://opencode.ai/docs/config/). Set `OPENCODE_MODEL` to a provider/model identifier available to your connected account, then provide only the API key for that provider through the environment or use OpenCode `/connect`. Do not commit credentials.

Use `OPENCODE_CONFIG=/absolute/path/to/configs/opencode.json` to select this example. The example does not make API calls or select a paid service automatically. Provider usage depends on the account and model you choose.

The previous example used non-JSON hash comments and unsupported top-level `providers`, `defaultProvider`, `defaultModel` and `workflows` settings. OpenCode uses `provider`, `model`, and separately defined agents/commands. Current routing or model pricing should be checked with the provider; no free-tier availability is guaranteed by this repository.
