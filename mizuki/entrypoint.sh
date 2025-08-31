#!/bin/sh
set -e

# 初始化挂载目录（如果为空）
init_directory() {
    if [ -d "$RUN_DIR" ] && [ -z "$(ls -A "$RUN_DIR")" ]; then
        echo "Initializing $RUN_DIR with default content from $PROJECT_DIR"
        cp -r "$PROJECT_DIR"/* "$RUN_DIR"/
    fi
}

# 执行初始化
init_directory

# 切换到运行目录
cd $RUN_DIR

# 启动命令
if [ "$1" = "bash" ]; then
    exec bash
else
    rm -rf "${PROJECT_DIR}"
    exec pnpm dev --host --port "${WEB_DEV_PORT}"

fi