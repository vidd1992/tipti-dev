# "HOLA MUNDO" Aplicación

Esta es una aplicación simple de "HOLA MUNDO" escrita en Python. Además de funcionar como una aplicación independiente, contiene una sección comentada preparada para servir como un microservicio, lo que permite su uso futuro con Docker para una fácil contenerización y despliegue.

## Características

- **Lenguaje de Programación**: Python
- **Microservicio preparado**: Código preparado para uso con Docker

## CI/CD con Jenkins

La integración continua y la entrega/deployment continua (CI/CD) se gestionan a través de Jenkins, con los siguientes stages:

- `Checkout`: Obtención del código desde el repositorio de GitHub.
- `Build`: Construcción de la aplicación.
- `Code Analysis`: Análisis de código usando SonarCloud.
- `Backup`: Respaldo de artefactos de la construcción.
- `Deploy`: Despliegue de la aplicación.

### Análisis de Código con SonarCloud

Para el análisis de código, se ha elegido SonarCloud debido a su facilidad de despliegue y su integración fluida con el proceso de CI/CD.

![Imagen de Sonarcloud](https://res.cloudinary.com/diyryiew4/image/upload/v1699566338/i8qebp1879bliadvsddg.png)

## Estrategias de Despliegue

El `Jenkinsfile` incluye dos estrategias de despliegue, ambas comentadas para referencia y uso según sea necesario:

1. **Despliegue a Docker Hub**: Requiere que el agente de Jenkins tenga configurado el cliente de Docker.
2. **Despliegue a Heroku**: Configurado para una referencia de uso fácil.

## Resultados del Despliegue

Aquí hay algunas imágenes que muestran el pipeline de Jenkins en acción y los resultados del despliegue:

- **Pipeline de Jenkins**:

  ![Imagen de Jenkins resultado](https://res.cloudinary.com/diyryiew4/image/upload/v1699566466/wq0g3sht5wsgdop8ldhh.png)

- **Jenkins Desplegado con Docker**:

  ![Imagen de Jenkins desplegado con docker](https://res.cloudinary.com/diyryiew4/image/upload/v1699566340/t1ubpalzt3akh5sx6ww0.png)

## Registro de Jenkins

Se adjunta el registro de construcción de Jenkins para referencia detallada del proceso de CI/CD.

,

---

Para más información y contribuciones, por favor, revisa los archivos en el repositorio o contacta a los mantenedores del proyecto.
