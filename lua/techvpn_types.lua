-- Typed models for the Techvpn SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Server
---@field city? string
---@field country? string
---@field country_code? string
---@field id? string
---@field ip? string
---@field load? number
---@field name? string
---@field port? number
---@field premium? boolean
---@field protocol? string
---@field public_key? string

---@class ServerListMatch
---@field city? string
---@field country? string
---@field country_code? string
---@field id? string
---@field ip? string
---@field load? number
---@field name? string
---@field port? number
---@field premium? boolean
---@field protocol? string
---@field public_key? string

local M = {}

return M
