  echo "Starting deployment script"

   # Check if the app folder exists
   if [ -d ~/azure-pipeline-nextJs ]; then
       echo "App folder exists. Running pm2 script..."
      pm2 stop ~/azure-pipeline-nextJs/pm2.json
       rm -rf ~/azure-pipeline-nextJs
   fi
   
   mv build ~/
   mv ~/build ~/azure-pipeline-nextJs
   cd ~/azure-pipeline-nextJs
   rm -rf node_modules
   pnpm install
   pm2 start ~/azure-pipeline-nextJs/pm2.json
   echo "End deployment script"