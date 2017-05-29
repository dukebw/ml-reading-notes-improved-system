# DevOps - Vithu

- Xebia Labs periodic table of dev ops.

## Cloud

- AWS/Azure/Google cloud/MAAS (Metal As A Service).

### AWS

- EBS - single EC2 instance.

- EFS - NFS (multiple EC2 instances, price delta with EBS).

- AWS CloudFormation: cluster specs in JSON/yaml config file.

- Samnco MAAS
        - deploy with Juju
        - provide your own servers

## Containerization

- Docker/Mesos/Swarm/Kubernetes

- Docker (LXe containers).

- Kubernetes
        - Google
        - Master, worker, flannel (network), etcd (DB), easyRSA
        - Parameter server

## Deployment

- Juju, Otto, CodeDeploy, RapidDeploy

### Juju

- `juju bootstrap maas`

- `juju deploy ...`

## Framework

- Juju (deployment)

- Docker + Kubernetes + TF (model training)

- AWS S3 (training data)

- Repository of TF models.

## Testing

- TravisCI to run Juju/Kubernetes.

- Bamboo.

- Jenkins.

## Other

- tfmesos
