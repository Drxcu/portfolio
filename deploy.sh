#!/bin/bash
set -e

echo "Building Astro site..."
npm run build

echo "Deploying to server..."
scp -r dist/* drxcu@ssh.drxcu.com:/var/www/drxcu.com/

echo "Restarting Nginx..."
ssh drxcu@ssh.drxcu.com "sudo systemctl restart nginx"

echo "✅ Deployment complete!"