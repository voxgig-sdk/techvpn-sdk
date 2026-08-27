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
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
                  "parts" => [
                    "api",
                    "extension",
                    "servers",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.servers`",
                  },
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
