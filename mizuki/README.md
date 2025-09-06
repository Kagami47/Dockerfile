进入Dockerfile的目录
```
cd ./Dockerfile/mizuki
```
构建镜像
```
docker build --no-cache -t mizuki .
```
创建容器
```
docker run -d \
  --name Mizuki \
  --restart=unless-stopped \
  --network bridge \
  -p 4321:4321 \
  -v /opt/mizuki:/mizuki \
  mizuki:latest
