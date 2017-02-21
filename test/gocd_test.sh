assert_ok() {
  COUNTER_OK=$((COUNTER_OK+1))
  COUNTER=$((COUNTER+1))
  echo "ok $COUNTER $scenario"
}

assert_ko() {
  COUNTER=$((COUNTER+1))
  echo "ko $COUNTER $scenario"
}

COUNTER=0
COUNTER_OK=0

scenario="Docker-in-docker is working"
docker exec -it gocd_dind_1 docker run hello-world >/dev/null
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

scenario="GoCD server is running"
docker exec -it gocd_gocd-server_1 curl -o /dev/null --silent -L --insecure https://localhost:8154
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

scenario="GoCD server agentAutoRegisterKey is defined"
docker exec -it gocd_gocd-server_1 cat /var/lib/go-server/config/gocd-server-config.xml  | grep "agentAutoRegisterKey=\"388b633a88de126531afa41eff9aa69e\"" >/dev/null
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

scenario="GoCD server backup is working"
docker exec -it gocd_gocd-server_1 curl -o /dev/null --silent -L --insecure 'https://localhost:8154/go/api/backups' \
        -H 'Confirm: true' \
        -H 'Accept: application/vnd.go.cd.v1+json' \
        -X POST
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

scenario="GoCD agent / server communication is ok"
docker exec -it gocd_gocd-agent_1 curl -o /dev/null --silent -L --insecure https://gocd-server:8154
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

scenario="GoCD agent / docker-ind-docker communication is ok"
docker exec -it gocd_gocd-agent_1 docker run hello-world >/dev/null
status=$?
[ $status -eq 0 ] && assert_ok || assert_ko

echo "$COUNTER_OK..$COUNTER"
