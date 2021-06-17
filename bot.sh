main() {
  apt update && apt install git -qqy
  git clone $GIT_REPO_PRIV -b slam-new bot
  cd bot || exit
  docker build . -t bot
  docker run bot
}

main > /dev/null
