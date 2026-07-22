// Typed models for the Techvpn SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Server {
  city?: string
  country?: string
  country_code?: string
  id?: string
  ip?: string
  load?: number
  name?: string
  port?: number
  premium?: boolean
  protocol?: string
  public_key?: string
}

export interface ServerListMatch {
  city?: string
  country?: string
  country_code?: string
  id?: string
  ip?: string
  load?: number
  name?: string
  port?: number
  premium?: boolean
  protocol?: string
  public_key?: string
}

