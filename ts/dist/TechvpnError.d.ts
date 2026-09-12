import { Context } from './Context';
declare class TechvpnError extends Error {
    isTechvpnError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { TechvpnError };
