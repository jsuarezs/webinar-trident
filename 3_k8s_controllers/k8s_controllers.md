# Webinar Trident
Webinar Trident: El orquestador de almacenamiento para contenedores

## Controladores de Kubernetes

>  SLIDE 4

Existen varios tipos de controladores de Kubernetes:
- ReplicaSet
- Deployment
- StatefulSet
- DaemonSet

Los Deployment, inicialmente creados para aplicaciones stateless, se utilizan cuando el modo de acceso al Persistent Volume es Read-Write-Many. Los StatefulSet, creados para aplicaciones stateful, se utilizan cuando el modo de acceso al Persistent Volume es Read-Write-Once.

<img src="images/deployment_vs_statefulset.png">

### Ejecución de aplicaciones To-Do basada en una arquitectura de 3 capas

>  SLIDE 5

En este ejemplo se despliega una sencilla aplicación basada en una arquitectura de 3 capas: frontal web para la capa de presentación, un servicio API para la capa de aplicación y un backend para la capa de datos.

<img src="images/ToDo_app_3tier_architecture.png">

Desde la parte de Developer de OpenShift Container Platform, se accede a Topology a se selecciona 'From Catalog'.

<img src="images/create_todo-app_from_catalog_1.png">

Se busca la aplicación To-Do

<img src="images/create_todo-app_from_catalog_2.png">

Se instancia la plantilla.

<img src="images/create_todo-app_from_catalog_3.png">

Se cambian los variables que se desean:

<img src="images/create_todo-app_from_catalog_4.png">

### Verificación de la aplicación

Tras unos minutos se comprueba el estado de la aplicación.

<img src="images/create_todo-app_from_catalog_5.png">

Se verifica los Persistent Volume Claims creados.

<img src="images/create_todo-app_from_catalog_6.png">

Se verifica los Persistent Volumes creados.

<img src="images/create_todo-app_from_catalog_7.png">

### Escalado horizontal de la aplicación

Un ejemplo de escalado del frontal web para la capa de presentación creado como un Deployment.

<img src="images/scale_app_1.png">

Un ejemplo de escalado del frontal web para la capa de presentación creado como un Statefulset.

<img src="images/scale_app_2.png">

Se edita el fichero YAML pasando las réplicas de 1 a 2.

<img src="images/scale_app_3.png">

Se verifican el número de PODs en el deployment y el statefulset.

<img src="images/scale_app_4.png">

<img src="images/scale_app_5.png">

Se verifica los Persistent Volume Claims creados.

<img src="images/scale_app_6.png">

Se verifica los Persistent Volumes creados.

<img src="images/scale_app_7.png">

El siguiente ejemplo muestra la funcionalidad [volume import](../4_volume_import/volume_import.md) de Trident.

