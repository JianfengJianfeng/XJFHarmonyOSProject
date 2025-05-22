import dataPreferences from '@ohos.data.preferences';
import WindowUtil from "./WindowUtil";

class PreferencesUtil {
  /**
   * 获取preferences
   * @param dbName
   * @returns
   */
  getPreferencesFromStorage(dbName:string): Promise<dataPreferences.Preferences> {
    return new Promise((resolve, reject) => {
      try {
        let context = WindowUtil.getContext();
        if (!context) {
          reject(new Error('xjf Context is not initialized'));
          return;
        }

        dataPreferences.getPreferences(context, dbName)
          .then((object) => {
            console.info("xjf Succeeded in getting preferences.");
            resolve(object);
          })
          .catch((err:Error) => {
            console.error("xjf Failed to get preferences. name =" + err.name + ", message =" + err.message);
            reject(err);
          });
      } catch (err) {
        console.error("xjf Failed to get preferences. code =" + err.code + ", message =" + err.message);
        reject(err);
      }
    });
  }

  /**
   * 获取存储的值
   * @param dbName
   * @param key
   * @returns
   */
  getPreferencesValue(dbName:string,key:string):Promise<string> {
    return new Promise((resolve,reject) => {
      try {
        this.getPreferencesFromStorage(dbName).then((preferences) => {
          if (preferences !== null) {
            preferences.get(key, '').then((data) => {
              console.info("xjf Succeeded in getting value of key: " + key + " data: " + data);
              resolve(data as string)
            }).catch((err:Error) => {
              console.error("xjf Failed to get value of 'startup'. name =" + err.name + ", message =" + err.message);
              reject(err)
            })
          }
        }).catch((err:Error) => {
          console.error("xjf Failed to get value of 'startup'. name =" + err.name + ", message =" + err.message);
          reject(err)
        })
      } catch (err) {
        console.error("xjf Failed to get value of 'startup'. code =" + err.code + ", message =" + err.message);
        reject(err)
      }
    })
  }

  /**
   * 存储值
   * @param dbName
   * @param key
   * @param data
   */
  putPreferenceValue(dbName:string, key: string, data: string) {
    try {
      this.getPreferencesFromStorage(dbName).then((preferences) => {
        preferences.put(key, data).then(() => {
          console.info("xjf Succeeded in putting value of key:" + key + " data:" + data);
          preferences.flush().then(() => {
            console.info("xjf Succeeded in flushing.");
          }).catch((err:Error) => {
            console.error("xjf Failed to flush. name =" + err.name + ", message =" + err.message);
          })
        }).catch((err:Error) => {
          console.error("xjf Failed to put value of 'startup'. name =" + err.name +", message =" + err.message);
        })
      }).catch((err:Error) => {
        console.error("xjf Failed to put value of 'startup'. name =" + err.name +", message =" + err.message);
      })
    } catch (err) {
      console.error("xjf Failed to put value of 'startup'. code =" + err.code +", message =" + err.message);
    }
  }
  /**
   * 刷新下当前数据
   * @param dbName
   */
  flushPreferenceValue(dbName:string) {
    try {
      this.getPreferencesFromStorage(dbName).then((preferences) =>{
        preferences.flush().then(() => {
          console.info("xjf Succeeded in flushing.");
        }).catch((err:Error) => {
          console.error("xjf Failed to flush. name =" + err.name + ", message =" + err.message);
        })
      }).catch((err:Error) => {
        console.error("xjf Failed to flush. name =" + err.name + ", message =" + err.message);
      })
    } catch (err) {
      console.error("xjf Failed to flush. code =" + err.code + ", message =" + err.message);
    }
  }

}

let preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil;