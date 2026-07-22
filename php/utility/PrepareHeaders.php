<?php
declare(strict_types=1);

// Techvpn SDK utility: prepare_headers

class TechvpnPrepareHeaders
{
    public static function call(TechvpnContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}
