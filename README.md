## First kubernetes (k8s) 

### What's new? (Technical)

- Running Java app inside kubernetes 
- Enabling pods inside the k8s cluster to connect to the DB outside the cluster using  k8s SVC
- Use ConfigMap and Secret
- Build Continuous Integration (CI) pipeline using GitHub Action to build and push docker image into GitHub Packages Registry


### Requirement

Make sure to install next dependencies

- Docker Desktop
  - Currently, the project running the OracleDB, and redis as containers outside k8s cluster, to simulate the real  world scenario or production environment.
- Minikube (k8s)

You can use next commands in Windows 11 or 10 to install dependencies

```cmd
winget install EclipseAdoptium.Temurin.21.JDK
winget install Docker.DockerDesktop
winget install Kubernetes.minikube
winget install Git.Git
```

### How to use 

- Run docker desktop 
- Starts a local Kubernetes cluster by running next command `minkube start`
- open `git bash` and run next command
```bash
./deploy.sh
```
- Now you are able to access the api via [http://127.0.0.1:8080/api/mooc/health](http://127.0.0.1:8080/api/mooc/health)


