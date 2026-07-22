<?php
declare(strict_types=1);

// Techvpn SDK utility: prepare_body

class TechvpnPrepareBody
{
    public static function call(TechvpnContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
