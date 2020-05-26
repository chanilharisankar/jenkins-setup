# Setup basic jenkins using docker

1.  Using docker-compose
   
    * Run following command in the root directory

      ```
      docker-compose up
      ```
    * open localhost:8080 in browser, you should see jenkins up and running and it is asking for key.

    * run following command to get the key
      ```
      docker exec -it jenkins-blueocean /bin/sh
      cat /var/jenkins_home/secrets/initialAdminPassword
      ```
    * use the key to login to jenkins 
    * wait till Jenkins installs plugins

2.  Using docker commands

      jenkins-setup.sh contains all docker commands to bring jenkins up. You just need to run following command.
          
      ```
      bash jenkins-setup.sh
      ```