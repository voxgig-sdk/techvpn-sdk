# Techvpn SDK configuration


def make_config():
    return {
        "main": {
            "name": "Techvpn",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.techvpn.cloud",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "server": {},
            },
        },
        "entity": {
      "server": {
        "fields": [
          {
            "active": True,
            "name": "city",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "country",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "countryCode",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "ip",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "load",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "port",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "premium",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "protocol",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "publicKey",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
        ],
        "name": "server",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/api/extension/servers",
                "parts": [
                  "api",
                  "extension",
                  "servers",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.servers`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
