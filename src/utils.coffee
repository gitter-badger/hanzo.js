exports.isFunction = (fn) -> typeof fn is 'function'
exports.isString   = (s)  -> typeof s  is 'string'

exports.statusOk      = (res) -> res.status is 200
exports.statusCreated = (res) -> res.status is 201

exports.newError = (data, res) ->
  message = res?.data?.error?.message ? 'Request failed'

  err = new Error message
  err.message = message

  err.req     = data
  err.res     = res
  res.data    = res.data
  err.status  = res.status
  err.type    = res.data?.error?.type
  err
