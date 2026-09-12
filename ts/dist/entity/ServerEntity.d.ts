import { TechvpnEntityBase } from '../TechvpnEntityBase';
import type { TechvpnSDK } from '../TechvpnSDK';
import type { Control } from '../types';
import type { Server, ServerListMatch } from '../TechvpnTypes';
declare class ServerEntity extends TechvpnEntityBase<Server> {
    constructor(client: TechvpnSDK, entopts: any);
    make(this: ServerEntity): ServerEntity;
    list(this: any, reqmatch?: ServerListMatch, ctrl?: Control): Promise<ServerEntity[]>;
}
export { ServerEntity };
