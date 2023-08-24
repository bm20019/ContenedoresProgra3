# Postgres y pgAdmin con Docker  - Debian 12

#### Version de docker

 1. Docker 24.0.5
 2. Docker-compose v2.20.2

#### Desinstalar versiones anteriores de docker

##### Paquetes no oficiales

- `docker.io`
- `docker-compose`
- `docker-doc`
- `podman-docker`

 ``` consola
 for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
 ```

##### Desinstalar Docker Engine

Elimina los paquetes de docker

``` console
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

Elimina los directorios de docker para hacer la desintalacion limpia

``` console
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

## Pasos para instalar docker y docker-compose en Debian 12

### Configurar repositorios

1. Actualizar repositorios he instalar paquetes:
    > sudo apt update
    > sudo apt install ca-certificates curl gnupg
2. Agregar la clave GPG (GNU Privacy Guard) oficial de Docker a tu sistema.
    > sudo install -m 0755 -d /etc/apt/keyrings
    > curl -fsSL <https://download.docker.com/linux/debian/gpg> | sudo gpg --dearmor -o  /etc/apt/keyrings/docker.gpg
    >sudo chmod a+r /etc/apt/keyrings/docker.gpg
3. Configura una nueva fuente de repositorio en el sistema.

    ```console
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```

4. Actualizar repositorios

 > sudo apt update

### Instalar Docker Engine (Ultima version estable)

1. Ejecutar apt para instalar.

 ``` console
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 ```

2. Probar la instalacion de Docker.

 > sudo docker run hello-world

### Instalar Docker-Compose (latest)

1. Descargar docker-compose en su ultima version, he instalar docker-compose en "/usr/local/bin"

 ``` console
 sudo curl -SL https://github.com/docker/compose/releases/download/$(curl https://api.github.com/repos/docker/compose/releases/latest | grep -o '"tag_name": "[^"]*"' | grep -o 'v[^"]*')/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
 ```

2. Utilizar chmod para darle permisos de ejecución.

 >sudo chmod +x /usr/local/bin/docker-compose

3. Prueba docker-compose

 >docker-compose version

 TIP
 Si al ejecutar el comando 'docker-compose' falla o no se encuentra, revisa el $PATH.
 O crea un link simbolico en la ruta '/usr/bin/' o "/bin/".
 >sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

## Sin Sudo

Para poder utilizar docker sin necesidad de utilizar el comando 'sudo' (Manage Docker as a non-root user),
es necesario crear un grupo llamado 'docker' y despues agregar nuestro usuario a tal grupo.

1. Crea un nuevo usuario

> sudo groupadd docker

2. Agrega tu usuario al nuevo grupo 'docker'

> sudo usermod -aG docker $USER

3. Cierra sesion y vuelve a iniciar para poder ver los cambios.

4. Comprueba que el proceso se halla completado

> docker run hello-world
