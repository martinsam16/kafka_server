#!/bin/sh
CONTAINER_NAME=kafka_server

echo "Construyendo..."
sudo docker build -t $CONTAINER_NAME .
echo

echo "Corriendo..."
sudo docker run -d --name $CONTAINER_NAME $CONTAINER_NAME
echo
echo
echo "Esperando xd"
sleep 5;

echo "logs..."
sudo docker logs $CONTAINER_NAME
echo
echo

echo "Creando tópico..."
sudo docker exec -t -i $CONTAINER_NAME kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic TopicoXDefecto
echo
echo


IP_SERVER=$(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)
echo
echo
echo "INFO---------------------------------------------------------------------------------------------"
echo "Creador: Martín Alexis Samán Arata :D"
echo "La ip de tu server de kafka es: $IP_SERVER"
echo
echo "Conectarse al server  : sudo docker exec -t -i $CONTAINER_NAME sh"
echo "2. Crear topico       : sudo docker exec -t -i $CONTAINER_NAME kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic nombreTopico"
echo "Tópico creado por defecto: TopicoXDefecto"
echo
echo "Ver tópicos:  kafkacat -b $IP_SERVER:9092 -L"
echo
echo
