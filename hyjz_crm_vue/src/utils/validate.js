/**
 * 邮箱
 * @param {*} s
 */
export function isEmail (s) {
  return /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(s)
}

/**
 * 手机号码
 * @param {*} s
 */
export function isMobile (s) {
  return /^1[0-9]{10}$/.test(s)
}

/**
 * 电话号码
 * @param {*} s
 */
export function isPhone (s) {
  return /^([0-9]{3,4}-)?[0-9]{7,8}$/.test(s)
}

/**
 * URL地址
 * @param {*} s
 */
export function isURL (s) {
  return /^http[s]?:\/\/.*/.test(s)
}

/**
 * 是否为空
 * @param {*} s
 */
export function isEmpty (s) {
  return !s || s.replace(/\s+/g, '') === ''
}

/**
 * 通用名称 中文、字母、数字、下划线、中划线
 * @param {*} s
 * @param minLen 最小长度
 * @param maxLen 最大长度
 */
export function commonName (s, minLen, maxLen) {
  if (minLen === undefined) {
    minLen = 1
  }
  if (maxLen === undefined) {
    maxLen = 32
  }
  let re = new RegExp('^[\u4E00-\u9FA5a-zA-Z0-9_-]{' + minLen + ',' + maxLen + '}$')
  return re.test(s)
}

/**
 * 通用金钱 两位小数
 * @param {*} s
 */
export function commonMoney (s) {
  return /^[0-9]+(\.[0-9]{2})?$/.test(s)
}

/**
 * 小数 可以负数
 * @param {*} s
 */
export function floatNumber (s) {
  return /^-?[0-9]+(\.[0-9]{2})?$/.test(s)
}

export function doValidate (rules, obj, field) {
  let errorMsg = ''
  for (let key in rules) {
    if (errorMsg) {
      break
    }
    if (field && field !== key) {
      continue
    }
    let rule = rules[key]
    for (let i = 0; i < rule.length && !errorMsg; i++) {
      if (rule[i].required && isEmpty(obj[key])) {
        errorMsg = rule[i].message
      } else if (rule[i].pattern) {
        if (obj[key] === undefined || !new RegExp(rule[i].pattern).test(obj[key])) {
          errorMsg = rule[i].message
        }
      } else if (rule[i].validator && !rule[i].validator(obj[key])) {
        errorMsg = rule[i].message
      }
    }
  }
  return errorMsg
}
