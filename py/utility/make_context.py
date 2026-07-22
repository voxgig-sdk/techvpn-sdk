# Techvpn SDK utility: make_context

from core.context import TechvpnContext


def make_context_util(ctxmap, basectx):
    return TechvpnContext(ctxmap, basectx)
