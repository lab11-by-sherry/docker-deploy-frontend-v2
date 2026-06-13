#!/bin/sh
set -e
# 若无环境变量则使用默认后端地址
VITE_GRAPHQL_URI="${VITE_GRAPHQL_URI:-http://43.208.224.38:8082/graphql}"
VITE_SERVER_URI="${VITE_SERVER_URI:-http://43.208.224.38:8082}"
# 批量替换前端JS文件中的占位符
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_GRAPHQL_URI_PLACEHOLDER__|${VITE_GRAPHQL_URI}|g" {} +
find /usr/share/nginx/html/assets -name '*.js' -exec sed -i \
"s|__VITE_SERVER_URI_PLACEHOLDER__|${VITE_SERVER_URI}|g" {} +
echo "Configured VITE_GRAPHQL_URI=${VITE_GRAPHQL_URI}"
echo "Configured VITE_SERVER_URI=${VITE_SERVER_URI}"
exec nginx -g 'daemon off;'