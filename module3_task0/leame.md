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
obligatorio
Ahora que ha configurado su primer flujo de trabajo, reemplacemos el comando make help por el comando make build.

El resultado debería ser una canalización fallida con un error como este: