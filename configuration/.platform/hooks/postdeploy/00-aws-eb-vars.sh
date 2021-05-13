#!/usr/bin/env bash

AWS_REGION=$(cat /opt/elasticbeanstalk/config/ebenvinfo/region)
AWS_ENV_ID=$(cat /opt/elasticbeanstalk/config/ebenvinfo/envid)
IMDS_TOKEN=$(curl --silent --max-time 60 -X PUT http://169.254.169.254/latest/api/token -H "X-aws-ec2-metadata-token-ttl-seconds: 30")
AWS_EC2_ID=$(curl --silent --max-time 60 -H "X-aws-ec2-metadata-token: $IMDS_TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
cat <<EOT>> /opt/elasticbeanstalk/deployment/env
AWS_REGION=$AWS_REGION
AWS_ENV_ID=$AWS_ENV_ID
AWS_EC2_ID=$AWS_EC2_ID
EOT
