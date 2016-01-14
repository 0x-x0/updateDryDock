docker pull drydock/u12clo:tip
docker tag -f drydock/u12clo:tip drydock/u12clo:2016q1
docker tag -f drydock/u12clo:tip drydock/u12clo:prod
docker tag -f drydock/u12clo:tip drydock/u12clo:latest
echo "Pushing ---> drydock/u12clo:2016q1 <---"
docker push drydock/u12clo:2016q1
echo "Pushed ---> drydock/u12clo:2016q1 <---"
echo "Pushing ---> drydock/u12clo:prod <---"
docker push drydock/u12clo:prod
echo "Pushed ---> drydock/u12clo:prod <---"
echo "Pushing ---> drydock/u12clo:latest <---"
docker push drydock/u12clo:latest
echo "Pushed ---> drydock/u12clo:latest <---"
echo "Removing ---> drydock/u12clo <---"
docker rmi -f drydock/u12clo:tip drydock/u12clo:2016q1 drydock/u12clo:prod drydock/u12clo:latest
