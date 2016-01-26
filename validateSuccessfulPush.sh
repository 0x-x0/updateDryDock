imageName=$1
defaultPushedTag=$2
tag=$3
slackWebhook=$4
channel=$5
tipImageId=`docker images | grep -w $imageName | grep $defaultPushedTag | awk {'print $3'}`
tagImageId=`docker images | grep -w $imageName | grep $tag | awk {'print $3'}`


if [ "$tagImageId" != "$tipImageId" ];
  then
  message="PUSH FAILED | \`"$imageName":"$tag"\` | ImageId \`"$tagImageId"\`"
else
  message="PUSH SUCCESSFUL | \`"$imageName":"$tag"\` | ImageId \`"$tagImageId"\`"
fi

curl -i -H "Content-Type:application/json" \ -X POST --data "{\"text\":\"$message\", \"channel\":\"$channel\", \"username\":\"dockerhub\"}" "$slackWebhook"
