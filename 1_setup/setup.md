# Webinar Trident
Webinar Trident: El orquestador de almacenamiento para contenedores

## Configuración inicial

### Instalación de Trident

El proceso de [instalación de Trident](https://netapp-trident.readthedocs.io/en/stable-v20.04/kubernetes/tridentctl-install.html#install-trident) puede consultarse en la web oficial. Los pasos realizados para la demo han sido lo siguiente.

Creación de nu nuevo namespace llamado 'trident'.

```shell
oc create namespace trident
```

Descargar la última versión de Trident y descomprimirlo.

```shell
wget https://github.com/NetApp/trident/releases/download/v20.04.0/trident-installer-20.04.0.tar.gz

tar -xf trident-installer-20.04.0.tar.gz

cd trident-installer
```

Instalar trident con el cliente 'tridentctl' sobre el namespace 'trident'

```shell
./tridentctl install -n trident
```

### Creación de backends de almacenamiento

Se han definido dos backends de almacenamiento, uno con el driver ontap-san, y otro con el driver ontap-nas.

```shell
tridentctl create backend --filename backend-nas.json -n trident
tridentctl create backend --filename backend-san.json -n trident
```

### Creación de clases de almacenamiento

Se han definido dos clases de almacenamiento, usando el aprovisionador CSI Trident y referenciando a los backends de almacenamiento previamente creados.

```shell
oc apply -f sc-san.yaml
oc apply -f sc-nas.yaml
```

Tras ello, se muestran los diferentes [modos de acceso](../2_access_mode/access_mode.md) al almacenamiento.
