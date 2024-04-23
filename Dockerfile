FROM node:20

COPY . .
RUN npm i --omit=dev --no-package-lock
USER node


# Define environment variables

  ENV OLLAMA=http://host.docker.internal:11434 \
      # Discord bot token 
      TOKEN=${TOKEN} \
      # LLM model to use
      MODEL=${MODEL} \
      # Ollama URL (if you want to use multiple, separate them by commas)
      OLLAMA=${OLLAMA} \
      # Channel ID from discord. Can be a comma separated list
      CHANNELS=${CHANNELS} \
      # System message that the language model can understand
      SYSTEM=${SYSTEM} \
      # Use the system message above? (true/false)
      USE_SYSTEM=${USE_SYSTEM} \
      # Use the model's system message? (true/false) If both are specified, model system message will be first
      USE_MODEL_SYSTEM=${USE_MODEL_SYSTEM} \
      # Require users to mention the bot to interact with it? (true/false)
      REQUIRES_MENTION=${REQUIRES_MENTION} \
      # Whether to show a message at the start of a conversation (true/false)
      SHOW_START_OF_CONVERSATION=${SHOW_START_OF_CONVERSATION} \
      # Whether to use a random Ollama server or use the first available one (true/false)
      RANDOM_SERVER=${RANDOM_SERVER} \
      # Whether to add a message before the first prompt of the conversation (can leave blank)
      INITIAL_PROMPT=${INITIAL_PROMPT} \
      # Whether to add a message before the first prompt of the conversation (true/false)
      USE_INITIAL_PROMPT=${USE_INITIAL_PROMPT}



CMD ["node","./src/index.js"]
