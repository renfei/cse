# 微服务引擎 Local-CSE Docker 镜像

本地轻量化微服务引擎工具，快速在自己的本地电脑上使用 CSE

本地开发工具包含了本地轻量化微服务引擎，用于本地开发的轻量服务中心、配置中心，并提供简单的界面。

### 本地引擎资源配额限制

| 功能    | 资源           | 最大配额  |
|:------|:-------------|:------|
| 微服务管理 | 微服务版本数量（个）   | 10000 |
| 微服务管理 | 单个微服务实例数量（个） | 100   |
| 微服务管理 | 单个微服务契约数量（个） | 500   |
| 配置管理  | 配置数量（个）      | 600   |

## 拉取镜像或构建镜像

代码和镜像均部署在多个仓库平台，您可以选择您方便的：

- [https://github.com/renfei/cse](https://github.com/renfei/cse)
- [https://gitlab.com/renfei/cse](https://gitlab.com/renfei/cse)
- [https://jihulab.com/renfei/cse](https://jihulab.com/renfei/cse)

### 拉取镜像

#### GitHub

如果您希望从 GitHub 拉取镜像，请使用以下命令：

```shell
docker pull ghcr.io/renfei/cse:2.1.5
```

#### GitLib

如果您希望从 GitLib 拉取镜像，请使用以下命令：

```shell
docker pull registry.gitlab.com/renfei/cse:2.1.5
```

#### 极狐（中国）GitLib

如果您希望从 极狐（中国）GitLib 拉取镜像，请使用以下命令：

```shell
docker pull registry.jihulab.com/renfei/cse:2.1.5
```

### 构建镜像

如果您希望自己本地构建镜像，可直接构建，参考命令：

```shell
docker build -t cse:2.1.5 .
```

## 使用方式

Docker 启动命令：

```shell
docker run -d -p 30100:30100 -p 30103:30103 -p 30110:30110
```

### 控制台界面

在启动后使用浏览器访问：[http://localhost:30103](http://localhost:30103)

### 接口
服务注册
```shell
curl -X POST 'http://127.0.0.1:30100/v4/default/registry/microservices' -d '{"service":{"serviceName":"Demo"}}'
```

服务发现
```shell
curl -X GET 'http://127.0.0.1:30100/v4/default/registry/instances?appId=default&serviceName=Demo'
```

新建配置
```shell
curl -H 'Content-Type: application/json' -X POST 'http://127.0.0.1:30110/v1/default/kie/kv' -d '{"key":"spring.test","value":"{\"name\":\"demo\"}","value_type":"json","status":"enabled"}'
```

获取配置
```shell
curl -X GET 'http://127.0.0.1:30110/v1/default/kie/kv?key=spring.test'
```
