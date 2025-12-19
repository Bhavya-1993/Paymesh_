import kopf
import kubernetes as k8s

@kopf.on.create('payments.example.com', 'v1alpha1', 'paymentdatabases')
def create_db(name, namespace, spec, **_):
    core = k8s.CoreV1Api()
    apps = k8s.AppsV1Api()
    
    pvc = k8s.V1PersistentVolumeClaim(
        metadata=k8s.V1ObjectMeta(name=f'{name}-pvc'),
        spec=k8s.V1PersistentVolumeClaimSpec(
            access_modes=['ReadWriteOnce'],
            resources=k8s.V1ResourceRequirements(requests={'storage': spec.get('storageSize','1Gi')})
        )
    )
    core.create_namespaced_persistent_volume_claim(namespace, pvc)
    
    deployment = k8s.V1Deployment(
        metadata=k8s.V1ObjectMeta(name=name),
        spec=k8s.V1DeploymentSpec(
            replicas=1,
            selector={'matchLabels':{'app':name}},
            template=k8s.V1PodTemplateSpec(
                metadata=k8s.V1ObjectMeta(labels={'app':name}),
                spec=k8s.V1PodSpec(containers=[
                    k8s.V1Container(
                        name='postgres',
                        image='postgres:15',
                        env=[
                            k8s.V1EnvVar(name='POSTGRES_DB', value='payments'),
                            k8s.V1EnvVar(name='POSTGRES_PASSWORD', value='password')
                        ],
                        volume_mounts=[k8s.V1VolumeMount(name='data', mount_path='/var/lib/postgresql/data')]
                    )
                ],
                volumes=[k8s.V1Volume(
                    name='data',
                    persistent_volume_claim=k8s.V1PersistentVolumeClaimVolumeSource(claim_name=f'{name}-pvc')
                )])
            )
        )
    )
    apps.create_namespaced_deployment(namespace, deployment)

