## spanish version off<br>
# Continuous Integration / Continuous Deployment

this is a translate of the proyect "Continuous Integration / Continuous Deployment
" for Holberton School.
<br><br><br><br>
<br>

# Objetivos de aprendizaje

Este proyecto tiene como objetivo practicar con Integración Continua (CI) / Entrega (CD) / Despliegue para comprender las diferencias, los objetivos y el valor.

Después de este proyecto, usted debería ser capaz de:

- Implementar flujos de trabajo de integración continua mediante GitHub Actions
- Indicar si el flujo de trabajo de una GitHub Action determinada se trata de Integración continua (CI), Entrega continua (CD) o Implementación continua (habilidad de análisis de contexto)
- Comprenda los desafíos de la reproductibilidad de compilación mediante la administración de dependencias de compilación mediante paquetes APT, NPM, pip de Python3 y descargas binarias directas.
- Cree en colaboración una canalización de entrega de software y produzca artefactos publicados, incluida la documentación de los cambios y el uso
- Implemente continuamente un sitio web estático en Netlify

<br><br><br>

# requisitos previos
## Conceptos
Debe tener un conocimiento básico de los siguientes conceptos:

- Qué es y cómo usar etiquetas git
- Conceptos básicos de qué es y cómo usar un "Release" de GitHub
- Qué es y cómo crear/usar un archivo ZIP
- Sepa cómo escribir un archivo YAML válido

<br><br><br>

## Tooling
Este proyecto necesita las siguientes herramientas/servicios:

### Las líneas de comando
- yq v4.5.0
- shellcheck v0.*
- yamlint v1.*
- jq v1.*

<br><br><br>

# Historia
Continuando con su viaje como ingeniero de software en Awesome Inc., desea brindar una visibilidad temprana de su trabajo a sus colegas para permitirle iterar sobre los problemas o mejoras más importantes para la empresa.

Al definir una canalización de entrega de software con tareas automatizadas, se asegurará de que se mejore la colaboración entre los equipos y de que su equipo crezca en madurez mientras proporciona un proceso eficiente para garantizar que pueda entregar la aplicación con frecuencia.

<br><br><br>

# Lecturas de referencia

https://docs.github.com/en/actions<br>
https://docs.github.com/en/github/administering-a-repository/managing-releases-in-a-repository<br>
https://git-scm.com/book/en/v2/Git-Basics-Tagging<br>
http://martinfowler.com/articles/continuousIntegration.html<br>
http://martinfowler.com/bliki/ContinuousDelivery.html<br>
http://blog.arungupta.me/continuous-integration-delivery-deployment-maturity-model<br>
https://github.com/softprops/action-gh-release<br>
https://github.com/marketplace/actions/netlify-actions<br>
https://docs.netlify.com/cli/get-started/#obtain-a-token-via-the-command-line<br>
https://docs.netlify.com/cli/get-started/<br>
https://www.netlify.com/<br>
https://github.com/release-drafter/release-drafter<br>
https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests<br>
https://github.com/actions/create-release<br>
https://mikefarah.gitbook.io/yq/<br>
https://www.heroku.com/<br>
https://github.com/koalaman/shellcheck<br>
https://docs.github.com/en/actions/reference/specifications-for-github-hosted-runners#supported-software<br>
https://docs.github.com/en/actions/reference/specifications-for-github-hosted-runners<br>
https://docs.github.com/en/actions/reference/events-that-trigger-workflows<br>
https://docs.github.com/en/actions/reference#workflow-syntax<br>
https://docs.github.com/en/free-pro-team@latest/actions/reference<br>
https://docs.github.com/en/actions/quickstart<br>

<br><br><br>


# <strong> Tasks </strong>

<br>

# task 0. Continuous Integration with GitHub Actions

[![Esta es una imagen de ejemplo](https://dduportal.github.io/public/holberton/m3-t0-0.png)](https://dduportal.github.io/public/holberton/m3-t0-0.png)

Después del trabajo que ha realizado con éxito al probar el sitio web y su API, desea automatizar esto un poco más.

Su objetivo es asegurarse de que todas las validaciones (lint, compilación, pruebas) se ejecuten automáticamente en el código:

- Al menos una vez al día para garantizar que el código esté siempre listo para implementarse (y que el proceso de compilación siga siendo válido y esté actualizado)
- Siempre que haya un cambio de código en la rama principal del repositorio
Desea usar GitHub Actions porque su código ya está almacenado en GitHub y es muy fácil comenzar con él.

? No dude en consultar el Inicio rápido de GitHub Actions para conocer los conceptos básicos y la Referencia de GitHub Actions para verificar las palabras clave y las opciones disponibles.

Se espera que cree un nuevo flujo de trabajo llamado module3_task0 con solo los siguientes pasos:

- Clonar el repositorio,
- Utilice ubuntu-22.04 como máquina virtual.
- Colóquese en el directorio correcto y ejecute el comando make help para validar que Makefile está presente e implementa el objetivo de ayuda.

Este flujo de trabajo debe activarse:

- Cada vez que hay un nuevo código insertado en su repositorio,
- Y una vez al día (a la hora que quieras).
Como GitHub impone la ubicación de los flujos de trabajo en .github/workflows, deberá crear un enlace simbólico en la raíz del directorio de "corrección" que proporcione.

<br><br>

# Requisitos
- Mismos requisitos que la tarea anterior:
  - Se proporciona un sitio web válido de Go-Hugo (en el canal de holgura de su cohorte).
  - No hay submódulos Git
  - El tema ananke está instalado.
  - Un archivo README.md actualizado con el estado del proyecto (⚠️ No olvide agregar una sección Flujo de trabajo)
- El archivo ./github-workflow.yml debe ser un enlace simbólico al archivo original <...>/.github/workflows/module3_task0.yml

```bash
➜ test -L github-workflow.yml && readlink github-workflow.yml
../.github/workflows/module3_task0.yml
```
- El archivo de flujo de trabajo original <...>/.github/workflows/module3_task0.yml debe ser:
  - Presente con una sintaxis YAML válida (puede verificar la sintaxis yaml con yamllint v1.*
  - Debe ser un flujo de trabajo de acción de GitHub válido con 1 trabajo y 1 paso
  -Debe tener 2 gatillos

```bash
➜ yamllint "$(readlink github-workflow.yml)" --no-warnings >/dev/null 2>&1 && echo OK
OK
➜ yq eval '.jobs.*.steps.[].name' "$(readlink github-workflow.yml)" | wc -l
2
```

  - El flujo de trabajo llamado module3_task0 debe estar habilitado en GitHub Actions y debe haberse ejecutado correctamente

```bash
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task0"
"main"
"success"
```

### Repo:

- ##### GitHub repository: holbertonschool-validation
- ##### Directory: ./module3_task0

<br><br><br><br>

# task 1. Agregar dependencias de compilación al entorno de CI
Ahora que ha configurado su primer flujo de trabajo, reemplacemos el comando make help por el comando make build.

El resultado debería ser una canalización fallida con un error como este:


[![Esta es una imagen de ejemplo](https://dduportal.github.io/public/holberton/m3-t1-0.png)](https://dduportal.github.io/public/holberton/m3-t1-0.png)



Como documenta GitHub Actions, las máquinas donde se ejecutan los trabajos del flujo de trabajo ya tienen algunas herramientas instaladas.

Puede ver que algunas herramientas necesarias para construir nuestra aplicación, como make o Golang, están disponibles. Pero faltan otros.

Hay 2 estrategias diferentes para resolver este desafío, cada una con sus pros y sus contras:

- Instale las herramientas durante la compilación:

  - ✅ Te asegura tener un sistema de instalación automatizado y siempre actualizado
  - ❌ pero ralentiza las compilaciones (tiene que esperar a que se instalen todas las herramientas mientras desea recibir comentarios lo antes posible)
- Asegúrese de que el flujo de trabajo se ejecute dentro de un entorno prediseñado con todas las herramientas necesarias

  - ✅ Comentarios rápidos: no necesita esperar a que se instalen las herramientas
  - ❌ Gastos generales de mantenimiento, ya que necesita administrar el entorno prediseñado
Para este módulo, usaremos la primera estrategia y la segunda se cubrirá en el módulo "Docker".

Debería ser un paso fácil: ya escribiste un script setup.sh cuya función era instalar a Hugo en el entorno de producción: ¡reutilicemos este trabajo!

Se espera que cree un nuevo flujo de trabajo denominado module3_task1 a partir del flujo de trabajo anterior.

Este nuevo flujo de trabajo debe ejecutar los siguientes objetivos como pasos distintos: build.

En cuanto al utillaje, hay que:

- Asegúrese de que el flujo de trabajo se ejecute en un entorno de ejecución de Ubuntu 22.04. A pesar de que es la misma imagen que la última de Ubuntu, asegúrese de usar Ubuntu 22.04
- Asegúrese de que todas las herramientas requeridas estén instaladas antes de cualquier objetivo de creación, ejecutando el script setup.sh
  - ⚠️ El script debe modificarse para instalar solo las herramientas que faltan (no se espera ningún objetivo de creación)
Para depurar localmente lo que necesita agregar en la imagen de acción de github, puede usar Docker. Utilice el Dockerfile enviado en el canal de holgura de su cohorte para crear una imagen similar a la utilizada por la acción de github. Creará una imagen local, hará girar un nuevo contenedor cargando esta imagen y podrá adaptar su secuencia de comandos ./setup.sh.

```bash
➜ ls
Dockerfile
➜ docker build -t ubuntu-22.04 .
...
➜ cd /module3_task1
➜ ls
...
setup.sh
...
➜ docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu-22.04 /bin/bash
student@04b970bbb59d:/app$ 
```
Ahora puede intentar ejecutar el script de instalación y corregirlo para que funcione en la imagen de acción de github.

# Requisitos
- Mismo requisito que el módulo anterior:

  - Un sitio web válido de Hugo
  - Makefile con los mismos objetivos, incluida la ayuda
  - Un archivo README.md actualizado con el estado del proyecto (⚠️ No olvide agregar una sección Crear flujo de trabajo)
- El archivo .github/workflows/module3_task1.yml debe estar presente

  - Debe ser válido en sintaxis YAML
  - Debe ser un flujo de trabajo de acción de GitHub válido con 1 trabajo con al menos 7 pasos (pagar, ejecutar setup.sh y luego los 5 comandos make)
  - Debe tener 2 gatillos

```bash
➜ yamllint "$(readlink github-workflow.yml)" --no-warnings >/dev/null 2>&1 && echo OK
OK
```

- El flujo de trabajo module3_task1 debe estar habilitado en GitHub Actions y debe haberse ejecutado correctamente
```bash
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task1"
"main"
"success"
```

### Repo:

- ##### GitHub repository: holbertonschool-validation
- ##### Directory: ./module3_task1

<br><br><br><br>

# task 2. Comentarios anteriores con entrega continua
Uno de los puntos clave en la cultura DevOps es hacer visible cualquier cambio para retroalimentar lo antes posible.


[![Esta es una imagen de ejemplo](https://dduportal.github.io/public/holberton/m3-t2-0.png)](https://dduportal.github.io/public/holberton/m3-t2-0.png)



(Fuente: http://cartoontester.blogspot.be/2010/01/big-bugs.html)

Como implementó un proceso de integración continua, significa que su equipo técnico puede obtener comentarios del proceso de compilación cada vez que se envía un cambio al repositorio remoto: el "Tiempo de retroalimentación" solo depende del tiempo de compilación y su la capacidad del equipo para responder a las notificaciones del sistema de compilación.

Pero como descubrió durante su primer día en “Awesome Inc.”, su equipo no es el único consumidor del código que escribe y mantiene.

Comencemos con el "equipo de operación": el área de especialización de este equipo es garantizar que todos los servidores de producción de "Awesome Inc." están operativas, lo que también incluye las aplicaciones que se ejecutan en estas máquinas. Quieren cierta estabilidad en los artefactos que produce para poder gestionar de forma segura las solicitudes de actualización de aplicaciones.

Después de una reunión con este equipo, se entera de que querrían evitar compilar la aplicación ellos mismos en cada implementación y, en su lugar, solicitan una entrega con documentación.

Su objetivo es extender la práctica de Integración Continua a una de Entrega Continua para reducir la fricción con este equipo:

- El resultado del nuevo proceso debe ser un archivo ZIP que contenga solo el binario awesome-api y el directorio dist/: estos son los únicos recursos que necesita el equipo de operaciones.

- La entrega continua tiene que ver con "la aplicación debe estar lista para implementarse en cualquier momento": el archivo ZIP debe generarse para cada confirmación en la rama principal:

Tendría (a menudo) una respuesta temprana si el archivo no se pudo crear/validar: no es necesario esperar a la próxima implementación
El proceso de "construcción" ES manejado por GitHub Actions para que cualquiera de su equipo pueda usarlo: puede irse de vacaciones sin estresarse y sus nuevos colegas contratados podrían crecer en sus roles.
Su trabajo es implementar este nuevo proceso:

- Agrega un nuevo paquete llamado make target que produce un archivo awesome-website.zip, que contiene el binario awesome-api y el directorio dist/.

- Escriba un documento de "implementación" llamado DEPLOY.md destinado a responder a las preguntas habituales del equipo de operaciones:

  - ¿Qué hay en el archivo y cómo desarchivarlo?
  - ¿Cuáles son los comandos para iniciar y detener la aplicación?
  - ¿Cómo personalizar dónde se escriben los registros de la aplicación?
  - ¿Cómo verificar “rápidamente” que la aplicación se está ejecutando (chequeo de salud)?
- Cree un nuevo flujo de trabajo llamado module3_task2, extendiendo el anterior que debe producir y archivar el archivo ZIP usando el paquete de destino si todas las pruebas y la validación se han ejecutado correctamente, pero solo en la rama principal (ya sea principal o principal, por ejemplo). necesita algunos elementos específicos de GitHub Action:

  - Ejecute un paso condicionalmente: https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions
  - Almacene datos de flujo de trabajo como artefacto (por ejemplo, almacene y asocie archivos a una ejecución de flujo de trabajo): https://docs.github.com/en/actions/guides/storing-workflow-data-as-artifacts
# Requisitos
- Mismo requisito que el módulo anterior:

  - Un sitio web válido de Hugo
  - Makefile con los mismos objetivos, incluida la ayuda
  - La documentación (README.md y Makefile) está actualizada con el estado del proyecto
- El archivo DEPLOY.md existe y no está vacío. Describe los 4 puntos descritos anteriormente.

- El paquete objetivo debe implementarse y documentarse. Debería crear un archivo llamado awesome-website.zip (no comprometido y eliminado por make clean).

- El lint de destino debe actualizarse para lint los archivos README.md y DEPLOY.md con la línea de comando markdownlint

- El archivo .github/workflows/module3_task2.yml debe estar presente

  - Debe ser válido en sintaxis YAML
  - Debe ser un flujo de trabajo de acción de GitHub válido con 1 trabajo con al menos 7 pasos
  - Debe tener 2 gatillos
- El flujo de trabajo "module3_task2" debe:

  - Ejecute siempre el paquete make target
  - Archivar el paquete generado solo en la rama principal
  - estar habilitado en GitHub Actions y debe haberse ejecutado correctamente
```bash
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task2"
"main"
"success"
```

### Repo:

- ##### GitHub repository: holbertonschool-validation
- ##### Directory: ./module3_task2

<br><br><br><br>

# task 3. Automatice los lanzamientos con etiquetas de Git y lanzamientos de GitHub

A medida que avanza con el nuevo proceso de Entrega continua, el departamento de ingeniería de “Awesome Inc.” está creciendo: se crea un nuevo equipo llamado "Team dev-B" y comienza a trabajar con su propio equipo ("Team dev-A") en el sitio web.

La tasa de cambios en la rama principal del repositorio se está disparando, y el equipo de operaciones le responde con una nueva solicitud. La cantidad de cambios hace que sea difícil rastrearlos y no pueden saber cuándo se debe implementar nuevamente el sitio web.

Durante la reunión con el equipo operativo, los miembros de su equipo también señalaron el riesgo que implica la implementación de los últimos cambios, ya que los cambios enviados a la rama principal a menudo fallan (debido a problemas de prueba la mayor parte del tiempo).

[![Esta es una imagen de ejemplo](https://dduportal.github.io/public/holberton/m3-t3-0.png)](https://dduportal.github.io/public/holberton/m3-t3-0.png)

Su objetivo es implementar un proceso de lanzamiento para que la aplicación se marque con una versión en un momento determinado.



Entonces, el equipo de operación siempre podría usar la versión liberada de la aplicación sin ningún riesgo, mientras que el resto del equipo puede continuar trabajando en el repositorio.

Se espera que cree un nuevo flujo de trabajo llamado module3_task3 (a partir del contenido de module3_task2) que se activará cuando se inserte una etiqueta Git en el repositorio remoto, además de los activadores reales.

Una ejecución de flujo de trabajo desencadenada por un nombre de etiqueta git 1.0.0 debería:

- Cree una versión de GitHub usando la acción de GitHub "softprops/gh-release" denominada 1.0.0 y apuntando a la etiqueta 1.0.0,
- Agregue el archivo impresionante-website.zip a la versión 1.0.0,
- Agregue el contenido del archivo DEPLOY.md como texto para el lanzamiento.
# Requisitos
- Mismos requisitos que el módulo anterior:

  - Un sitio web válido de Hugo
  - Makefile con los mismos objetivos, incluida la ayuda
  - La documentación (README.md, DEPLOY.md y Makefile) está actualizada con el estado del proyecto
- El archivo .github/workflows/module3_task3.yml debe estar presente

  - Debe ser válido en sintaxis YAML
  - Debe ser un flujo de trabajo de acción de GitHub válido
- El flujo de trabajo "module3_task3" debe:

  - Genere un archivo cuando lo active una etiqueta
  - Cree un lanzamiento con el archivo y el contenido de DEPLOY.md cuando lo active una etiqueta
  - Se comporta igual que "module3_task2" cuando se activa por algo más que una etiqueta (por ejemplo, archivo sin nombre de versión y sin publicación)
  - Estar habilitado en GitHub Actions y debe haberse ejecutado correctamente con una etiqueta 1.0.0

```bash
➜ curl --silent --show-error --user "${GH_USERNAME}:${GH_TOKEN}" "https://api.github.com/repos/${GH_USERNAME}/${GH_REPO}/actions/runs" | jq '.workflow_runs[0] | .name, .head_branch, .conclusion'
"module3_task3"
"main"
"success"
```


### Repo:

- ##### GitHub repository: holbertonschool-validation
- ##### Directory: ./module3_task3

<br><br><br><br>
