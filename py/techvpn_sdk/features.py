# Techvpn SDK feature factory

from techvpn_sdk.feature.base_feature import TechvpnBaseFeature
from techvpn_sdk.feature.test_feature import TechvpnTestFeature


def _make_feature(name):
    features = {
        "base": lambda: TechvpnBaseFeature(),
        "test": lambda: TechvpnTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
