# grid
Docker image combining Jenkins and Selenium Grid

I created this Docker image to combine both [Jenkins](https://github.com/jenkinsci/jenkins) and [Selenium Grid](https://github.com/SeleniumHQ/docker-selenium) into one single image. It's useful to me and I hope other people can find it useful too.

## How to use
```
sudo docker pull ghcr.io/abosaad11/grid:0.5
sudo docker volume create jenkinss_data
sudo docker run -d -p 4444:4444 -p 1800:8080 --name=grid -it -v $HOME/grid:/var/jenkins_home ghcr.io/abosaad11/grid:0.5
```
## Updates
I do not intend to update this image. However, if you wanted to update it fork this repository and run the action. If you don't want to publish the image to the Github Container Registry and would like to build it locally follow these steps:
- Clone the repository:
  ```
  https://github.com/abosaad11/grid.git
  ```
- Build the image:
  ```
sudo docker build -t name/yourimage:version .
Example:
sudo docker build -t me/grid:3.4 .
  ```
That last dot is important, do not delete it.
- Run the image:
  ```
  sudo docker run -d -p 4444:4444 -p 1800:8080 --name=grid -it -v $HOME/grid:/var/jenkins_home me/grid:3.4
  ```
