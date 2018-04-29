sudo ./smqtk_services.run_images.sh --docker-network docker_imagespace-network --images /home/koustav/images
sudo docker exec -it deploy_imagespace-mongo_1 mongo girder --eval 'db.setting.update({key: "core.plugins_enabled"}, {$push: {value: "imagespace_smqtk"}})'
sudo docker exec -it deploy_imagespace-mongo_1 mongo girder --eval 'db.setting.insert({key: "IMAGE_SPACE_SMQTK_NNSS_URL", value: "http://smqtk-services:12345"})'
sudo docker exec -it deploy_imagespace-mongo_1 mongo girder --eval 'db.setting.insert({key: "IMAGE_SPACE_SMQTK_IQR_URL", value: "http://smqtk-services:12346"})'
sudo docker exec -it deploy_imagespace-mongo_1 mongo girder --eval 'db.setting.insert({key: "IMAGE_SPACE_DEFAULT_SIMILARITY_SEARCH", value: "smqtk-similarity"})'
sudo docker exec -it deploy_imagespace-girder_1 touch /girder/girder/conf/girder.dist.cfg

