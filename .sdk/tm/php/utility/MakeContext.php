<?php
declare(strict_types=1);

// Techvpn SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class TechvpnMakeContext
{
    public static function call(array $ctxmap, ?TechvpnContext $basectx): TechvpnContext
    {
        return new TechvpnContext($ctxmap, $basectx);
    }
}
