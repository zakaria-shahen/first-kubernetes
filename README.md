## first k8s deployment or cluster. 


### Requirement

Make sure to install next dependencies

- Java 21 
  - SET `JAVA_HOME` to java 21
- Docker Desktop
  - Currently, the project running the OracleDB, and redis as containers outside k8s cluster, to simulate the real use case or production environment.
- minikube (k8s)
- git

You can use next commands in Windows 11 or 10 to install dependencies

```cmd
winget install EclipseAdoptium.Temurin.21.JDK
winget install Docker.DockerDesktop
winget install Kubernetes.minikube
winget install Git.Git
```

### How to use 

- open git bash and run next command 
```bash
./delpoy.sh
```

