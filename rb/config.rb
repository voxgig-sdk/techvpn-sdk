# Techvpn SDK configuration

module TechvpnConfig
  def self.make_config
    {
      "main" => {
        "name" => "Techvpn",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
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
              "active" => true,
              "name" => "city",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "country",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "country_code",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "ip",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "load",
              "req" => false,
              "type" => "`$NUMBER`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "port",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "premium",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "protocol",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "public_key",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 10,
            },
          ],
          "name" => "server",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
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
