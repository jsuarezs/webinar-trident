# Webinar Trident
Webinar Trident: El orquestador de almacenamiento para contenedores

## Modos de acceso

A PersistentVolume can be mounted on a host in any way supported by the resource provider. Providers have different capabilities and each PV’s access modes are set to the specific modes supported by that particular volume.

Claims are matched to volumes with similar access modes. The only two matching criteria are access modes and size. A claim’s access modes represent a request. 

| Modo de acceso | Abreviación | Descripción |
| :-------------: |:-----------:| :-----------|
| ReadWriteOnce | RWO | El volumen puede ser montado como lectura-escritura por un solo nodo |
| ReadOnlyMany  | ROW | El volumen puede ser montado como de solo lectura por muchos nodos   |
| ReadWriteMany | RWM | El volumen puede ser montado como lectura-escritura por muchos nodos |

### Creación de un namespace

```shell
oc create namespace 2-access-mode
```

### Creación de un PVC de tipo Read Write Only

<img src="images/pvc-rwo-gui.png">

```shell
oc apply -f pvc-rwo.yaml -n 2-access-mode
```

```shell
oc get pvc -n 2-access-mode
NAME      STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-rwo   Bound    pvc-d9de6209-0d6d-4bd0-b216-6438a9a999f4   1Gi        RWO            san            3m14s
```
### Creación de un PVC de tipo Read Write Many

<img src="images/pvc-rwm-gui.png">

```shell
oc apply -f pvc-rwm.yaml -n 2-access-mode
```

```shell
oc get pvc -n 2-access-mode
NAME      STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-rwm   Bound    pvc-56717527-d465-4316-95bd-0b901d8cbd7a   1Gi        RWX            nas            69s
pvc-rwo   Bound    pvc-d9de6209-0d6d-4bd0-b216-6438a9a999f4   1Gi        RWO            san            3m14s
```

### Volumenes persistentes creados

<img src="images/pvs.png">

```shell
oc get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                   STORAGECLASS   REASON   AGE
pvc-56717527-d465-4316-95bd-0b901d8cbd7a   1Gi        RWX            Delete           Bound    2-access-mode/pvc-rwm   nas                     2m11s
pvc-d9de6209-0d6d-4bd0-b216-6438a9a999f4   1Gi        RWO            Delete           Bound    2-access-mode/pvc-rwo   san                     4m15s
```


<img src="images/ontap-volumes.png">

<img src="images/ontap-luns.png">


```shell
clusterlab::> volume show -vserver SVM_Lab -volume *trident*
Vserver   Volume       Aggregate    State      Type       Size  Available Used%
--------- ------------ ------------ ---------- ---- ---------- ---------- -----
SVM_Lab   trident_pvc_56717527_d465_4316_95bd_0b901d8cbd7a aggr_nodo02_DATOS online RW 1GB 1023MB  0%
SVM_Lab   trident_pvc_d9de6209_0d6d_4bd0_b216_6438a9a999f4 aggr_nodo02_DATOS online RW 1GB 1023MB  0%
2 entries were displayed.

clusterlab::> lun show -vserver SVM_Lab
Vserver   Path                            State   Mapped   Type        Size
--------- ------------------------------- ------- -------- -------- --------
SVM_Lab   /vol/trident_pvc_d9de6209_0d6d_4bd0_b216_6438a9a999f4/lun0 online mapped linux 1GB
```


### Ejecución de un POD con acceso RWO

### Ejecución de un POD con acceso RWM

El siguiente ejemplo muestra la forma de consumir almacenamiento según dos tipos de [controladores de Kubernetes](../3_k8s_controllers/3_k8s_controllers.md).

