#!/bin/bash
apk add curl 2>/dev/null || true
check_cms() {
  TIMEOUT=10
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -m $10 http://localhost:3000/health)
  if [ $RESPONSE -ge 200 ] && [ $RESPONSE -lt 300 ]; then
    return 0
  fi
  if [ $? -ne 0 ]; then
    return -1
  fi
  return -1
}
check_health() {
  TIMEOUT=10
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -m $10 $URL)
  if [ $RESPONSE -ge 200 ] && [ $RESPONSE -lt 300 ]; then
    return 0
  fi
  if [ $? -ne 0 ]; then
    return -1
  fi
  return -1
}
check_cms && check_health
exit $?
# #!/bin/bash
# check_readiness() {
#   TIMEOUT=10
#   RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -m $TIMEOUT $URL)
#   if [ $RESPONSE -ge 200 ] && [ $RESPONSE -lt 300 ]; then
#     return 0
#   fi
#   if [ $? -ne 0 ]; then
#     return -1
#   fi
#   return -1
# }
# check_readiness
# exit $?
