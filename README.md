# docker-sync-with-s3
Docker image that runs a single cron job to sync files with S3 as defined via environment variables.

This image can be used to either sync files from a container to S3 or from S3 to a container. 

It is intended that a single instance of this image will run a single cron job and sync process. If you have multiple 
directories to sync, then you should run multiple containers each with the appropriate configuration for that directory. 

## Docker Hub
This image is built automatically on the Docker Hub as [silintl/sync-with-s3](https://hub.docker.com/r/silintl/sync-with-s3/)

## Running locally
1. Clone this repo
2. Copy ```local.env.dist``` to ```local.env``` and update values as appropriate
3. Run ```docker-compose up -d```

## Expected Environment Variables
1. ```ACCESS_KEY``` - AWS Access Key
2. ```SECRET_KEY``` - AWS Secret Access Key
3. ```CRON_SCHEDULE``` - Schedule for cron job, for every 15 minutes it would be: ```*/15 * * * *```
4. ```SOURCE_PATH``` - Source files to be synced, example: ```/var/www/uploads```
5. ```DESTINATION_PATH``` - Destination of where to sync files to, example: ```s3://my-bucket/site-uploads```
6. ```BUCKET_LOCATION``` - AWS Region for bucket, ex: ```us-east-1```

## Volumes
You will need to define volumes in your Docker configuration for sharing filesystem between your application 
ccontainers and this sync container.
