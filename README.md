# openshift-kafka-ssm


Load resources (Templates, DeploymentConfigs, Services)

```
oc create -f https://raw.githubusercontent.com/ruivieira/openshift-kafka-ssm/master/resources.yaml
```

Deploy the Apache Kafka + Apache Zookeeper pod

```
oc new-app apache-kafka
```

## Credits

* This is based on work original by [Jim Minter](https://github.com/jim-minter) and of https://github.com/mattf/openshift-kafka by [Matthew Farrellee](https://github.com/mattf)
