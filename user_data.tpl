#cloud-config
repo_update: true
repo_upgrade: all

write_files:
  - path: /tmp/nginx.conf
    content: |
      server {
        listen 80;
        location / {
            proxy_pass http://api:8000;
            proxy_redirect     off;
            proxy_set_header   Host $host;
            proxy_set_header   X-Real-IP $remote_addr;
            proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header   X-Forwarded-Host $server_name;
        }

        location /health {
            access_log off;
            return 200 'OK!';
            add_header Content-Type text/plain;
        }
      }
  - path: /tmp/docker-compose.yml
    content: |
      version: "3"
      services:
        web:
          image: nginx:alpine
          restart: unless-stopped
          links:
            - api
          ports:
            - "80:80"
          volumes:
              - "./nginx.conf:/etc/nginx/conf.d/default.conf"
        api:
          container_name: ${app_name}-${api_version}
          image: ${registry}/${app_name}:${api_version}
          restart: unless-stopped
          environment:
          %{for k, v in jsondecode(environment_variables) ~}
        - ${k}=${v}
          %{ endfor ~}

runcmd:
 - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 - apt-get update
 - apt-get -y install docker-ce
 - usermod -aG docker ubuntu
 - curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
 - chmod +x /usr/local/bin/docker-compose
 - systemctl start docker
 - mkdir /app
 - mv /tmp/docker-compose.yml /tmp/nginx.conf /app
 - chown ubuntu /app
 - su -l ubuntu -c "cd /app && docker-compose up -d"
