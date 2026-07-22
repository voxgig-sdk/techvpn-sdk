# frozen_string_literal: true

# Typed models for the Techvpn SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Server entity data model.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_code
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ip
#   @return [String, nil]
#
# @!attribute [rw] load
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] port
#   @return [Integer, nil]
#
# @!attribute [rw] premium
#   @return [Boolean, nil]
#
# @!attribute [rw] protocol
#   @return [String, nil]
#
# @!attribute [rw] public_key
#   @return [String, nil]
Server = Struct.new(
  :city,
  :country,
  :country_code,
  :id,
  :ip,
  :load,
  :name,
  :port,
  :premium,
  :protocol,
  :public_key,
  keyword_init: true
)

# Request payload for Server#list.
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_code
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] ip
#   @return [String, nil]
#
# @!attribute [rw] load
#   @return [Float, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] port
#   @return [Integer, nil]
#
# @!attribute [rw] premium
#   @return [Boolean, nil]
#
# @!attribute [rw] protocol
#   @return [String, nil]
#
# @!attribute [rw] public_key
#   @return [String, nil]
ServerListMatch = Struct.new(
  :city,
  :country,
  :country_code,
  :id,
  :ip,
  :load,
  :name,
  :port,
  :premium,
  :protocol,
  :public_key,
  keyword_init: true
)

