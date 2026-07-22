<?php
declare(strict_types=1);

// Techvpn SDK exists test

require_once __DIR__ . '/../techvpn_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = TechvpnSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
