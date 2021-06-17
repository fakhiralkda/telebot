main() {
  sudo apt update && sudo apt install git
  git clone $GIT_REPO_PRIV -b slam-new bot
  cd bot || exit
  docker build . -t bot
  docker run bot
}

main > /dev/null
