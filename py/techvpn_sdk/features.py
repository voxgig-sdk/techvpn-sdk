# Techvpn SDK feature factory

from techvpn_sdk.feature.base_feature import TechvpnBaseFeature
from techvpn_sdk.feature.ratelimit_feature import TechvpnRatelimitFeature
from techvpn_sdk.feature.retry_feature import TechvpnRetryFeature
from techvpn_sdk.feature.test_feature import TechvpnTestFeature
from techvpn_sdk.feature.timeout_feature import TechvpnTimeoutFeature


_FEATURES = {
    "base": lambda: TechvpnBaseFeature(),
    "ratelimit": lambda: TechvpnRatelimitFeature(),
    "retry": lambda: TechvpnRetryFeature(),
    "test": lambda: TechvpnTestFeature(),
    "timeout": lambda: TechvpnTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
