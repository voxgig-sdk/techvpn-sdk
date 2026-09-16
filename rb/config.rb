# Techvpn SDK configuration

module TechvpnConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Techvpn",
        "slug" => "techvpn",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://api.techvpn.cloud",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "server" => {},
        },
      },
      "entity" => {
        "server" => {
          "fields" => [
            {
              "name" => "city",
              "short" => "City where the server is located",
              "type" => "`$STRING`",
            },
            {
              "name" => "country",
              "short" => "Country where the server is located",
              "type" => "`$STRING`",
            },
            {
              "name" => "countryCode",
              "short" => "ISO country code",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "Unique identifier for the server",
              "type" => "`$STRING`",
            },
            {
              "name" => "ip",
              "short" => "Server IP address",
              "type" => "`$STRING`",
            },
            {
              "name" => "load",
              "short" => "Current server load percentage",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "name",
              "short" => "Display name of the server",
              "type" => "`$STRING`",
            },
            {
              "name" => "port",
              "short" => "Server port number",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "premium",
              "short" => "Whether the server requires premium access",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "protocol",
              "short" => "VPN protocol used (e.g., WireGuard)",
              "type" => "`$STRING`",
            },
            {
              "name" => "publicKey",
              "short" => "Public key for WireGuard connection",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "server",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/extension/servers",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "extension",
                    },
                    {
                      "lit" => "servers",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.servers`",
                  },
                  "parts" => [
                    "api",
                    "extension",
                    "servers",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    TechvpnFeatures.make_feature(name)
  end
end
