# ProjectName SDK exists test

import pytest
from techvpn_sdk import TechvpnSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = TechvpnSDK.test(None, None)
        assert testsdk is not None
