## 01_HPA
你必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000050
Task
在 autoscale namespace 中创建一个名为 apache-server 的新 HorizontalPodAutoscaler(HPA)。此 HPA 必须定位到 autoscale namespace 中名为 apache-server
的现有 Deployment 。
将 HPA 设置为每个 Pod 的 CPU 使用率旨在 50% 。将其配置为至少有 1 个 Pod，且不超过 4 个 Pod 。此外，将缩小稳定窗口设置为 30 秒。

```bash
kubectl create namespace autoscale
kubectl -n autoscale apply -f .\01_hpa.yaml
kubectl -n autoscale autoscale deployments/apache-server --min=1 --max=4 --cpu-percent=50 
```

## 02_ingress
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000024
如下创建新的 Ingress 资源：
名称： echo
Namespace： sound-repeater
使用 Service 端口 8080 在 http://example.org/echo 上公开 echoserver-service Service。
可以使用以下命令检查 echoserver-service Service 的可用性，该命令应返回 Hello World ^_^：
candidate@master01:~$ curl http://example.org/echo

```bash
kubectl create namespace sound-repeater
kubectl -n sound-repeater apply -f .\02_ingress.yaml
```

## 03_sidecar
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000037
Context
您需要将一个传统应用程序集成到 Kubernetes 的日志架构(例如 kubectl logs)中。
实现这个要求的通常方法是添加一个流式传输并置容器。
Task
更新现有的 synergy-leverager Deployment，
将使用 busybox:stable 镜像，且名为 sidecar 的并置容器，添加到现有的 Pod 。
新的并置容器必须运行以下命令：
/bin/sh -c "tail -n+1 -f /var/log/synergy-leverager.log"
使用挂载在 /var/log 的 Volume，使日志文件 synergy-leverager.log 可供并置容器使用。
除了添加所需的卷挂载之外，请勿修改现有容器的规范

```bash
kubectl apply -f .\03_sidecar
```

## 04_StorageClass
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000046
Task
首先，为名为 rancher.io/local-path 的现有制备器，创建一个名为 ran-local-path 的新 StorageClass
将卷绑定模式设置为 WaitForFirstConsumer
注意，没有设置卷绑定模式，或者将其设置为 WaitForFirstConsumer 之外的其他任何模式，都将导致分数降低。
接下来，将 ran-local-path StorageClass 配置为默认的 StorageClass
请勿修改任何现有的 Deployment 和 PersistentVolumeClaim，否则将导致分数降低。

```bash
kubectl apply -f ./04_storageclass.yaml
```

## 05_Service
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000022
Task
重新配置 spline-reticulator namespace 中现有的 front-end Deployment，以公开现有容器 nginx 的端口 80/tcp
创建一个名为 front-end-svc 的新 Service ，以公开容器端口 80/tcp
配置新的 Service ，以通过 NodePort 公开各个 Pod

## 06_Pod 优先级 PriorityClass
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000049
Task
请执行以下任务：
为用户工作负载创建一个名为 high-priority 的新 PriorityClass ，其值比用户定义的现有最高优先级类值小一。
修改在 priority namespace 中运行的现有 busybox-logger Deployment ，以使用 high-priority 优先级类。
确保 busybox-logger Deployment 在设置了新优先级类后成功部署。
请勿修改在 priority namespace 中运行的其他 Deployment，否则可能导致分数降低。

```bash
kubectl apply -f 06_pod_priorityclass.yaml
```

## 07_argo CD
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000060
Quick Reference
文档 Argo Helm Charts https://argoproj.github.io/argo-helm/
Task
通过执行以下任务在集群中安装 Argo CD：
添加名为 argo 的官方 Argo CD Helm 存储库。
注意：Argo CD CRD 已在集群中预安装。
为 argocd namespace 生成 Argo CD Helm 图表版本 5.5.22 的模板，并将其保存到 ~/argo-helm.yaml ，将图表配置为不安装 CRDs 。
使用 Helm 安装 Argo CD ，并设置发布名称为 argocd ，使用与模板中相同的配置和版本（5.5.22） ，
将其安装在 argocd namespace 中，并配置为不安装 CRDs 。
注意：您不需要配置对 Argo CD 服务器 UI 的访问权限。

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm search repo argo | grep argo-cd
helm template argocd argo/argo-cd --version 5.5.22 --namespace argocd --set crds.install=false > ~/argo-helm.yaml
helpm install argocd argo/argo-cd --version 5.5.22 --namespace argocd --set crds.install=false

kubectl -n argocd get pods

```

## 08_pvc
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000047
Task
mariadb namespace 中的 MariaDB Deployment 被误删除。请恢复该 Deployment 并确保数据持久性。请按照以下步骤：
如下规格在 mariadb namespace 中创建名为 mariadb 的 PersistentVolumeClaim (PVC)：
访问模式为 ReadWriteOnce
存储为 250Mi
集群中现有一个 PersistentVolume。
您必须使用现有的 PersistentVolume (PV)。
编辑位于 ~/mariadb-deployment.yaml 的 MariaDB Deployment 文件，以使用上一步中创建的 PVC。
将更新的 Deployment 文件应用到集群。
确保 MariaDB Deployment 正在运行且稳定。
```bash
kubectl create namespace mariadb
kubectl -n mariadb apply -f .\08_pvc.yaml
```

## 09_Gateway
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000057
Task
将现有 Web 应用程序从 Ingress 迁移到 Gateway API。您必须维护 HTTPS 访问权限。
注意：集群中安装了一个名为 nginx 的 GatewayClass 。
首先，创建一个名为 web-gateway 的 Gateway ，主机名为 gateway.web.k8s.local ，并保持现有名为 web 的 Ingress 资源的现有 TLS 和侦听器配置。
接下来，创建一个名为 web-route 的 HTTPRoute ，主机名为 gateway.web.k8s.local ，并保持现有名为 web 的 Ingress 资源的现有路由规则。
您可以使用以下命令测试 Gateway API 配置：
[candidate@cka000057]$ curl -Lk https://gateway.web.k8s.local:31443
最后，删除名为 web 的现有 Ingress 资源。

## NetworkPolicy
您必须连接到正确的主机。不这样做可能导致零分。
[candidate@base] $ ssh cka000056
Task
从提供的 YAML 样本中查看并应用适当的 NetworkPolicy。
确保选择的 NetworkPolicy 不过于宽松，同时允许运行在 frontend 和 backend namespaces 中的 frontend 和 backend Deployment 之间的通信。
首先，分析 frontend 和 backend Deployment，以确定需要应用的 NetworkPolicy 的具体要求。
接下来，检查位于 ~/netpol 文件夹中的 NetworkPolicy YAML 示例。
注意：请勿删除或修改提供的示例。仅应用其中一个。否则可能会导致分数降低。
最后，应用启用 frontend 和 backend Deployment 之间的通信的 NetworkPolicy，但不要过于宽容。
注意：请勿删除或修改现有的默认拒绝所有入站流量或出口流量 NetworkPolicy。否则可能导致零分。