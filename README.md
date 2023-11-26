
<p float="left">
  <img src="https://avatars.githubusercontent.com/u/107424" width="10%" />
  <img src="https://avatars.githubusercontent.com/u/983927" width="10%" />
</p>


#  grid
Docker image combining Jenkins  <img src="https://avatars.githubusercontent.com/u/107424" width="1.5%" /> and Selenium Grid  <img src="https://avatars.githubusercontent.com/u/983927" width="1.5%" />

I created this Docker image to combine both [Jenkins](https://github.com/jenkinsci/jenkins) <img src="https://avatars.githubusercontent.com/u/107424" width="1.5%" /> and [Selenium Grid](https://github.com/SeleniumHQ/docker-selenium)  <img src="https://avatars.githubusercontent.com/u/983927" width="1.5%" /> into one single image. It's useful to me and I hope other people can find it useful too.

### How to use
```
sudo docker pull ghcr.io/abosaad11/grid:0.5
sudo docker run -d -p 4444:4444 -p 1800:8080 --name=grid -it -v $HOME/grid:/var/jenkins_home ghcr.io/abosaad11/grid:0.5
```

### Updates
I do not intend to update this image. However, if you wanted to update it fork this repository and run the action. If you don't want to publish the image to the Github Container Registry and would like to build it locally follow these steps:
- Clone the repository:
  ```
  git clone https://github.com/abosaad11/grid.git
  cd grid
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
  Now Jenkins <img src="https://avatars.githubusercontent.com/u/107424" width="1.5%" /> is available at `http://127.0.0.1:1800` and Selenium Grid  <img src="https://avatars.githubusercontent.com/u/983927" width="1.5%" /> at `http://127.0.0.1:4444`.
