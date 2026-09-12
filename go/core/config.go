package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Techvpn",
			"slug": "techvpn",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://api.techvpn.cloud",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"server": map[string]any{},
			},
		},
		"entity": map[string]any{
			"server": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "city",
						"short": "City where the server is located",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"short": "Country where the server is located",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "countryCode",
						"short": "ISO country code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "Unique identifier for the server",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ip",
						"short": "Server IP address",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "load",
						"short": "Current server load percentage",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "name",
						"short": "Display name of the server",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "port",
						"short": "Server port number",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "premium",
						"short": "Whether the server requires premium access",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "protocol",
						"short": "VPN protocol used (e.g., WireGuard)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "publicKey",
						"short": "Public key for WireGuard connection",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "server",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/api/extension/servers",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "extension",
									},
									map[string]any{
										"lit": "servers",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.servers`",
								},
								"parts": []any{
									"api",
									"extension",
									"servers",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
