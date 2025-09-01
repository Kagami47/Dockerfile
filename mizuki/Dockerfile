# 使用 node:current-alpine 作为基础镜像
FROM node:current-alpine

# 设置环境变量
ENV PROJECT_DIR=/mizuki_source \
    RUN_DIR=/mizuki \
    PNPM_HOME=/root/.local/share/pnpm \
    WEB_DEV_PORT=4321

# 安装必要依赖
RUN apk add --update --no-cache \
    git \
    bash \
    && npm install -g \
    pnpm@latest

# 创建项目目录并设置工作目录
WORKDIR $PROJECT_DIR

# 克隆项目并安装依赖
RUN git clone https://github.com/saicaca/fuwari.git . \
    && pnpm install --child-concurrency=1 

# 复制 entrypoint 脚本并设置权限
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 暴露端口
EXPOSE ${WEB_DEV_PORT}

# 设置入口点
ENTRYPOINT ["/entrypoint.sh"]

# 最终运行目录
WORKDIR $RUN_DIR
