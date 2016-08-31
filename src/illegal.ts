import * as base from './base';

export function testFunc(i: number) {
  return '';
}

export class TestGetter implements base.BaseGetter {
  public gets(): util.Thenable<string[]> {
    return util.consumeLoopAsync(
      { index: 1, datas: <string[]>[], },
      (v) => {
          return {
              status: false,
              value: v,
          }
      }
      .then((v) => v.datas)
      ;
  }

  public get(obj: Object): util.Thenable<Object> {
    return util.Promise.resolve(obj)
      ;
  }
}
