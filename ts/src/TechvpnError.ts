
import { Context } from './Context'


class TechvpnError extends Error {

  isTechvpnError = true

  sdk = 'Techvpn'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  TechvpnError
}

