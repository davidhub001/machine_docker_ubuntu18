docker run -ti <>   //lancer une terminale docker
docker build -t <nom projet> . //création conateneur
docker exec -ti <> /bin/bash //execute terminal 
docker ps -a  //liste container actis
docker rm <> //supprimer container
docker rmi <> //supprimer images 
docker run -p 8080:80 <> //
docker stop <>
sudo chown $USER:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock
