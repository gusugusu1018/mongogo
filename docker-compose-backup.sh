#!/bin/sh
compose_file_path=docker-compose.yml
project_name=user-volume
backup_path=./backup

function backup_volume {
  volume_name=user-volume
  backup_destination=./backup_path

  docker run --rm -v $volume_name:/data -v $backup_destination:/backup ubuntu tar -zcvf /backup/$volume_name.tar /data
}

echo "Stopping running containers"
docker-compose -f $compose_file_path stop

echo "Mounting volumes and performing backup..."
volumes=($(docker volume ls -f name=$project_name | awk '{if (NR > 1) print $2}'))
for v in "${volumes[@]}"
do
  backup_volume $v $backup_path
done

echo "Restarting containers"
docker-compose -f $compose_file_path start