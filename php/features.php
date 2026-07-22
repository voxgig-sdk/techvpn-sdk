<?php
declare(strict_types=1);

// Techvpn SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class TechvpnFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new TechvpnBaseFeature();
            case "test":
                return new TechvpnTestFeature();
            default:
                return new TechvpnBaseFeature();
        }
    }
}
