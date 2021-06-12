#!/usr/bin/env bash
# Export AWS environment specific values for use in EB applications and terminal

chmod 666 /opt/elasticbeanstalk/deployment/env
cat <<EOT >> /opt/elasticbeanstalk/deployment/env
AWS_REGION=$(cat /opt/elasticbeanstalk/config/ebenvinfo/region)
AWS_STACK_ID=$(cat /opt/elasticbeanstalk/config/ebenvinfo/stackid)
AWS_ENV_ID=$(cat /opt/elasticbeanstalk/config/ebenvinfo/envid)
AWS_EC2_ID=$(/opt/aws/bin/ec2-metadata --instance-id | cut -d" " -f2)
EOT
chmod 400 /opt/elasticbeanstalk/deployment/env

# NOTE: will need to restart web.service in 99-restart-services
