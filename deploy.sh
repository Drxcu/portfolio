#!/bin/bash
set -e

echo "Building Astro site..."
npm run build

echo "Deploying to server..."
scp -r dist/* drxcu@prodesk:/var/www/drxcu.com/

echo "Restarting Nginx..."
ssh drxcu@prodesk "sudo systemctl restart nginx"

echo "✅ Deployment complete!"