
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'Techvpn',
        slug: "techvpn",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },

  }


  options = {
    base: "https://api.techvpn.cloud",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      server: {
      },

    }
  }


  entity = {
    "server": {
      "fields": [
        {
          "name": "city",
          "short": "City where the server is located",
          "type": "`$STRING`"
        },
        {
          "name": "country",
          "short": "Country where the server is located",
          "type": "`$STRING`"
        },
        {
          "name": "countryCode",
          "short": "ISO country code",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "Unique identifier for the server",
          "type": "`$STRING`"
        },
        {
          "name": "ip",
          "short": "Server IP address",
          "type": "`$STRING`"
        },
        {
          "name": "load",
          "short": "Current server load percentage",
          "type": "`$NUMBER`"
        },
        {
          "name": "name",
          "short": "Display name of the server",
          "type": "`$STRING`"
        },
        {
          "name": "port",
          "short": "Server port number",
          "type": "`$INTEGER`"
        },
        {
          "name": "premium",
          "short": "Whether the server requires premium access",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "protocol",
          "short": "VPN protocol used (e.g., WireGuard)",
          "type": "`$STRING`"
        },
        {
          "name": "publicKey",
          "short": "Public key for WireGuard connection",
          "type": "`$STRING`"
        }
      ],
      "name": "server",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/api/extension/servers",
              "parts": [
                "api",
                "extension",
                "servers"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.servers`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

