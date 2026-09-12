"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'Techvpn',
        slug: "techvpn",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://api.techvpn.cloud",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            server: {},
        }
    };
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
            "id": {
                "field": "id",
                "name": "id"
            },
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
                            "segments": [
                                {
                                    "lit": "api"
                                },
                                {
                                    "lit": "extension"
                                },
                                {
                                    "lit": "servers"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.servers`"
                            },
                            "parts": [
                                "api",
                                "extension",
                                "servers"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map