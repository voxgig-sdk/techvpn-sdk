# Techvpn SDK utility: make_context
require_relative '../core/context'
module TechvpnUtilities
  MakeContext = ->(ctxmap, basectx) {
    TechvpnContext.new(ctxmap, basectx)
  }
end
