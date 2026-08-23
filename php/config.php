<?php
declare(strict_types=1);

// Techvpn SDK configuration

class TechvpnConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Techvpn",
                "slug" => "techvpn",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.techvpn.cloud",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "server" => [],
                ],
            ],
            "entity" => [
        'server' => [
          'fields' => [
            [
              'name' => 'city',
              'short' => 'City where the server is located',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'country',
              'short' => 'Country where the server is located',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'countryCode',
              'short' => 'ISO country code',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'id',
              'short' => 'Unique identifier for the server',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'ip',
              'short' => 'Server IP address',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'load',
              'short' => 'Current server load percentage',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'name',
              'short' => 'Display name of the server',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'port',
              'short' => 'Server port number',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'premium',
              'short' => 'Whether the server requires premium access',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'protocol',
              'short' => 'VPN protocol used (e.g., WireGuard)',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'publicKey',
              'short' => 'Public key for WireGuard connection',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'server',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/api/extension/servers',
                  'parts' => [
                    'api',
                    'extension',
                    'servers',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.servers`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return TechvpnFeatures::make_feature($name);
    }
}
