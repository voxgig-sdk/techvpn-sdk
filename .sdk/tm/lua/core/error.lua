-- Techvpn SDK error

local TechvpnError = {}
TechvpnError.__index = TechvpnError


function TechvpnError.new(code, msg, ctx)
  local self = setmetatable({}, TechvpnError)
  self.is_sdk_error = true
  self.sdk = "Techvpn"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function TechvpnError:error()
  return self.msg
end


function TechvpnError:__tostring()
  return self.msg
end


return TechvpnError
