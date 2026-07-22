<?php
declare(strict_types=1);

// Techvpn SDK utility: result_body

class TechvpnResultBody
{
    public static function call(TechvpnContext $ctx): ?TechvpnResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
