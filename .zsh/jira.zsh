jiraId () {
  echo $1 | grep -w -Eo "[A-Za-z]+-\d+"
}
