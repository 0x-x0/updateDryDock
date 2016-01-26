account="drydock"
tip="tip"
declare -a bases=('u12' 'u14')
declare -a languages=('nod' 'pyt')
declare -a languageVersions=('' 'pls' 'all')
declare -a tags=('2016q1' 'prod' 'latest')

echo "Enter Slack Webhook Url, followed by [ENTER]:"
read slackWebhook

for base in "${bases[@]}"
  do
    for language in "${languages[@]}"
      do
        for languageVersion in "${languageVersions[@]}"
          do
            echo 'docker pull '$account'/'$base$language$languageVersion':'$tip
            for tag in "${tags[@]}"
              do
                echo 'docker tag -f '$account'/'$base$language$languageVersion':'$tip' '$account'/'$base$language$languageVersion':'$tag
                echo 'docker push '$account'/'$base$language$languageVersion':'$tag
                echo 'docker pull '$account'/'$base$language$languageVersion':'$tag
                echo './validateSuccessfulPush.sh' $account'/'$base$language$languageVersion $tip $tag $slackWebhook
              done
          done
      done
  done