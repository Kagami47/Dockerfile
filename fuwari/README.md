进入Dockerfile的目录
```
cd ./Dockerfile/fuwari
```
构建镜像
```
docker build --no-cache -t fuwari .
```
创建容器
```
docker run -d \
  --name Fuwari \
  --restart=unless-stopped \
  --network bridge \
  -p 4321:4321 \
  -v /opt/fuwari:/fuwari \
  fuwari:latest
