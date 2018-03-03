# openshift-kafka-ssm


Load resources (Templates, DeploymentConfigs, Services)

```
oc create -f https://raw.githubusercontent.com/ruivieira/openshift-kafka-ssm/master/resources.yaml
```

Deploy the Apache Kafka + Apache Zookeeper pod

```
oc new-app apache-kafka
```

3. Deploy a debugging container and connect to it
```bash
oc run -it --rm kafka-debug --image=ruivieira/openshift-kafka-ssm --command -- bash
```

4. Create a topic
```bash
bin/kafka-topics.sh --create --zookeeper apache-kafka --replication-factor 1 --partitions 1 --topic test
```

5. List topics
```bash
bin/kafka-topics.sh --list --zookeeper apache-kafka
```

6. Send some messages
```bash
bin/kafka-console-producer.sh --broker-list apache-kafka:9092 --topic test <<EOF
foo
bar
baz
EOF
```

7. Receive some messages
```bash
bin/kafka-console-consumer.sh --bootstrap-server apache-kafka:9092 --topic test --from-beginning
```

## Credits

* This is based on work original by [Jim Minter](https://github.com/jim-minter) and of https://github.com/mattf/openshift-kafka by [Matthew Farrellee](https://github.com/mattf)
