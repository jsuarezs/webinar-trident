# Webinar Trident
Webinar Trident: El orquestador de almacenamiento para contenedores

>  SLIDE 1

## Modos de acceso

>  SLIDE 2

Un Persistent Volume se puede montar en un host de cualquier forma admitida por el proveedor de recursos. Los proveedores tienen diferentes capacidades y los modos de acceso de cada PV se configuran en los modos específicos admitidos por ese volumen en particular.

Los Persistent Volume Claims se emparejan a los Persistent Volume con modos de acceso similares. Los únicos dos criterios que han de coincidir son el modo de acceso y el tamaño.

| Modo de acceso | Abreviación | Descripción |
| :-------------: |:-----------:| :-----------|
| ReadWriteOnce | RWO | El volumen puede ser montado como lectura-escritura por un solo nodo |
| ReadOnlyMany  | ROW | El volumen puede ser montado como de solo lectura por muchos nodos   |
| ReadWriteMany | RWM | El volumen puede ser montado como lectura-escritura por muchos nodos |

>  SLIDE 3

### Creación de un PVC de tipo Read Write Only

Se crea un PVC de tipo Read Write Only

<img src="images/pvc-rwo-gui.png">

### Creación de un PVC de tipo Read Write Many

Se crea un PVC de tipo Read Write Many

<img src="images/pvc-rwm-gui.png">

### Volumenes persistentes creados

Se verifican los Persisten Volumes creados.

<img src="images/pvs.png">

Se verifican los volúmenes que Trident ha creado automáticamente en ONTAP.

<img src="images/ontap-volumes.png">

Se verifican la LUN que Trident ha creado automáticamente en ONTAP.

<img src="images/ontap-luns.png">

### Ejecución de aplicaciones (POD en un Deployment) con acceso RWM y con acceso RWO

Desde la parte de Developer de OpenShift Container Platform, se accede a Topology a se selecciona 'From Catalog'.

<img src="images/create_app_from_catalog_1.png">

Se busca la plantilla ya creada por 'hello'.

<img src="images/create_app_from_catalog_2.png">

Se instancia la plantilla.

<img src="images/create_app_from_catalog_3.png">

Se crea una aplicación basada en la planilla hello-world con acceso a un PVC existente de tipo RWM.

<img src="images/create_app_from_catalog_4_rwm.png">

Se repiten los 3 pasos anteriores y se crea una aplicación basada en la planilla hello-world con acceso a un PVC existente de tipo RWO.

<img src="images/create_app_from_catalog_5_rwo.png">

Se observa que se terminan de desplegar las aplicaciones y se accede a la web de cada una de ellas.

<img src="images/create_app_from_catalog_6.png">

Se muestra que el punto de montaje del PVC RWM usado es un NFS.

<img src="images/create_app_from_catalog_7_rwm.png">

Se muestra que el punto de montaje del PVC RWO usado es una LUN.

<img src="images/create_app_from_catalog_8_rwo.png">


El siguiente ejemplo muestra la forma de consumir almacenamiento según dos tipos de [controladores de Kubernetes](../3_k8s_controllers/k8s_controllers.md).

