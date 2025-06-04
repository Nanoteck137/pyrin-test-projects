import { z } from "zod";
import * as api from "./types";
import { BaseApiClient, createUrl, type ExtraOptions } from "./base-client";


export class ApiClient extends BaseApiClient {
  url: ClientUrls;

  constructor(baseUrl: string) {
    super(baseUrl);
    this.url = new ClientUrls(baseUrl);
  }
  
  
  test(bid: string, body: api.LelBody, options?: ExtraOptions) {
    return this.request(`/api/v1/test/${bid}`, "POST", z.undefined(), z.any(), body, options)
  }
  
  test2(body: FormData, options?: ExtraOptions) {
    return this.requestForm("/api/v1/test", "POST", z.undefined(), z.any(), body, options)
  }
}

export class ClientUrls {
  baseUrl: string;

  constructor(baseUrl: string) {
    this.baseUrl = baseUrl;
  }
  
  getFile() {
    return createUrl(this.baseUrl, "/file")
  }
  
  test(bid: string) {
    return createUrl(this.baseUrl, `/api/v1/test/${bid}`)
  }
  
  test2() {
    return createUrl(this.baseUrl, "/api/v1/test")
  }
}
